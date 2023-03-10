{ config, lib, terraform-nixos, ...}:
with lib; 
let
  cfg = config.proxmox;
  mkProxBoolOption = { description, ... }@args: mkOption ({
    type = with types; nullOr bool;
    apply = b: if b then 1 else 0;
    default = false;
  } // args);
  networkOptions = {...}: {
    options = {
      model = mkOption {
        type = types.str;
        default = "virtio";
        description = ''
          Network Card Model.
          The virtio model provides the best performance with very low CPU overhead.
          If your guest does not support this driver, it is usually best to use e1000.
        '';
      };
      macaddr = mkOption {
        type= with types; nullOr str;
        default = null;
        description = "Override the randomly generated MAC Address for the VM";
      };
      bridge = mkOption {
        type = types.str;
        default = "nat";
        description = "Bridge to which the network device should be attached";
      };
      tag = mkOption {
        type = with types; nullOr ints.positive;
        default = null;
        apply = tag: if tag != null then tag else -1;
        description = "The VLAN tag to apply to packets on this device";
      };
      firewall = mkEnableOption "the Proxmox firewall on this network device";
    };
  };
  diskOptions = {...}: {
    options = {
      type = mkOption {
        type = types.enum ["ide" "sata" "scsi" "virtio"];
        default = "virtio";
        description = "The type of disk device to add";
      };
      storage = mkOption {
        type = types.str;
        description = "he name of the storage pool on which to store the disk";
        example = "local-lvm";
      };
      size = mkOption {
        type = types.strMatching "[0-9]+[GMK]";
        description = "The size of the created disk";
      };
      ssd = mkProxBoolOption {
        description = "Whether to enable SSD emulation on disk";
      };
      discard = mkOption {
        type = with types; nullOr bool;
        default = false;
        apply = b: if b == null then null else if b then "on" else "ignore";
        description = "Controls whether to pass discard/trim requests to the underlying storage";
      };

    };
  };
  # Adapted from https://github.com/NixOS/nixpkgs/blob/nixos-22.11/nixos/modules/security/acme/default.nix
  inheritableModule = isDefaults: { config, ...}: let
    defaultAndText = name: default: {
      default = if isDefaults then default else cfg.defaults.qemu.${name};
      defaultText = if isDefaults then default else "config.proxmox.defaults.qemu.${name}";
    };
  in {
    options = {
      target_node = mkOption {
        type = with types; if isDefaults then nullOr str else str;
        inherit (defaultAndText "target_node" null) default defaultText; 
        description = ''
          The name of the Proxmox Node on which to place the VM
        '';
      };
      bios = mkOption {
        type = types.enum [ "seabios" "ovmf" ];
        inherit (defaultAndText "bios" "ovmf") default defaultText;
        description = "BIOS mode to use";
      };
      onboot = mkOption {
        type = with types; nullOr bool;
        inherit (defaultAndText "onboot" null) default defaultText;
        description = ''
          Whether to start this VM on PVE startup
        '';
      };
      boot = mkOption {
        type = with types; nullOr str;
        inherit (defaultAndText "boot" null) default defaultText;
        description = ''
          The boot order for the VM. Ordered string of characters denoting boot order.
          Options: floppy (a), hard disk (c), CD-ROM (d), or network (n).
        '';
      };
      agent = mkOption {
        type = with types; nullOr bool;
        apply = b: 
          # Only apply transform on "real" config, defaults should stay as a bool
          if isDefaults then
            b
          else 
            if b then 1 else 0;
        inherit (defaultAndText "agent" true) default defaultText;
        description = ''
          Wether to enable the QEMU Guest Agent.
          Note: you must run the qemu-guest-agent daemon in the guest for this to have any effect.
        '';
      };
      iso = mkOption {
        type = with types; nullOr str;
        inherit (defaultAndText "iso" null) default defaultText;
        description = ''
          The name of the ISO image to mount to the VM.
          Only applies when clone is not set.
          Note: iso is mutually exclussive with clone and pxe
        '';
        example = "local:iso/debian.iso";
      };
      pxe = mkOption {
        type = with types; nullOr bool;
        inherit (defaultAndText "pxe" null) default defaultText;
        description = ''
          PXE boot of the VM. Requires network be set first in boot
          Note: pxe is mutually exclussive with clone and iso
        '';
      };
      clone = mkOption {
        type = with types; nullOr str;
        inherit (defaultAndText "clone" null) default defaultText;
        description = ''
          The base VM from which to clone to create the new VM.
          Note: clone is mutually exclussive with pxe and iso
        '';
      };
      full_clone = mkOption {
        type = types.bool;
        inherit (defaultAndText "full_clone" null) default defaultText;
        description = ''
          Wether to perform a full clone.
          See https://pve.proxmox.com/pve-docs/chapter-qm.html#qm_copy_and_clone for documentation
        '';
      };
      memory = mkOption {
        type = types.ints.positive;
        inherit (defaultAndText "memory" 512) default defaultText;
        description = "The amount of memory to alloate to the VM in MB";
      };
      balloon = mkOption {
        type = with types; nullOr ints.unsigned;
        inherit (defaultAndText "balloon" null) default defaultText;
        description = ''
          The minimum amount of memory to allocate to the VM in MB.
          See https://pve.proxmox.com/pve-docs/chapter-qm.html#qm_memory for documentation.
        '';
      };
      sockets = mkOption {
        type = types.ints.positive;
        inherit (defaultAndText "sockets" 1) default defaultText;
        description = "The number of CPU sockets to allocate to the VM";
      };
      cores = mkOption {
        type = types.ints.positive;
        inherit (defaultAndText "cores" 1) default defaultText;
        description = "The number of CPU cores per socket to allocate to the VM";
      };
      numa = mkOption {
        type = with types; nullOr bool;
        inherit (defaultAndText "numa" null) default defaultText;
        description = ''
          Non-Uniform Memory Access
          See https://pve.proxmox.com/pve-docs/chapter-qm.html#_numa for documentation
        '';
      };
      pool = mkOption {
        type = with types; nullOr str;
        inherit (defaultAndText "pool" null) default defaultText;
        description = "The resource pool to which the VM will be added";
      };
      tags = mkOption {
        type = with types; nullOr str; # TODO Make this a list of strings and join or something?
        inherit (defaultAndText "tags" null) default defaultText;
        description = "Tags of the VM. This is only meta information.";
      };
      os_type = mkOption {
        type = with types; nullOr (enum [ "ubuntu" "centos" "cloud-init" ]);
        inherit (defaultAndText "os_type" null) default defaultText;
        description = "Which provisioning method to use, based on the OS type.";
      };
      sshkeys = mkOption {
        type = with types; nullOr lines;
        inherit (defaultAndText "sshkeys" null) default defaultText;
        description = "SSH public keys to add to authorized keys file for cloud-init user";
      };
      flake = mkOption {
        type = with types; nullOr str;
        inherit (defaultAndText "flake" null) default defaultText;
        description = ''
          Flake to use for deploying NixOS configuration changes via https://github.com/numtide/terraform-deploy-nixos-flakes
          Use null to skip attempting to deploy NixOS configuration changes.
        '';
      };
    };
  };
  qemuOptions = { name, ... }: {
    options = {
      enable = mkEnableOption "deploying this VM";
      name = mkOption {
        type = types.str;
        default = "${name}";
        description = "Name of the VM";
        defaultText = "\${name}";
      };
      vmid = mkOption {
        type = with types; nullOr (ints.between 100 2147483647); # TODO what's the actual upper limit?
        default = null;
        description = ''
          VMID to use for creation or `null` to auto-assign the next available ID
        '';
      };
      desc = mkOption {
        type = types.str;
        default = "Terraform managed VM";
        description = ''
          The description of the VM. Shows as the 'Notes' field in the Proxmox GUI.
        '';
      };
      startup = mkOption {
        type = with types; nullOr str;
        default = null;
        description = "The Proxmox startup/shutdown behaviour";
      };

      network = mkOption {
        type = with types; listOf (submodule networkOptions);
        default = [];
        description = "Network devices to attach to this VM";
      };

      disk = mkOption {
        type = with types; nullOr (listOf (submodule diskOptions));
        default = null;
        description = "Disks to attach to this VM";
      };
    };
  };
in 
{
  options.proxmox = {
    qemu = mkOption {
      default = {};
      description = "Qemu VMs deployed to PVE";
      type = with types; attrsOf (submodule [(inheritableModule false) qemuOptions]);
    };
    defaults.qemu = mkOption {
      type = types.submodule (inheritableModule true);
      description = ''
        Default values inheritable by all Qemu VMs.
      '';
    };
  };

  config =
    let
      forEachQemu = func: mapAttrs' (_: func) cfg.qemu;
    in
    mkIf (cfg.qemu != {}) { 
      proxmox.enable = true; 

      resource.time_sleep = forEachQemu (vm_config:  {
        name = "${vm_config.name}_cloud_init_delay";
        value = mkIf vm_config.enable {
          # Seems to take about 2 minutes in my experience. Use 90s in case it's quicker sometimes
          # TODO can/should we just increase the timeout used by deploy_nixos step?
          create_duration = mkDefault "90s";
          triggers =  {
            "${vm_config.name}" = "\${proxmox_vm_qemu.${vm_config.name}.ssh_host}";
          };
        };
      });

      resource.tls_private_key = forEachQemu (vm_config: {
        name = "${vm_config.name}_ssh_key";
        value = mkIf vm_config.enable {
          algorithm = "RSA";
          rsa_bits = 4096;
        };
      });

      resource.proxmox_vm_qemu = forEachQemu (vm_config:
        let
          qemu_config = (builtins.removeAttrs vm_config [
            "enable"
            "flake"
          ]) // {
            sshkeys = "\${tls_private_key.${vm_config.name}_ssh_key.public_key_openssh}";
          };
        in {
          name = vm_config.name;
          value = mkIf vm_config.enable qemu_config;
        });

      module = forEachQemu (vm_config: {
        name = "${vm_config.name}_deploy_nixos";
        value = mkIf (vm_config.enable && vm_config.flake != null) {
          source = terraform-nixos;
          flake = vm_config.flake;
          flake_host = vm_config.name;
          # Access through timer to allow for cloud-init to provision ssh
          # TODO potentially could provision through the QEMU agent somehow... Would be *very* custom
          target_host = "\${time_sleep.${vm_config.name}_cloud_init_delay.triggers[\"${vm_config.name}\"]}";
          target_user = "root";
          ssh_private_key =
            let
              priv_key = "tls_private_key.${vm_config.name}_ssh_key.private_key_openssh";
            in if config.proxmox.show_deploy_ouptut then
            "\${nonsensitive(${priv_key})}"
            else
              "\${${priv_key}}";
          ssh_agent = false;
        };
      });
    };
}

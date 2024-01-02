{ config, lib, terraform-nixos, ... }:
with lib;
let
  cfg = config.proxmox;
  mkProxBoolOption = { description, ... }@args: mkOption ({
    type = with types; nullOr bool;
    apply = b: if b then 1 else 0;
    default = false;
  } // args);
  networkOptions = { ... }: {
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
        type = with types; nullOr str;
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
  diskOptions = { ... }: {
    options = {
      type = mkOption {
        type = types.enum [ "efidisk" "ide" "sata" "scsi" "virtio" ];
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
        description = ''
          Whether to enable SSD emulation on disk
          Not supported for `efidisk`
        '';
      };
      discard = mkOption {
        type = with types; nullOr bool;
        default = false;
        apply = b: if b == null then null else if b then "on" else "ignore";
        description = ''
          Controls whether to pass discard/trim requests to the underlying storage
          Not supported for `efidisk`
        '';
      };

    };
  };
  # Adapted from https://github.com/NixOS/nixpkgs/blob/nixos-22.11/nixos/modules/security/acme/default.nix
  inheritableModule = isDefaults: { config, ... }:
    let
      defaultAndText = name: default: {
        default = if isDefaults then default else cfg.defaults.qemu.${name};
        defaultText = if isDefaults then default else "config.proxmox.defaults.qemu.${name}";
      };
    in
    {
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
        scsihw = mkOption {
          type = types.str;
          inherit (defaultAndText "scsihw" "virtio-scsi-pci") default defaultText;
          description = "The SCSI controller type to be used";
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
        deployment_user = mkOption {
          type = types.str;
          inherit (defaultAndText "deployment_user" "root") default defaultText;
          description = mdDoc ''
            SSH user used to connect to the target host
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
      domain = mkOption {
        type = types.str;
        description = "Domain used for generate FQDN for provisioning";
        example = "local";
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
        default = [ ];
        description = "Network devices to attach to this VM";
      };

      disk = mkOption {
        type = with types; nullOr (listOf (submodule diskOptions));
        default = null;
        description = "Disks to attach to this VM";
      };
      
      args = mkOption {
        type = types.str;
        inherit (defaultAndText "args" "-smbios type=1,serial=ds=nocloud;h=${name}") default defaultText;
        description = mdDoc ''
          Arbitrary arguments passed to kvm.

          Default sets SMBIOS serial to configure cloud-init to set
          the hostname prior to networking being activated (thus ensuring DHCP uses the correct hostname)
        '';
      };
    };
  };
in
{
  options.proxmox = {
    qemu = mkOption {
      default = { };
      description = "Qemu VMs deployed to PVE";
      type = with types; attrsOf (submodule [ (inheritableModule false) qemuOptions ]);
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
      forEachQemu = func: mapAttrs' func cfg.qemu;
    in
    mkIf (cfg.qemu != { }) {
      proxmox.enable = true;

      resource.tls_private_key = forEachQemu (name: vm_config: {
        name = "${name}_ssh_key";
        value = mkIf vm_config.enable {
          algorithm = "RSA";
          rsa_bits = 4096;
        };
      });

      resource.proxmox_vm_qemu = forEachQemu (name: vm_config:
        let
          qemu_config = (builtins.removeAttrs vm_config [
            "enable"
            "flake"
            "domain"
            "deployment_user"
          ]) // {
            sshkeys = "\${tls_private_key.${name}_ssh_key.public_key_openssh}";
            qemu_os = "l26";
            args = "-smbios type=1,serial=ds=nocloud;h=${name}";
          };
        in
        {
          name = name;
          value = mkIf vm_config.enable qemu_config;
        });

      module = forEachQemu (name: vm_config: {
        name = "${name}_deploy_nixos";
        value = mkIf (vm_config.enable && vm_config.flake != null) {
          source = terraform-nixos;
          flake = vm_config.flake;
          flake_host = name;
          # TODO potentially could provision through the QEMU agent somehow... Would be *very* custom
          target_host = "\${proxmox_vm_qemu.${name}.name}.${vm_config.domain}";
          target_user = vm_config.deployment_user;
          ssh_private_key =
            let
              priv_key = "tls_private_key.${name}_ssh_key.private_key_openssh";
            in
            if config.proxmox.show_deploy_output then
              "\${nonsensitive(${priv_key})}"
            else
              "\${${priv_key}}";
          ssh_agent = false;
        };
      });
    };
}

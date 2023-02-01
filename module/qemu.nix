{ config, lib, terraform-nixos, ...}:
with lib; 
let
  cfg = config.proxmox.qemu;
  mkNullEnableOption = desc: mkOption {
    type = with types; nullOr bool;
    default = null;
    description = "Whether to enable ${desc}";
  };
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
  qemuOptions = { name, ... }: {
    options = {
      enable = mkEnableOption "deploying this VM";
      name = mkOption {
        type = types.str;
        default = "${name}";
        description = "Name of the VM";
        defaultText = "\${name}";
      };
      target_node = mkOption {
        type = types.str;
        description = ''
          The name of the Proxmox Node on which to place the VM
        '';
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
      bios = mkOption {
        type = types.enum [ "seabios" "ovmf" ];
        default = "ovmf";
        description = "BIOS mode to use";
      };
      onboot = mkNullEnableOption "the VM startup after the PVE node starts";
      startup = mkOption {
        type = with types; nullOr str;
        default = null;
        description = "The Proxmox startup/shutdown behaviour";
      };
      boot = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          The boot order for the VM. Ordered string of characters denoting boot order.
          Options: floppy (a), hard disk (c), CD-ROM (d), or network (n).
        '';
      };
      agent = mkProxBoolOption {
        default = true;
        description = ''
          Wether to enable the QEMU Guest Agent.
          Note: you must run the qemu-guest-agent daemon in the guest for this to have any effect.
        '';
      };
      iso = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          The name of the ISO image to mount to the VM.
          Only applies when clone is not set.
          Note: iso is mutually exclussive with clone and pxe
        '';
        example = "local:iso/debian.iso";
      };
      pxe = mkNullEnableOption ''PXE boot of the VM. Requires network be set first in boot
          Note: pxe is mutually exclussive with clone and iso
        '';
      clone = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          The base VM from which to clone to create the new VM.
          Note: clone is mutually exclussive with pxe and iso
        '';
      };
      full_clone = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Wether to perform a full clone.
          See https://pve.proxmox.com/pve-docs/chapter-qm.html#qm_copy_and_clone for documentation
        '';
      };
      memory = mkOption {
        type = types.ints.positive;
        default = 512;
        description = "The amount of memory to alloate to the VM in MB";
      };
      ballon = mkOption {
        type = with types; nullOr ints.unsigned;
        default = null;
        description = ''
          The minimum amount of memory to allocate to the VM in MB.
          See https://pve.proxmox.com/pve-docs/chapter-qm.html#qm_memory for documentation.
        '';
      };
      sockets = mkOption {
        type = types.ints.positive;
        default = 1;
        description = "The number of CPU sockets to allocate to the VM";
      };
      cores = mkOption {
        type = types.ints.positive;
        default = 1;
        description = "The number of CPU cores per socket to allocate to the VM";
      };
      numa = mkNullEnableOption ''
        Non-Uniform Memory Access
        See https://pve.proxmox.com/pve-docs/chapter-qm.html#_numa for documentation
      '';
      pool = mkOption {
        type = with types; nullOr str;
        default = null;
        description = "The resource pool to which the VM will be added";
      };
      tags = mkOption {
        type = with types; nullOr str; # TODO Make this a list of strings and join or something?
        default = null;
        description = "Tags of the VM. This is only meta information.";
      };
      os_type = mkOption {
        type = with types; nullOr (enum [ "ubuntu" "centos" "cloud-init" ]);
        default = null;
        description = "Which provisioning method to use, based on the OS type.";
      };
      sshkeys = mkOption {
        type = with types; nullOr lines;
        default = null;
        description = "SSH public keys to add to authorized keys file for cloud-init user";
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

      flake = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          Flake to use for deploying NixOS configuration changes via https://github.com/numtide/terraform-deploy-nixos-flakes
          Use null to skip attempting to deploy NixOS configuration changes.
        '';
      };
    };
  };
in 
{
  options.proxmox = {
    show_deploy_ouptut = mkEnableOption ''showing output from nixos_deploy
      May include sensitive information
    '';
    qemu = mkOption {
      default = {};
      description = "Qemu VMs deployed to PVE";
      type = with types; attrsOf (submodule qemuOptions);
    };
  };

  config =
    let
      forEachQemu = func: mapAttrs' (_: func) cfg;
    in
    mkIf (cfg != {}) { 
      proxmox.enable = true; 

      resource.time_sleep.cloud_init_delay = {
        # Seems to take about 2 minutes in my experience. Use 90s in case it's quicker sometimes
        # TODO can/should we just increase the timeout used by deploy_nixos step?
        create_duration = mkDefault "90s";
        triggers = forEachQemu (vm_config: {
          name = vm_config.name;
          value = "\${proxmox_vm_qemu.${vm_config.name}.ssh_host}";
        });
      };

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
          target_host = "\${time_sleep.cloud_init_delay.triggers[\"${vm_config.name}\"]}";
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

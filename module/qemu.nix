{ config, lib, ...}:
with lib; 
let
  cfg = config.proxmox.qemu;
  mkProxBoolOption = { description, default ? false, ... }@args: mkOption ({
    type = types.bool;
    apply = b: if b then 1 else 0;
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
      sdd = mkProxBoolOption {
        description = "Whether to enable SSD emulation on disk";
      };
      discard = mkProxBoolOption {
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
      description = mkOption {
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
      onboot = mkEnableOption "the VM startup after the PVE node starts";
      startup = mkOption {
        type = with types; nullOr str;
        default = null;
        description = "The Proxmox startup/shutdown behaviour";
      };
      boot = mkOption {
        type = types.str;
        default = "cdn";
        description = ''
          The boot order for the VM. Ordered string of characters denoting boot order.
          Options: floppy (a), hard disk (c), CD-ROM (d), or network (n).
        '';
      };
      agent = mkProxBoolOption {
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
      pxe = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to enable PXE boot of the VM. Requires network be set first in boot
          Note: pxe is mutually exclussive with clone and iso
        '';
      };
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
      numa = mkEnableOption ''
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
        type = with types; listOf (submodule diskOptions);
        default = [];
        description = "Disks to attach to this VM";
      };
    };
  };
in 
{
  options.proxmox.qemu = mkOption {
    default = {};
    description = "Qemu VMs deployed to PVE";
    type = with types; attrsOf (submodule qemuOptions);
  };

  config = mkIf (cfg != {}) {
    proxmox.enable = true;
    resource.proxmox_vm_qemu = mapAttrs'
      (_: qemu_config: {
        name = "${qemu_config.name}";
        value = mkIf qemu_config.enable (builtins.removeAttrs qemu_config ["enable"]);
      });
  };
}
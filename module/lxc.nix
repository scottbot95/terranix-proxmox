{ config, lib, terraform-nixos, ...}:
with lib;
let
  cfg = config.proxmox;
  vmidType = types.ints.between 100 2147483647; # TODO what's the actual upper limit?
  inheritableModule = isDefaults: { config, ... }: let
    defaultAndText = name: default: let
      nameParts = splitString "." name;
    in {
      default = if isDefaults then default else getAttrFromPath nameParts cfg.defaults.lxc;
      defaultText = if isDefaults then default else "config.proxmox.defaults.lxc.${name}";
    };
    mkDefaultOption = name: default: args: mkOption ({
      inherit (defaultAndText name default) default defaultText;
    } // args);
  in {
    options = {
      target_node = mkDefaultOption "target_node" null {
        type = with types; if isDefaults then nullOr str else str;
        description = ''
          The name of the Proxmox Node on which to place the VM
        '';
      };
      ostemplate = mkDefaultOption "ostemplate" null {
        type = with types; nullOr str;
        description = ''
          The volume identifier that points to the OS template or backup file.
        '';
      };
      flake = mkDefaultOption "flake" null {
        type = with types; nullOr str;
        description = ''
          Flake to use for deploying NixOS configuration changes via https://github.com/numtide/terraform-deploy-nixos-flakes
          Use null to skip attempting to deploy NixOS configuration changes.
        '';
      };
      domain = mkDefaultOption "domain" null {
        type = with types; nullOr str;
        description = ''
          Domain to use when deploying 
        '';
        default = "localdomain";
      };
      arch = mkDefaultOption "arch" null {
        type = with types; nullOr str;
        description = ''
          Sets the container OS architecture type.
        '';
      };
      clone = mkDefaultOption "clone" null {
        type = with types; nullOr vmidType;
        description = ''
          VMID of LXC to clone
        '';
      };
      clone_storage = mkDefaultOption "clone_storage" null {
        type = with types; nullOr str;
        description = ''
          Target storage for full clone.
        '';
      };
      cores = mkDefaultOption "cores" null {
        type = with types; nullOr ints.positive;
        description = ''
          The number of cores assigned to the container.
          A container can use all available cores by default.
        '';
      };
      cpulimit = mkDefaultOption "cpulimit" null {
        type = with types; nullOr ints.positive;
        description = ''
          A number to limit CPU usage by.
        '';
      };
      cpuunits = mkDefaultOption "cpuunits" null {
        type = with types; nullOr ints.positive;
        description = ''
          A number of the CPU weight that the container possesses.
        '';
      };
      features = mkOption {
        description = ''
          An object for allowing the container to access advanced features.
        '';
        default = {};
        type = types.submodule ({...}: {
          options = {
            fuse = mkDefaultOption "features.fuse" null {
              type = with types; nullOr bool;
              description = ''
                A boolean for enabling FUSE mounts.
              '';
            };
            keyctl = mkDefaultOption "features.keyctl" null {
              type = with types; nullOr bool;
              description = ''
                A boolean for enabling the `keyctl()` system call.
              '';
            };
            mount = mkDefaultOption "features.mount" null {
              type = with types; nullOr str;
              description = ''
                Defines the filesystem types (separated by semicolons) that are allowed to be mounted.
              '';
            };
            nesting = mkDefaultOption "features.nesting" true {
              type = types.bool;
              description = ''
                A boolean to allow nested virtualization.
              '';
            };
          };
        });
      };
      force = mkDefaultOption "force" null {
        type = with types; nullOr bool;
        description = ''
          A boolean that allows the overwriting of pre-existing containers.
        '';
      };
      full = mkDefaultOption "full" null {
        type = with types; nullOr bool;
        description = ''
          When cloning, create a full copy of all disks.
          This is always done when you clone a normal CT.
          For CT template it creates a linked clone by default.
        '';
      };
      hookscript = mkDefaultOption "hookscript" null {
        type = with types; nullOr str;
        description = ''
          A string containing a volume identifier to a script that
          will be executed during various steps throughout the container's lifetime.
          The script must be an executable file.
        '';
      };
      memory = mkDefaultOption "memory" null {
        type = with types; nullOr ints.positive;
        description = ''
          A number containing the amount of RAM to assign to the container (in MB).
        '';
      };
      nameserver = mkDefaultOption "nameserver" null {
        type = with types; nullOr str;
        description = ''
          The DNS server IP address used by the container. 
          If neither nameserver nor searchdomain are specified, 
          the values of the Proxmox host will be used by default.
        '';
      };
      onboot = mkDefaultOption "onboot" null {
        type = with types; nullOr bool;
        description = ''
          Whether to start the container on boot.
        '';
      };
      password = mkDefaultOption "password" null {
        type = with types; nullOr str;
        description = ''
          Sets the root password inside the container.
          Doesn't seem to work with NixOS containers.
        '';
      };
      pool = mkDefaultOption "pool" null {
        type = with types; nullOr str;
        description = ''
          The name of the Proxmox resource pool to add this container to.
        '';
      };
      protection = mkDefaultOption "protection" null {
        type = with types; nullOr bool;
        description = ''
          A boolean that enables the protection flag on this container. 
          Stops the container and its disk from being removed/updated. 
          Default is false.
        '';
      };
      rootfs.size = mkDefaultOption "rootfs.size" null {
        type = with types; if isDefaults then nullOr str else str;
        description = ''
          Size of the underlying volume.
          Must end in G, M, or K (e.g. "1G", "1024M" , "1048576K").
          Cannot be changed after initial creation.
        '';
      };
      rootfs.storage = mkDefaultOption "rootfs.storage" null {
        type = with types; if isDefaults then nullOr str else str;
        description = ''
          A string containing the volume , directory, or device to be
          mounted into the container (at the path specified by mp).
          E.g. local-lvm, local-zfs, local etc.
        '';
      };
      ssh_public_keys = mkDefaultOption "ssh_public_keys" null {
        type = with types; nullOr lines;
        description = ''
          The name of the Proxmox resource pool to add this container to.
        '';
      };
      start = mkDefaultOption "start" null {
        type = with types; nullOr bool;
        description = ''
          A boolean that determines if the container is started after creation.
        '';
      };
      startup = mkDefaultOption "startup" null {
        type = with types; nullOr str;
        description = ''
          The startup and shutdown behaviour of the container.
        '';
        example = "order=1,up=5";
      };
      swap = mkDefaultOption "swap" null {
        type = with types; nullOr ints.positive;
        description = ''
          A number that sets the amount of swap memory available to the container.
        '';
      };
      tags = mkDefaultOption "tags" null {
        type = with types; nullOr str;
        description = ''
          Tags of the container. This is only meta information.
        '';
      };
      unique = mkDefaultOption "unique" null {
        type = with types; nullOr bool;
        description = ''
          Whether a unique random ethernet address is assigned to the container.
        '';
      };
      unprivileged = mkDefaultOption "unprivileged" true {
        type = with types; bool;
        description = ''
          A boolean that makes the container run as an unprivileged user.
        '';
      };
    };
  };
  networkOptions = {name, ...}: {
    options = {
      name = mkOption {
        type = types.str;
        default = "${name}";
        defaultText = "\${name}";
        description = ''
          The name of the network interface as seen from inside the container.
        '';
        example = "eth0";
      };
      hwaddr = mkOption {
        type= with types; nullOr str;
        default = null;
        description = "Override the randomly generated MAC Address for the container";
      };
      bridge = mkOption {
        type = types.str;
        description = "Bridge to which the network device should be attached";
      };
      firewall = mkEnableOption "the Proxmox firewall on this network device";
      ip = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          The IPv4 address of the network interface. 
          Can be a static IPv4 address (in CIDR notation), "dhcp", or "manual".
        '';
      };
      ip6 = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          The IPv6 address of the network interface. 
          Can be a static IPv6 address (in CIDR notation), "auto", "dhcp", or "manual".
        '';
      };
      tag = mkOption {
        type = with types; nullOr ints.positive;
        default = null;
        apply = tag: if tag != null then tag else -1;
        description = "The VLAN tag to apply to packets on this device";
      };
    };
  };
  mountOptions = {name, ...}: {
    options = {
      mp = mkOption {
        type = types.path;
        default = "${name}";
        defaultText = "\${name}";
        description = ''
          The path to the mount point as seen from inside the container. 
          The path must not contain symlinks for security reasons.
        '';
      };
      size = mkOption {
        type = types.str;
        description = ''
          Size of the underlying volume.
          Must end in G, M, or K (e.g. "1G", "1024M" , "1048576K").
          Cannot be changed after initial creation.
        '';
        example = "20G";
      };
      storage = mkOption {
        type = types.str;
        description = ''
          A string containing the volume , directory, or device to be mounted
          into the container (at the path specified by mp).
        '';
        example = "local-lvm";
      };
      acl = mkEnableOption "ACL support";
      backup = mkEnableOption "including this mount point in backups";
      quota = mkEnableOption "user quotas inside the container for this mount point";
      replicate = mkEnableOption "including this volume in a storage replica job";
      shared = mkEnableOption "marking this volume as available to all nodes";
    };
  };
  lxcOptions = {name, ...}: {
    options = {
      enable = mkEnableOption "deploying this container";
      name = mkOption {
        type = types.str;
        default = "${name}";
        defaultText = "\${name}";
        description = "Name to use when creating terraform resources";
      };
      hostname = mkOption {
        type = types.str;
        default = "${name}";
        defaultText = "\${name}";
        description = "Specifies the host name of the container.";
      };
      mountpoint = mkOption {
        type = with types; attrsOf (submodule mountOptions);
        default = {};
        description = ''
          An attribute set describing the mount points present in this container
        '';
      };
      network = mkOption {
        type = with types; attrsOf (submodule networkOptions);
        default = {};
        description = ''
          An attribute set describing the network adapters present in this container
        '';
      };
      vmid = mkOption {
        type = with types; nullOr vmidType; # TODO what's the actual upper limit?
        default = null;
        description = ''
          VMID to assign this container or `null` for next available ID
        '';
      };
    };
  };
in {
  options.proxmox = {
    defaults.lxc = mkOption {
      type = types.submodule (inheritableModule true);
      description = ''
        Default values inheritible by all LXC containers.
      '';
    };
    lxc = mkOption {
      default = {};
      type = with types; attrsOf (submodule [(inheritableModule false) lxcOptions]);
      description = "LXC containers deploy to PVE";
    };
  };

  config = 
    let
      forEachLxc = func: mapAttrs' (_: func) cfg.lxc;
      lxcConfigs = mapAttrsToList 
        (name: lxcConfig: 
          let
            mountpoint = builtins.attrValues lxcConfig.mountpoint;
            network = builtins.attrValues lxcConfig.network;
            lxcResource = builtins.removeAttrs ["mountpoint" "network"] lxcConfig;
          in {
            resource.proxmox_lxc.${name} = {
              inherit mountpoint network;
            } // lxcResource;
          })
        cfg.lxc;
    in
    mkIf (cfg.lxc != {}) {
      proxmox.enable = true;

      resource.tls_private_key = forEachLxc (lxcConfig: {
        name = "${lxcConfig.name}_ssh_key";
        value = mkIf lxcConfig.enable {
          algorithm = "RSA";
          rsa_bits = 4096;
        };
      });

      resource.proxmox_lxc = forEachLxc (lxcConfig: 
        let
          mountpoint = 
            imap0 (i: mp: { key = toString i; slot = i; } // mp)
              (builtins.attrValues lxcConfig.mountpoint);
          network = builtins.attrValues lxcConfig.network;
          ssh_public_keys = lxcConfig.ssh_public_keys + "\n\${tls_private_key.${lxcConfig.name}_ssh_key.public_key_openssh}";
          baseConfig = builtins.removeAttrs lxcConfig [
            "enable" "domain" "flake" "mountpoint"
            "name" "network" "ssh_public_keys"
          ];
        in {
          name = lxcConfig.name;
          value = mkIf lxcConfig.enable ({
            inherit mountpoint network ssh_public_keys;
          } // baseConfig);
        });

      module = forEachLxc (lxcConfig: {
        name = "${lxcConfig.name}_deploy_nixos";
        value = mkIf (lxcConfig.enable && lxcConfig.flake != null) {
          source = terraform-nixos;
          flake = lxcConfig.flake;
          flake_host = lxcConfig.hostname; 
          target_host = "${lxcConfig.hostname}.${lxcConfig.domain}";
          target_user = "root";
          ssh_private_key = 
            let
              priv_key = "tls_private_key.${lxcConfig.name}_ssh_key.private_key_openssh";
            in if config.proxmox.show_deploy_ouptut then
              "\${nonsensitive(${priv_key})}"
            else
              "\${${priv_key}}";

          # Ensure deployment depends on creation of container
          triggers.container = "\${proxmox_lxc.${lxcConfig.name}.id}";
        };
      });
    };
}
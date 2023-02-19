{lib, ...}: {
  imports = [
    ./provider.nix
    ./qemu.nix
    ./lxc.nix
  ];

  options.proxmox = {
    show_deploy_ouptut = lib.mkEnableOption ''showing output from nixos_deploy
      May include sensitive information
    '';
  };
}
{ config, lib, ... }:
let
  cfg = config.proxmox;
in
with lib; {
  options.proxmox = {
    enable = mkEnableOption ''
      proxmox provider
      See https://registry.terraform.io/providers/Telmate/proxmox for documentation
    '';

    provider = {
      version = mkOption {
        type = types.str;
        description = "Version of the telmate/proxmox provider to use";
      };

      endpoint = mkOption {
        type = types.str;
        description = ''
          Proxmox API endpoint
        '';
        example = "https://pve.example.com:8006/api2/json";
      };

      user = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          Proxmox user for API user authentication.
          May be also be provied through PM_USER environment variable
        '';
        example = "myuser@pve";
      };

      password = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          Proxmox password for API user authentication.
          May be also be provied through PM_PASSWORD environment variable
        '';
      };

      token_id = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          Proxmox token id for API token authentication.
          May be also be provied through PM_AP_TOKEN_ID environment variable
        '';
        example = "myuser@pve!terraform";
      };

      token_secret = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          Proxmox token secret for API token authentication.
          May be also be provied through PM_AP_TOKEN_SECRET environment variable
        '';
        example = "00000000-0000-0000-0000-000000000000";
      };

      log_level = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          Log level to use for proxmox provider or null to disable logging.

          Logs will be written to terraform-plugin-proxmox.log. This may be 
          overriden with provider.proxmox.pm_log_file
        '';
      };
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      terraform.required_providers.proxmox = {
        source = "telmate/proxmox";
        version = cfg.provider.version;
      };

      provider.proxmox = {
        pm_api_url = cfg.provider.endpoint;

        pm_user = cfg.provider.user;
        pm_password = cfg.provider.password;

        pm_api_token_id = cfg.provider.token_id;
        pm_api_token_secret = cfg.provider.token_secret;


      };
    })
    (mkIf (cfg.enable && cfg.provider.log_level != null) {
      provider.proxmox = {
        pm_log_enable = true;
        pm_log_file = mkDefault "terraform-plugin-proxmox.log";
        pm_log_levels = {
          _default = cfg.provider.log_level;
          _capturelog = "";
        };
      };
    })
  ];
}

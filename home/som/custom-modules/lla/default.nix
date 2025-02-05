{ config, lib, pkgs, ... }: with lib; let
  cfg = config.programs.lla;
  tomlFormat = pkgs.formats.toml { };
in {
  options = {
    programs.lla = {
      enable = mkEnableOption "lla";

      package = mkOption {
        type = types.package;
        default = pkgs.lla;
      };

      settings = mkOption {
        type = tomlFormat.type;
        default = { };
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."lla/config.toml" = lib.mkIf (cfg.settings != { }) {
      source = (tomlFormat.generate "config.toml" cfg.settings).overrideAttrs (final: prev: {
        buildCommand = lib.concatStringsSep "\n" [
          prev.buildCommand
          "substituteInPlace $out --replace-quiet '\\\\' '\\'"
        ];
      });
    };
  };
}

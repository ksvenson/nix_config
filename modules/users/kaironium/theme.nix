{ lib, config, pkgs, ... }:
  let
    inherit (lib)
      mkOption
      types
      ;
    systemFont = "JetBrainsMono Nerd Font";
  in {
    options.theme = {
      font = {
        name = mkOption {
          type = types.str;
          default = systemFont;
        };
        size = mkOption {
          type = types.int;
          default = 12;
        };
      };
    };

    config.home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
}

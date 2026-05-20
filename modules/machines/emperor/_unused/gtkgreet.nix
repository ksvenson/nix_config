{ config, lib, pkgs, ... }:
  let
    swayConfig = pkgs.writeText "greetd-sway-config" ''
      output * resolution 2560x1440@143.856Hz
      exec "${pkgs.greetd.gtkgreet}/bin/gtkgreet -l; swaymsg exit"
    '';
  in {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.sway}/bin/sway --config ${swayConfig} --unsupported-gpu";
        };
      };
    };
}

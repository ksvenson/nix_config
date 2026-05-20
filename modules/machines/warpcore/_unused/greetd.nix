{ config, pkgs, ... }:

let
  greetdSwayConfig = pkgs.writeText "greetd-sway-config" ''
    output * resolution 2560x1440@143.856Hz
    exec "${pkgs.greetd.regreet}/bin/regreet; swaymsg exit"
  '';
in
{
  programs.regreet.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.sway}/bin/sway --config ${greetdSwayConfig} --unsupported-gpu";
        user = "greeter";
      };
    };
  };
}

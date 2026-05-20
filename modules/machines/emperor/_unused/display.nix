{ config, pkgs, lib, ... }:
  let
    res = "2560x1440";
    rate = "143.856";

    greetdSwayConfig = pkgs.writeText "greetd-sway-config" ''
      output "DP-1" mode ${res}@${rate}Hz
      
      exec "${pkgs.greetd.regreet}/bin/regreet; swaymsg exit"
    '';
  in {
    boot.kernelParams = [ 
      "video=DP-1:${res}@${rate}"
      # "nvidia_drm.fbdev=1"  # prevent mode switching before login?
    ];
    
    boot.loader.grub = {
      gfxmodeEfi = res;
    };

    programs.regreet.enable = true;

    services.greetd = {
      enable = true;
      settings.default_session.command = lib.mkForce "${pkgs.sway}/bin/sway --unsupported-gpu --config ${greetdSwayConfig}";
    };
}

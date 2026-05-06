{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "sway-session.target";
    };
    style = ''
      @define-color base01 #${config.lib.stylix.colors.base01};
      @define-color base0D #${config.lib.stylix.colors.base0D};
      * {
        font-family: "${config.stylix.fonts.sansSerif.name}";
      }
    '' + builtins.readFile ./style.css;
  };
}

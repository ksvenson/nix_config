{ lib, inputs, ... }: {
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;

    settings = {
      bar.default = {
        position = "bottom";
        start = [ "control-center" "workspaces" ];
        center = [ ];
        end = [ "network" "volume" "battery" "clock" ];
        radius = 0;
        capsule_radius = 4;
        scale = 1.2;
        thickness = 50;
        widget_spacing = 18;
        background_opacity = 0.0;
        margin_edge = 0;
        margin_ends = 0;
      };

      lockscreen.fingerprint = false;

      notification.position = "bottom_right";

      shell = {
        corner_radius_scale = 0.0;
        date_format = "%A, %b %d";
        settings_show_advanced = true;
        show_location = false;
        panel = {
          open_near_click_control_center = true;
          session_placement = "centered";
        };
      };

      theme = {
        builtin = "Noctalia";
        community_palette = "Oxocarbon";
        mode = "dark";
        source = "community";
        wallpaper_scheme = "m3-content";
      };

      weather.enabled = false;

      widget = {
        control-center = {
          scale = 1.5;
          glyph = "snowflake";
        };
        taskbar = {
          group_by_workspace = true;
          hide_empty_workspaces = true;
          scale = 1.5;
        };
        network.scale = 1.5;
        volume.scale = 1.5;
        battery.scale = 1.5;
        clock = {
          scale = 1.5;
          format = "{:%H:%M\\n%a, %b %d}";
        };
      };
    };
  };
}

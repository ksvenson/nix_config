{ config, ... }: {
  programs.waybar.settings.mainBar = {
    "custom/nixos" = {
      format = "snowflake";
      tooltip = true;
      tooltip-format = "this is a test";
    };
    "sway/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
      warp-on-scroll = false;
      format = "{name}";
      format-icons = {
        urgent = "";
        active = "";
        default = "";
      };
    };
    idle_inhibitor = {
      format = "{icon}";
      format-icons = {
        activated = "";
        deactivated = "";
      };
    };
    network = {
      format-wifi = "   {essid} ({signalStrength}%)";
      format-ethernet = "{ipaddr}/{cidr} ";
      tooltip-format = "{ifname} via {gwaddr} ";
      format-linked = "{ifname} (No IP) ";
      format-disconnected = "Disconnected ⚠";
    };
    cpu = {
      format = "  {usage}%";
      tooltip = true;
    };
    memory = {
      format = "  {}%";
      tooltip = true;
    };
    clock = {
      format = "{:%H:%M | %e %B} ";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = "{:%Y-%m-%d}";
    };
  };
}

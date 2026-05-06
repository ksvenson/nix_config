{ lib, config, ... }: {
  programs.waybar.settings.mainBar = {
    "sway/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
      warp-on-scroll = false;
      format = "{icon}";
      format-icons = (lib.mapAttrs' (_: ws: lib.nameValuePair
        (ws.num)
        (ws.label)
      ) config.workspaces);
    };
    network = {
      format-wifi = " {signalStrength}%";
      format-ethernet = "{ipaddr}/{cidr}";
      tooltip-format = "{essid}";
      format-disconnected = "󰞃";
    };
    clock = {
      format = "{:%H:%M | %B %e} ";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };
  };
}

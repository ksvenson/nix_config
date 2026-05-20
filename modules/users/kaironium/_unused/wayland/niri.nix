{ inputs, config, ... }: {
  imports = [
    inputs.niri.homeModules.niri
    inputs.niri.homeModules.stylix
  ];
  programs.niri = {
    enable = false;
    settings = {
      spawn-at-startup = [
        { argv = [ "noctalia-shell" ]; }
      ];
      binds = {
        "Mod+Return".action.spawn = "kitty";
      };
    };
  };
}

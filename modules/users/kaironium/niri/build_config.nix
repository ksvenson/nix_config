# We have to manually construct the config file since
# niri doesn't have home-manager options; cringe!
# There is `sodiboo/niri-flake`, but that's just adding
# another point of failure
{ config, pkgs, ... } @ args: 
  let
    startup_frag = import ./_config/startup.nix args;
    inputs_frag = import ./_config/inputs.nix args;
    keybinds_frag = import ./_config/keybinds.nix args;
    misc_frag = import ./_config/misc.nix args;
  in {
    xdg.configFile."niri/config.kdl".text = ''
      ${startup_frag}
      ${inputs_frag}
      ${keybinds_frag}
      ${misc_frag}
    '';
}

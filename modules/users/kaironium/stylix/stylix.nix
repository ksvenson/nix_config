{ inputs, config, pkgs, ... }: {
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix.enable = true;
  stylix.autoEnable = true;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/selenized-black.yaml";

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.nerd-fonts.ubuntu;
      name = "Ubuntu Nerd Font";
    };
    serif = {
      package = pkgs.nerd-fonts.tinos;
      name = "Tinos Nerd Font";
    };
  };
}

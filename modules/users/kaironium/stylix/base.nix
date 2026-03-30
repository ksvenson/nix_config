{ inputs, config, pkgs, ... }: {
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix.enable = true;
  stylix.autoEnable = true;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/selenized-black.yaml";
  # stylix.image = ./wallpaper.jpg;

  # stylix.targets.kitty.enable = true;
  # stylix.targets.neovim.enable = true;
}

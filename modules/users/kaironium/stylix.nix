{ inputs, config, pkgs, ... }: {
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/selenized-black.yaml";
    targets.nixvim.plugin = "base16-nvim";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono NL Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono NL Nerd Font Propo";
      };
      serif = {
        package = pkgs.nerd-fonts.tinos;
        name = "Tinos Nerd Font";
      };
    };
  };
}

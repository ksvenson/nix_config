{
  description = "Base Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    import-tree.url = "github:vic/import-tree";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, agenix, import-tree, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        emperor = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            (import-tree ./modules/global)
            (import-tree ./modules/machines/emperor)
            agenix.nixosModules.default
          ];
        };
      };
      homeConfigurations.kaironium = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ (import-tree ./modules/users/kaironium) ];
      };
    };
}

{ inputs, ... }: {
  flake =
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        emperor = inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            modulesPath = "${inputs.nixpkgs}/nixos/modules";
          };
          modules = [
            (inputs.import-tree ./global)
            (inputs.import-tree ./machines/emperor)
            inputs.agenix.nixosModules.default
          ];
        };
      };
      homeConfigurations.kaironium = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ (inputs.import-tree ./users/kaironium) ];
      };
    };
}


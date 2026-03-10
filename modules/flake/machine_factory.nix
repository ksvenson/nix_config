{ inputs, self, config, ... }:
  let
    buildNixosSystem = machine: inputs.nixpkgs.lib.nixosSystem {
      inherit (machine) system;
      specialArgs = {
        inherit inputs;
        inherit self; # gives nixosModules access to utils
        inherit machine;
      };
      modules = [
        (inputs.import-tree "${self}/modules/machines/common")
        (inputs.import-tree "${self}/modules/machines/${machine.hostName}")
      ];
    };
  in {
    flake.nixosConfigurations = builtins.mapAttrs (_: buildNixosSystem) self.machines;
}

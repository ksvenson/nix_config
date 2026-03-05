{ inputs, config, ...}: {
  let
    buildNixosSystem = machine: inputs.nixpkgs.lib.nixosSystem {
      inherit machine.system;
      specialArgs = {
        inherit machine;  # TODO: this may not be necessary - here tentatively to automatically build owner user
        modulesPath = "${inputs.nixpkgs}/nixos/modules";  # TODO: find out if this is necessary
        # TODO: may later become necessary to `inherit inputs`
      };
      modules = [
        config.flake.nixosModules.common
        config.flake.nixosModules.${machine.hostName}
      ];
    };
  in {
    config.flake.nixosConfigurations = builtins.map (buildNixosSystem) config.flake.machines

  }
}

{ inputs, self, config, ... }: {
  let
    buildNixosSystem = machine: inputs.nixpkgs.lib.nixosSystem {
      inherit machine.system;
      specialArgs = {
        inherit inputs;
        inherit self; # gives nixosModules access to utils
        inherit machine;  # TODO: this may not be necessary - here tentatively to automatically build owner user
        modulesPath = "${inputs.nixpkgs}/nixos/modules";  # TODO: find out if this is necessary - we don't want `specialArgs` to get cluttered
      };
      modules = [
        (inputs.import-tree ${self}/modules/common)
        (inputs.import-tree ${self}/modules/machines/${machine.hostName})
      ];
    };
  in
    flake.nixosConfigurations = builtins.mapAttrs (_: buildNixosSystem) self.machines;
}

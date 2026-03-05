{ inputs, self, config, ...}: {
  let
    buildNixosSystem = machineInfo: inputs.nixpkgs.lib.nixosSystem {
      inherit machineInfo.system;
      specialArgs = {
        inherit machineInfo;  # TODO: this may not be necessary - here tentatively to automatically build owner user
        modulesPath = "${inputs.nixpkgs}/nixos/modules";  # TODO: find out if this is necessary
        # TODO: may later become necessary to `inherit inputs`
      };
      modules = [
        (import-tree ${self}/modules/common)
        (import-tree ${self}/modules/machines/${machineInfo.hostName})
      ];
    };

  in {
    flake.nixosConfigurations = builtins.map (buildNixosSystem) config.flake.machines  # FIXME this should be an attribute set, not list
  }
}

{ lib, inputs, self, config, ... }:
  let
    # homeManager depends on `system`, so we need to build a separate instance of each user for each machine.
    # This approach is inspired by ghost's approach here:
    # https://github.com/nix-community/home-manager/issues/3075#issuecomment-3037360368
    # TODO: check back on this thread to see if homeManager comes out with a more
    # system-agnostic implementation.
    buildHomeManager = machine: user: inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${machine.system};
      extraSpecialArgs = {
        inherit inputs;
        inherit self;
        inherit user;
        inherit machine;
      };
      modules = [
        (inputs.import-tree "${self}/modules/users/${user.name}")
      ];
    };

    buildUsersOnMachine = machine: lib.mapAttrs' (_: user: lib.nameValuePair
      ("${user.name}@${machine.hostName}")
      (buildHomeManager machine user)
    ) machine.users;

    buildUsers = machineSet: lib.mergeAttrsList (builtins.attrValues (builtins.mapAttrs (_: buildUsersOnMachine) machineSet));

  in {
    flake.homeConfigurations = buildUsers self.machines;
}

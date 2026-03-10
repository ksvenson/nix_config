{ lib, inputs, self, config, ... }: {
  let
    # homeManager depends on `system`, so we need to build a separate instance of each user for each machine.
    # This approach is inspired by ghost's approach here:
    # https://github.com/nix-community/home-manager/issues/3075#issuecomment-3037360368
    # TODO: check back on this thread to see if homeManager comes out with a more
    # system-agnostic implementation.
    buildHomeManager = system: user: inputs.home-manager.lib.homeManagerConfiguration {
      inherit inputs;
      inherit self;
      inherit user;
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      modules = [
        (inputs.import-tree ${self}/modules/users/${user.name})
      ];
    };

    buildUsersOnMachine = machine: lib.mapAttrs' (_: user: lib.nameValuePair
      ("${user.name}@${machine.hostName}")
      (buildHomeManager machine.system user)
    ) machine.users;

    buildUsers = machineList: lib.mergeAttrsList builtins.attrValues builtins.mapAttrs (_: buildUsersOnMachine) machineList;

  in
    flake.homeConfigurations = builtins.mapAttrs (_: buildUsers) self.machines;
}

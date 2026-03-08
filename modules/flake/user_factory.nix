{ inputs, self, config, ... }: {
  let
    buildHomeManager = user: inputs.home-manager.lib.homeManagerConfiguration {
      # FIXME: need to make this under perSystem
      modules = [
        (inputs.import-tree ${self}/modules/users/${user.name})
      ];
    };
  in
    flake.homeConfigurations = builtins.mapAttrs (_: buildHomeManager) self.users;
}

{ inputs, self, config, ... }: {
  let
    machineList = [
      rec {
        hostName = "emperor";
        description = "desktop";
        system = "x86_64-linux";
        owner = self.users.kaironium;
        # TODO: add `users` attribute to support multi-user machines
      }
    ];
  in
    # formatting it this way makes implementing `machine_factory.nix` easier
    flake.machines = self.utils.labelList { list = machineList; labelName = "hostName"; };
}

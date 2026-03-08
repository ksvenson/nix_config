{ inputs, self, config, ... }: {
  let
    inherit (self.utils) labelList

    machineList = [
      rec {
        hostName = "emperor";
        description = "desktop";
        system = "x86_64-linux";
        owner = self.users.kaironium;
        users = labelList { list = [
          owner
        ]; labelName = "name"; };
      }
    ];
  in
    # formatting it this way makes implementing `machine_factory.nix` easier
    flake.machines = labelList { list = machineList; labelName = "hostName"; };
}

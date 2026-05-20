{ inputs, self, config, ... }:
  let
    inherit (self.utils) labelList;

    machineList = [
      rec {
        hostName = "warpcore";
        description = "desktop";
        system = "x86_64-linux";
        owner = self.users.kaironium;
        users = labelList { labelName = "name"; list = [
          owner
        ]; };
      }
    ];
  in {
    # formatting it this way makes implementing `machine_factory.nix` easier
    flake.machines = labelList { list = machineList; labelName = "hostName"; };
}

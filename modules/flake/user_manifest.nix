{ inputs, self, config, ... }:
  let
    userList = [
      {
        name = "kaironium";
        description = "Just some guy";
        email = "kai.svenson628@gmail.com";
      }
    ];
  in {
    flake.users = self.utils.labelList { list = userList; labelName = "name"; };
}

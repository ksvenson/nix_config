{ config, pkgs, machine, ... }:
  let
    buildUser = user: {
      isNormalUser = true;
      shell = pkgs.bash;
      home = "/home/${user.name}";
      hashedPasswordFile = config.age.secrets."${user.name}_pw".path;
    }
    // (
      if user.name == machine.owner.name then {
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
      } else {}
    );
  in {
    users.mutableUsers = false;

    users.users = {
      root = {
        hashedPasswordFile = config.age.secrets.root_pw.path;
      };
    } // builtins.mapAttrs (_: buildUser) machine.users;
}


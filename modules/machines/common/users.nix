{ config, pkgs, machine, ... }:
  let
    buildUser = user: {
      isNormalUser = true;
      shell = pkgs.bash;
      home = "/home/${user.name}";
      hashedPasswordFile = config.age.secrets."${user.name}_pw".path;
      # hashedPassword = "";
    }
    // (
      if user.name == machine.owner.name then {
        extraGroups = [ "wheel" ];
      } else {}
    );
  in {
    users.mutableUsers = false;

    users.users = {
      root = {
        hashedPasswordFile = config.age.secrets.root_pw.path;
        # hashedPassword = "";
      };
    } // builtins.mapAttrs (_: buildUser) machine.users;
}


{ config, pkgs, machine, ... }:
  let
    buildUser = user: {
      isNormalUser = true;
      shell = pkgs.bash;
      home = "/home/${user.name}";
      hashedPasswordFile = config.age.secrets."${user.name}_pw".path;
    };
  in {
    users.mutableUsers = false;

    users.users = {
      root = {
        hashedPasswordFile = config.age.secrets.root_pw.path;
      };
      ${machine.owner.name} = {
        description = "Machine Owner";
        extraGroups = [ "wheel" ];
      };
      }
      //
      builtins.mapAttrs (_: buildUser) machine.users;
}


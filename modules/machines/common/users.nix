{ config, pkgs, machine, ... }: {
  let
    buildUser = user: {
      isNormalUser = true;
      shell = pkgs.bash;
      home = "/home/${user.name}";
      hasedPasswordFile = config.age.secrets."${user.name}_pw".path
    };
  in
    users.mutableUsers = false;

    users.users.root = {
      hashedPasswordFile = config.age.secrets.root_pw.path;
    };
    
    users.users.${machine.owner.name} = {
      description = "Machine Owner";
      extraGroups = [ "wheel" ];
    };

    users.users = builtins.mapAttrs (_: buildUser) machine.users;
}


{ config, machineInfo, ... }: {
  users.mutableUsers = false;

  users.users.root = {
    hashedPasswordFile = config.age.secrets.root_pw.path;
  };

  users.users.${machineInfo.owner.name} = {
    isNormalUser = true;
    description = "Machine Owner";
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
    home = "/home/${machineInfo.owner.name}";
    hashedPasswordFile = config.age.secrets."${machineInfo.owner.name}_pw".path;
  };

  # TODO: add support for multi-user systems
}


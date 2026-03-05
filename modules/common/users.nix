{ config, lib, pkgs, inputs, ... }: {
  
  users.mutableUsers = false;
  
  age.secrets = {
    root_user_passwd.file = ../../secrets/root_user_passwd.age;
    kaironium_user_passwd.file = ../../secrets/kaironium_user_passwd.age;
  };

  users.users.root = {
    hashedPasswordFile = config.age.secrets.root_user_passwd.path;
  };

  users.users.kaironium = {
    isNormalUser = true;
    description = "kaironium";
    extraGroups = [ "wheel" "power" ];
    shell = pkgs.bash;
    home = "/home/kaironium";
    hashedPasswordFile = config.age.secrets.kaironium_user_passwd.path;
  };
}


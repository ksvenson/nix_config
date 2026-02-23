{ config, lib, pkgs, inputs, ... }: {
  security.polkit = {
    enable = true;

    extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (
          action.id == "org.freedesktop.login1.power-off" ||
          action.id == "org.freedesktop.login1.hibernate" ||
          action.id == "org.freedesktop.login1.suspend"
        ) {
          if (subject.isInGroup("power")) {
            return polkit.Result.YES;
          } else {
            return polkit.Result.NO;
          }
        }
      });
    '';
  };

  users.groups.power = {};
}


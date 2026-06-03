{ lib, config, ... }:
  let
    inherit (lib)
      mkOption
      types
      ;
  in {
  options.workspaces = mkOption {
    default = {};
    type = types.submodule {
      options = (builtins.listToAttrs (builtins.genList (i: {
        name = "ws${toString (i+1)}";
        value = mkOption {
          default = "${toString i}";
          type = types.str;
        };
      }) 9 ));
    };
  };

  config.workspaces = {
    ws1 = "Terminals";
    ws2 = "Browser";
    ws3 = "Comms";
    ws4 = "Media";
  };
}

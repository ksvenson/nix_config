{ lib, config, ... }:
  let
    inherit (lib)
      mkOption
      types
      ;
  in {
  options.i3.workspaces = mkOption {
    type = types.attrsOf types.str;
    default = {
      "1" = "1: Terminals"
      "2" = "2: Browsers"
      "3" = "3: Comms"
    };
  };
}

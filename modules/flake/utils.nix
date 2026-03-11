{ inputs, self, config, ... }:
  let
    inherit (builtins)
      map
      listToAttrs
      ;
  in {
    flake.utils = {
      # params:
      # `list`: a list of sets all with the same attributes.
      # `labelName`: the name of one of the attributes in the sets in `list`.
      # returns:
      # An set with attributes equal to the values of `labelName`, and values equal to the elements of `list`.
      labelList = {list, labelName}: listToAttrs (map (x: { name = x.${labelName}; value = x; }) list);
    };
}

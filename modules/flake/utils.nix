{ inputs, self, config, ... }: {
  let
    inherit (builtins)
      map
      listToAttrs
  in
    flake.utils = {
      # params:
      # `list`: a list of attribute sets all with the same keys.
      # `labelName`: the name of one of the keys in the attribute sets in `list`.
      # returns:
      # An attribute set with keys equal to the values of `labelName`, and values equal to the elements of `list`.
      labelList = {list, labelName}: listToAttrs map (x: { name = x.${labelName}; value = x; }) list;
    };
}

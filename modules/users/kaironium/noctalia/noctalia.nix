{ inputs, config, ... }: {
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    # settings = {
    #   bar = {
    #     position = "bottom";
    #     barType = "compact";
    #     outerCorners = false;
    #     widgets = {
    #       left = [
    #         
    #       ];
    #     };
    #   };
    # };
  };
}

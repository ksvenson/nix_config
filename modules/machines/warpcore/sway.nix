{ config, ... }: {
  programs.sway = {
    extraOptions = [
      "--unsupported-gpu"
    ];
  };
}

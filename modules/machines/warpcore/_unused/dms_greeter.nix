{ inputs, config, machine, ... }: {
  programs.dank-material-shell.greeter.compositor = {
    customConfig = ''
      output "DP-1" {
        mode 2560x1440@143.856Hz
      }
    '';
  };
}

{ lib, self, ... }: {
  systems = lib.unique (lib.mapAttrsToList (_: machine: machine.system) self.machines);
}

{ lib, self, ... }: {
  systems = lib.unique builtins.map (machine: machine.system) builtins.attrValues self.machines
}

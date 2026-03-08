{ lib, config, inputs, self, machine, ... }: {
  imports = [ inputs.agenix.nixosModules.default ];

  secrets_dir = "${self}/modules/machines/${machine.hostName}/secrets";

  age.secrets = lib.mapAttrs' (_: user: lib.nameValuePair ("${user.name}_pw") ({
    file = "${config.secrets_dir}/${user.name}_pw.age";
    # TODO: add owner and group attributes here?
  })) machine.users

  age.secrets.root_pw = {
    file = "${config.secrets_dir}/root_pw.age";
  };
}

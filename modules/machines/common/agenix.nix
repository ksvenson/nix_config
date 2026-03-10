{ lib, config, inputs, self, machine, ... }: 
  let
    secrets_dir = "${self}/modules/machines/${machine.hostName}/_secrets";
  in {
    imports = [ inputs.agenix.nixosModules.default ];

    age.secrets = lib.mapAttrs' (_: user: lib.nameValuePair
      ("${user.name}_pw")
      ({
        file = "${config.secrets_dir}/${user.name}_pw.age";
        # TODO: add owner and group attributes here?
      })
      ) machine.users
      //
      {
        root_pw = {
          file = "${config.secrets_dir}/root_pw.age";
        };
      };
}

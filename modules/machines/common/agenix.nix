{ config, inputs, self, machineInfo, ... }: {
  imports = [ inputs.agenix.nixosModules.default ];

  secrets_dir = "${self}/modules/machines/${machineIngo.hostName}/secrets";

  age.secrets = {
    root_pw.file = "${config.secrets_dir}/root_pw.age";
    "${machineInfo.owner.name}_pw".file = "${config.secrets_dir}/${machineInfo.owner.name}_pw.age";
  };
}

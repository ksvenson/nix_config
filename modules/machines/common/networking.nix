{ config, ... }: {
  age.secrets."networking".file = "${self}/modules/machines/common/_secrets/networking.age";
  
  networking.networkmanager.ensureProfiles = {
    environmentFiles = [ config.age.secrets."networking".path ];
    
    profiles = {
      "oasis" = {};  # TODO
      ##################################
      "utexas" = {
        connection = {
          id = "utexas";
          type = "wifi";
          autoconnect = true;
        };
        wifi = {
          ssid = "utexas";
        };
        wifi-security = {
          key-mgmt = "wpa-eap";
        };
        "802-1x" = {
          eap = "peap;";
          phase2-auth = "mschapv2";
          identity = "$uid";
          password = "$uid_pw"; 
        };
        ipv4 = {
          method = "auto";
        };
        ipv6 = {
          method = "auto";
        };
      };
      ##################################
      "The Holy Shrine of Data" = {
        connection = {
          id = "The Holy Shrine of Data";
          type = "wifi";
          autoconnect = false;
        };
        wifi = {
          ssid = "The Holy Shrine of Data";
        };
        wifi-security = {
          key-mgmt = "wpa-eap";
          psk = "$shrine_pw";
        };
        ipv4 = {
          method = "auto";
        };
        ipv6 = {
          method = "auto";
        };
      };
    };
  };
}

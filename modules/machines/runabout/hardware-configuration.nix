{ inputs, config, lib, pkgs, modulesPath, ... }: {
  imports =
    [ "${inputs.nixpkgs}/nixos/modules/installer/scan/not-detected.nix"
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/88a4ee41-871d-4887-bb67-84d42e962244";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/A269-5C31";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ 
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  boot.kernelParams = ["resume_offset=88918016"];

  boot.resumeDevice = "/dev/disk/by-uuid/88a4ee41-871d-4887-bb67-84d42e962244";

  powerManagement.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.npu.enable = true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

{ inputs, ... }:
{
    flake.nixosModules.poseidonMachineModule = { config, lib, pkgs, modulesPath, ... }:
    {
        boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
        boot.initrd.kernelModules = [ ];
        boot.kernelModules = [ "kvm-intel" ];
        boot.extraModulePackages = [ ];

        fileSystems."/" = {
            device = "/dev/disk/by-uuid/6c25abb4-3a82-42df-8457-63c94430bce6";
            fsType = "ext4";
        };

        fileSystems."/boot" = {
            device = "/dev/disk/by-uuid/1B67-7DE7";
            fsType = "vfat";
            options = [ "fmask=0077" "dmask=0077" ];
        };

        swapDevices = [ ];

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
        hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}


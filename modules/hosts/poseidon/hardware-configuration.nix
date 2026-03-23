{ inputs, ... }:
{
    flake.nixosModules.zeusMachineModule = { config, lib, pkgs, modulesPath, ... }:
    {
        boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
        boot.initrd.kernelModules = [ ];
        boot.kernelModules = [ "kvm-intel" ];
        boot.extraModulePackages = [ ];

        boot.kernelParams = [ "resume_offset=5933056" ];
        boot.resumeDevice = "/dev/disk/by-uuid/e2c5dcaa-26c3-4b43-9227-215d557594df";

        fileSystems."/" =
            {
                device = "/dev/disk/by-uuid/e2c5dcaa-26c3-4b43-9227-215d557594df";
                fsType = "ext4";
            };

        fileSystems."/boot" =
            {
                device = "/dev/disk/by-uuid/A5B0-B8CE";
                fsType = "vfat";
                options = [ "fmask=0077" "dmask=0077" ];
        };

        fileSystems."/mnt/local_disk" = {
            device = "/dev/nvme0n1p4";
            fsType = "ntfs";
        };

        swapDevices = [
            {
                device = "/var/lib/swapfile";
                size = 32 * 1024;
            }
        ];

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
        hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}


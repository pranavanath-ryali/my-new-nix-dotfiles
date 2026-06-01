{ userSettings, ... }:
{
  flake.nixosModules.virtualizationModule =
    { pkgs, inputs, ... }:
    {
      programs.virt-manager.enable = true;

      users.groups.libvirtd.members = [ "${userSettings.username}" ];
      users.groups.kvm.members = [ "${userSettings.username}" ];

      virtualisation = {
        libvirtd.enable = true;
        libvirtd.qemu = {
          swtpm.enable = true;
          vhostUserPackages = [ pkgs.virtiofsd ];
        };
        spiceUSBRedirection.enable = true;
      };

      environment.systemPackages = with pkgs; [
        qemu
        dnsmasq
        phodav

        virt-viewer
      ];

      # Linux kernel
      boot.kernelPackages = pkgs.linuxPackages_latest;
      boot.kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" ];
      boot.kernelParams = [
        "intel_iommu=on"
        "iommu=pt"
      ];

      users.users.${userSettings.username}.extraGroups = [ "libvirtd" ];
    };
}

{...}: {
  flake.nixosModules.virtualizationModule = {pkgs, ...}: {
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = ["pranavanathryali"];

    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;

    environment.systemPackages = with pkgs; [
      qemu
    ];

    users.users.pranavanathryali.extraGroups = ["libvirtd"];
  };
}

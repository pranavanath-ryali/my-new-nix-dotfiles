{...}: {
    flake.nixosModules.virtualizationModule = {pkgs, ...}: {
        programs.virt-manager.enable = true;

        users.groups.libvirtd.members = ["pranavanath"];
        users.groups.kvm.members = [ "pranavanath" ];

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

        users.users.pranavanath.extraGroups = ["libvirtd"];
    };
}

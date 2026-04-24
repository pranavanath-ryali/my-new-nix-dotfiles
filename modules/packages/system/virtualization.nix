{...}: {
    flake.nixosModules.virtualizationModule = {pkgs, ...}: {
        programs.virt-manager.enable = true;

        users.groups.libvirtd.members = ["pranavanathryali"];
        users.groups.kvm.members = [ "pranavanathryali" ];

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

        users.users.pranavanathryali.extraGroups = ["libvirtd"];
    };
}

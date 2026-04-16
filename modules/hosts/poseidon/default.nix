{ inputs, chaotic, pkgs, self, ... }:
{
    flake.nixosConfigurations.poseidon = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
            inherit self;
            inherit inputs;
            inherit chaotic;
        };
        modules = [
            inputs.chaotic.nixosModules.default

            self.nixosModules.poseidonMachineModule

            self.nixosModules.poseidonGpuDriversModule
            self.nixosModules.bluetoothModule
            self.nixosModules.printingModule
            self.nixosModules.pipewireModule

            self.nixosModules.basePackages
            self.nixosModules.syncthingModule
            # self.nixosModules.flatpakModule

            self.nixosModules.defaultNoctaliaHyprland
        ];
    };

    flake.nixosModules.poseidonMachineModule = { inputs, pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        networking.hostName = "poseidon";
        networking.networkmanager.enable = true;

        time.timeZone = "Asia/Kolkata";

        i18n.defaultLocale = "en_IN";

        i18n.extraLocaleSettings = {
            LC_ADDRESS = "en_IN";
            LC_IDENTIFICATION = "en_IN";
            LC_MEASUREMENT = "en_IN";
            LC_MONETARY = "en_IN";
            LC_NAME = "en_IN";
            LC_NUMERIC = "en_IN";
            LC_PAPER = "en_IN";
            LC_TELEPHONE = "en_IN";
            LC_TIME = "en_IN";
        };

        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        users.users.pranavanathryali = {
            isNormalUser = true;
            description = "pranavanathryali";
            extraGroups = [ "networkmanager" "wheel" ];
        };

        boot.kernelPackages = pkgs.linuxPackages_cachyos;

        # services.create_ap = {
        #     enable = true;
        #     settings = {
        #         WIFI_IFACE = "wlp0s20f3";
        #         INTERNET_IFACE = "wlp0s20f3"; # Sharing WiFi to WiFi (if supported)
        #         SSID = "PoseidonAP";
        #         PASSPHRASE = "qwerty1234";
        #         # FREQ_BAND = "2.4";

        #         FREQ_BAND = "5";
        #         CHANNEL = "153";
        #     };
        # };
        # boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

        # # Open the firewall for DHCP and DNS
        # networking.firewall.allowedUDPPorts = [ 53 67 ];
        # networking.firewall.allowedTCPPorts = [ 53 ];

        # services.sunshine = {
        #     enable = true;
        #     autoStart = true;
        #     capSysAdmin = true;
        #     openFirewall = true;
        # };

        system.stateVersion = "25.11";
    };
}

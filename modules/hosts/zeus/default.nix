{ inputs, pkgs, self, ... }:
{
    flake.nixosConfigurations.zeus = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
            inherit self;
            inherit inputs;
        };
        modules = [
            self.nixosModules.zeusMachineModule

            self.nixosModules.zeusGpuDriversModule
            self.nixosModules.bluetoothModule
            self.nixosModules.printingModule
            self.nixosModules.pipewireModule

            self.nixosModules.basePackages
            self.nixosModules.syncthingModule
            self.nixosModules.flatpakModule

            self.nixosModules.caelestiaHyprlandModule
        ];
    };

    flake.nixosModules.zeusMachineModule = { inputs, pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        networking.hostName = "zeus";
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

        # services.xserver.enable = true;

        # services.xserver.displayManager.gdm.enable = true;
        # services.xserver.desktopManager.gnome.enable = true;

        # services.xserver.xkb = {
        #     layout = "us";
        #     variant = "colemak_dh";
        # };

        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        programs.firefox.enable = true;
        
        users.users.pranavanathryali = {
            isNormalUser = true;
            description = "pranavanathryali";
            extraGroups = [ "networkmanager" "wheel" ];
        };

        system.stateVersion = "25.11";
    };
}


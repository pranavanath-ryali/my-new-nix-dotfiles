{ ... }:
{
    flake.nixosModules.caelestiaHyprlandModule = { self, inputs, pkgs, lib, ... }: {
        imports = [
            self.nixosModules.hyprlandModule
        ];

        environment.systemPackages = with pkgs; [
            # inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.default

            # inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.caelestia-shell
            # inputs.caelestia-shell.inputs.caelestia-cli.packages.${pkgs.stdenv.hostPlatform.system}.caelestia-cli

            # inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.default
            # inputs.caelestia-cli.packages.${pkgs.stdenv.hostPlatform.system}.default


            inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.caelestia-shell
            inputs.caelestia-shell.inputs.caelestia-cli.packages.${pkgs.stdenv.hostPlatform.system}.caelestia-cli

            hyprpicker
            hypridle
            wl-clipboard
            cliphist
            imagemagick
            kdePackages.qt6ct
            libsForQt5.qt5ct
        ];
    };

    flake.homeModules.caelestiaHyprlandModule = { self, inputs, pkgs, ... }: {
        imports = [
            self.homeModules.hyprlandModule
        ];

        home.packages = [
            # inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.default
            inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.caelestia-shell
            inputs.caelestia-shell.inputs.caelestia-cli.packages.${pkgs.stdenv.hostPlatform.system}.caelestia-cli
        ];

        # programs.caelestia-dots = {
        #     enable = true;
        # };
    };
}
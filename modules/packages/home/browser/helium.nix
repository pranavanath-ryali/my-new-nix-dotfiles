{ ... }:
{
    flake.homeModules.heliumBrowserModule = { inputs, pkgs, lib, config, ... }: {
        home.packages = [
            inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

        wayland.windowManager.hyprland.settings.bind = lib.mkAfter [
            "$mainMod, B, exec, helium"
        ];
    };
}

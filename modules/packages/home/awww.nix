{ ... }:
{
    flake.homeModules.awwwModule = { inputs, pkgs, lib, ... }: {
        home.packages = [
            inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
        ];

        wayland.windowManager.hyprland.settings.exec-once = lib.mkAfter [
            "awww-daemon"
        ];
    };
}

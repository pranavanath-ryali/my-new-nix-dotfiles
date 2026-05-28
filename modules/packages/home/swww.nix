{ ... }:
{
    flake.homeModules.swwwModule = { inputs, pkgs, lib, ... }: {
        home.packages = [
          pkgs.swww
        ];

        wayland.windowManager.hyprland.settings.exec-once = lib.mkAfter [
            "swww-daemon"
        ];
    };
}

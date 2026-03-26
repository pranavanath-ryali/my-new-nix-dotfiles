{ ... }:
{
    flake.homeModules.awwwModule = { inputs, ... }: {
        environment.packages = [
            inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
        ];

        wayland.windowManager.hyprland.settings.exec-once = lib.mkAfter [
            "awww-daemon"
        ];
    };
}

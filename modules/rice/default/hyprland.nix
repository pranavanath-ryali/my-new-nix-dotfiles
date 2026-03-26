{ ... }:
{
    flake.homeModules.riceDefaultHyprland = { self, lib, ... }: {
        imports = [
            self.homeModules.kittyModule
            self.homeModules.fishModule
            self.homeModules.vicinaeModule
        ];

        wayland.windowManager.hyprland.settings.bind = lib.mkAfter [
            "$mainMod, SPACE, exec, vicinae toggle"
            "$mainMod, RETURN, exec, kitty"
        ];
    };
}

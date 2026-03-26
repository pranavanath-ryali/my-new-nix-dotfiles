{ ... }:
{
    flake.nixosModules.defaultNoctaliaHyprland = { self, ... }: {
        imports = [
            self.nixosModules.hyprlandModule
        ];
    };

    flake.homeModules.defaultNoctaliaHyprland = { self, lib, ... }: {
        imports = [
            self.homeModules.kittyModule
            self.homeModules.fishModule
            self.homeModules.hyprlandModule
            self.homeModules.noctaliaShellModule
        ];

        programs.noctalia-shell = {
            settings = (builtins.fromJSON (builtins.readFile ./configs/noctalia.json)).settings;
        };
    };
}

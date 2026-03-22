{ ... }:
{
    flake.nixosModules.illogicalImpulseModule = { self, inputs, pkgs, ... }: {
        imports = [
            self.nixosModules.hyprlandModule
        ];

        fonts.packages = with pkgs; [
            rubik
            nerd-fonts.ubuntu
            nerd-fonts.jetbrains-mono
        ];
    };

    flake.homeModules.illogicalImpulseModule = { self, inputs, ... }: {
        imports = [
            inputs.illogical-flake.homeManagerModules.default

            self.homeModules.hyprlandModule
        ];

        programs.illogical-impulse.enable = true;
    };
}
{ inputs, self, ... }:
{
    flake.homeConfigurations.pranavanathryali = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
        };
        extraSpecialArgs = {
            inherit self;
            inherit inputs;
        };
        modules = [
            self.homeModules.homeModule
            {
                home.username = "pranavanathryali";
                home.homeDirectory = "/home/pranavanathryali";
                home.stateVersion = "25.11";
            }
        ];
    };

    flake.homeModules.homeModule = { self, pkgs, ... }: {
        imports = [
            self.homeModules.basePackages
            self.homeModules.hyprlandModule
        ];
        programs.home-manager.enable = true;

        home.packages = with pkgs; [
            vim
            neovim
            obsidian
        ];
    };
}

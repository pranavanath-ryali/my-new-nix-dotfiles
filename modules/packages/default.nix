{ ... }:
{
    flake.nixosModules.basePackages = { self, pkgs, ... }: {
        imports = [
            self.nixosModules.direnvModule
            self.nixosModules.kdeConnectModule
            self.nixosModules.steamModule
        ];

        environment.systemPackages = with pkgs; [
            zed-editor

            btop
            htop
            ranger
            grc
            ripgrep
            bat
            pciutils
            ispell
            inotify-tools
            wireplumber
            qjackctl
            pavucontrol

            git
            gh

            vim
            wget
            curl
            unzip
            cmatrix

            gcc

            jack2
            qjackctl

            adw-gtk3
            papirus-icon-theme
        ];

        fonts.packages = with pkgs; [
            nerd-fonts.jetbrains-mono
            nerd-fonts.caskaydia-cove

            montserrat
        ];
    };

    flake.homeModules.basePackages = { self, pkgs, inputs, ... }: {
        imports = [
            self.homeModules.musicModule
            self.homeModules.kdeConnectModule
            self.homeModules.nvfModule
        ];

        home.packages = with pkgs; [
            inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

            neovim
            localsend
            planify
            lazygit
            vscode
            # (pkgs.zed-editor.overrideAttrs (oldAttrs: {
            #     buildInputs = (oldAttrs.buildInputs or []) ++ (with pkgs; [
            #         nerd-fonts.caskaydia-cove
            #         montserrat
            #     ]);
            # }))
            ollama

            libreoffice
            # calibre
            # obsidian

            easyeffects
            strawberry
            lrcget

            bottles
        ];
    };
}

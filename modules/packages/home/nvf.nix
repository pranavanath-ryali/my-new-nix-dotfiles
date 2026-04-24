{ ... }:
{
    flake.homeModules.nvfModule = { inputs, pkgs, ... }: {
        imports = [
            inputs.nvf.homeManagerModules.default
        ];

        programs.nvf = {
            enable = true;
            settings.vim = {
                lineNumberMode = "relative";

                viAlias = true;
                vimAlias = true;

                options = {
                    expandtab = true;
                    shiftwidth = 4;
                    tabstop = 4;
                    signcolumn = "yes";
                };

                globals = {
                    mapleader = " ";
                    maplocalleader = " ";
                };

                lsp = {
                    enable = true;
                };

                autocomplete.nvim-cmp = {
                    enable = true;
                };

                languages = {
                    clang.enable = true;
                    python.enable = true;
                };

                telescope = {
                    enable = true;
                    extensions = [
                        {
                            name = "fzf";
                            packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
                            setup = {fzf = {fuzzy = true;};};
                        }
                    ];
                    mappings = {
                        buffers = "fb";
                        diagnostics = "fd";
                    };
                };

                utility = {
                    direnv.enable = true;
                    oil-nvim.gitStatus.enable = true;
                    sleuth.enable = true;
                };

                ui = {
                    borders.enable = true;
                    borders.globalStyle = "rounded";
                };

                visuals = {
                    nvim-web-devicons.enable = true;
                    blink-indent.enable = true;
                    fidget-nvim.enable = true;
                };

                ui.noice.enable = true;
                autopairs.nvim-autopairs.enable = true;

                # statusline.lualine.enable = true;
            };
        };
    };
}

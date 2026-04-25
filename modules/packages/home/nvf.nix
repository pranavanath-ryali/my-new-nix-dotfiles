{ ... }:
{
    flake.homeModules.nvfModule = { inputs, pkgs, lib, ... }: {
        imports = [
            inputs.nvf.homeManagerModules.default
        ];

        programs.nvf = {
            enable = true;
            settings.vim = {
                theme = {
                    enable = true;
                    name = "catppuccin";
                    style = "mocha";
                    transparent = true;
                    extraConfig = ''
-- Standard keywords
vim.api.nvim_set_hl(0, "Keyword", { italic = true })
vim.api.nvim_set_hl(0, "Conditional", { italic = true })
vim.api.nvim_set_hl(0, "Repeat", { italic = true })

-- Treesitter specific (covers Rust, C++, etc.)
vim.api.nvim_set_hl(0, "@keyword", { italic = true })
vim.api.nvim_set_hl(0, "@keyword.function", { italic = true })
vim.api.nvim_set_hl(0, "@keyword.return", { italic = true })
                    '';
                };

                lineNumberMode = "relative";

                viAlias = true;
                vimAlias = true;

                options.expandtab = true;
                options.shiftwidth = 4;
                options.tabstop = 4;
                options.signcolumn = "yes";

                globals.mapleader = " ";
                globals.maplocalleader = " ";

                treesitter = {
                    enable = true;
                    fold = true;
                };

                lsp = {
                    enable = true;
                    inlayHints.enable = true;
                };
                autocomplete.blink-cmp = {
                    enable = true;
                    friendly-snippets.enable = true;
                    mappings = {
                        close = "<Esc>";
                        complete = "<C-Space>";
                        confirm = "<C-n>";

                        scrollDocsDown = "<C-t>";
                        scrollDocsUp = "<C-p>";
                    };
                    setupOpts = {
                        keymap = {
                            preset = "default";

                            "<Tab>" = [ "select_next" "snippet_forward" "fallback" ];
                            "<S-Tab>" = [ "select_prev" "snippet_backward" "fallback" ];
                        };

                        completion.documentation.auto_show = true;
                        completion.documentation.auto_show_delay_ms = 200;

                        completion.menu.auto_show = true;
                    };
                };
                snippets.luasnip = {
                    enable = true;
                };

                languages = {
                    rust = {
                        enable = true;
                        extensions.crates-nvim.enable = true;
                        format.enable = true;
                        format.type = [ "rustfmt" ];
                        treesitter.enable = true;
                    };
                    clang.enable = true;
                    python.enable = true;
                    nix.enable = true;
                };

                telescope = {
                    enable = true;
                    extensions = [
                        {
                            name = "fzf";
                            packages = [ pkgs.vimPlugins.telescope-fzf-native-nvim ];
                            setup = { fzf = { fuzzy = true; }; };
                        }
                    ];
                    mappings = {
                        buffers = "<leader>fb";
                        diagnostics = "<leader>fd";
                        findFiles = "<leader>ff";

                        gitBranches = "<leader>fvb";
                        gitBufferCommits = "<leader>fvcb";
                        gitCommits = "<leader>fvcm";

                        liveGrep = "<leader>fs";
                        lspDefinitions = "<leader>fD";
                        lspDocumentSymbols = "<leader>fds";
                        lspImplementations = "<leader>fI";
                    };
                };

                autopairs.nvim-autopairs.enable = true;
                utility = {
                    direnv.enable = true;
                    oil-nvim.gitStatus.enable = true;
                    sleuth.enable = true;
                };
                
                statusline.lualine.enable = true;
                tabline.nvimBufferline = {
                    enable = true;
                    mappings = {
                        closeCurrent = "<leader>bq";
                        sortByDirectory = "<leader>bs";
                    };
                };
                filetree.neo-tree = {
                    enable = true;
                    setupOpts = {
                        enable_cursor_hijack = true;
                    };
                };

                ui = {
                    noice.enable = true;
                    borders.enable = true;
                    borders.globalStyle = "rounded";
                };

                visuals = {
                    nvim-web-devicons.enable = true;
                    blink-indent.enable = true;
                    fidget-nvim.enable = true;
                };

                keymaps = [
                    {
                        key = "<Esc>";
                        mode = [ "n" ];
                        action = "<cmd>noh<CR><Esc>";
                        silent = true;
                        desc = "Clear search highlights";
                    }
                    {
                        key = "<leader>tt";
                        mode = [ "n" ];
                        action = "<cmd>Neotree toggle<CR>";
                        silent = true;
                        desc = "Neotree: Toggle";
                    }
                    {
                        key = "<C-s>";
                        mode = [ "n" ];
                        action = "<cmd>w<CR>";
                        silent = true;
                        desc = "Save by Ctrl+s";
                    }


                    {
                        key = "<C-Tab>";
                        mode = [ "n" ];
                        action = "<cmd>BufferLineCycleNext<CR>";
                        silent = true;
                        desc = "Buffer: CycleNext";
                    }
                    {
                        key = "<C-S-Tab>";
                        mode = [ "n" ];
                        action = "<cmd>BufferLineCyclePrev<CR>";
                        silent = true;
                        desc = "Buffer: CyclePrev";
                    }
                ];
            };
        };
    };
}

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
                options = {
                    visualbell = false;
                    autoindent = true;
                    cursorlineopt = "line";
                    mouse = "a";
                    shiftwidth = 4;
                    tabstop = 4;
                    signcolumn = "yes";
                    wrap = false;
                };
                globals = {
                    mapleader = " ";
                    maplocalleader = " ";
                };

                lsp = {
                    enable = true;
                    inlayHints.enable = true;
                    lightbulb.enable = true;
                    # lspSignature.enable = true;
                    lspkind.enable = true;
                    # mappings = {
                    #     codeAction = "<leader>la";
                    #     documentHighlight = "<leader>ldh";
                    #     format = "<leader>lf";
                    #     goToDeclaration = "lgD";
                    #     goToDefinition = "lgd";
                    #     hover = "lh";
                    #     listDocumentSymbols = "lS";
                    #     listImplementations = "lgi";
                    #     listWorkspaceSymbols = "<leader>lws";
                    #     nextDiagnostic = "<leader>lgn";
                    #     openDiagnosticFloat = "<leader>le";
                    #     previousDiagnostic = "<leader>lgp";
                    #     renameSymbol = "<leader>ln";
                    # };
                };

                autocomplete.blink-cmp = {
                    enable = true;
                    setupOpts = {
                        completion.menu.auto_show = true;
                        signature.enabled = true;
                    };
                };

                languages = {
                    clang.enable = true;
                    rust = {
                        enable = true;
                        # lsp.enable = true;
                        treesitter.enable = true;

                        format.enable = true;

                        extensions.crates-nvim.enable = true;
                        extensions.crates-nvim.setupOpts.completion.crates.enabled = true;
                        extensions.crates-nvim.setupOpts.lsp.actions = true;
                        extensions.crates-nvim.setupOpts.lsp.completion = true;
                        extensions.crates-nvim.setupOpts.lsp.hover = true;
                    };
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
                };

                ui.noice.enable = true;

                # statusline.lualine.enable = true;
            };
        };
    };
}
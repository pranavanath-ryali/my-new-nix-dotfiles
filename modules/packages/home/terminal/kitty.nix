{ ... }:
{
    flake.homeModules.kittyModule = { lib, ... }: {
        programs.kitty = {
            enable = true;
            enableGitIntegration = true;

            font.name = lib.mkDefault "CaskaydiaCove NF";
            font.size = lib.mkDefault 12;

            settings = lib.mkDefault {
                window_padding_width = "6 8";
                background_opacity = 1.0;
                cursor_trail = 1;
                hide_window_decorations = true;
            };
        };
    };
}

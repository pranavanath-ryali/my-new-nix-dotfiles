{ ... }:
{
    flake.homeModules.kittyModule = { ... }: {
        programs.kitty = {
            enable = true;
            enableGitIntegration = true;

            font.name = "CaskaydiaCove NF";
            font.size = 12;

            settings = {
                window_padding_width = "6 8";
                background_opacity = 1.0;
                cursor_trail = 1;
                hide_window_decorations = true;
            };
        };
    };
}

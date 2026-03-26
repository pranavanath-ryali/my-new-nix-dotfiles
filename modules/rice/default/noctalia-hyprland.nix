{ ... }:
{
    flake.nixosModules.defaultNoctaliaHyprland = { self, ... }: {
        imports = [
            self.nixosModules.hyprlandModule
        ];
    };

    flake.homeModules.defaultNoctaliaHyprland = { self, lib, ... }: {
        imports = [
            self.homeModules.hyprlandModule
            self.homeModules.noctaliaShellModule

            self.homeModules.kittyModule
            self.homeModules.fishModule
        ];

        programs.noctalia-shell = {
            settings = (builtins.fromJSON (builtins.readFile ./configs/noctalia.json)).settings;
        };

        wayland.windowManager.hyprland.settings = {
            general = {
                layout = "scrolling";

                border_size = 2;

                gaps_in = 4;
                gaps_out = "16, 12, 12, 12";
            };

            decoration = {
                rounding = 14;

                blur = {
                    enabled = true;
                    size = 6;
                    passes = 3;
                    ignore_opacity = true;
                    xray = true;

                    noise = 0.02;
                    contrast = 0.8916;
                    brightness = 0.75;
                    vibrancy = 0.18;
                };
            };

            layerrule = [
                # {
                #     name = "noctalia-blur";
                #     "match:namespace" = "noctalia-bar-content-.*$";
                #     ignore_alpha = 0.05;
                #     blur = true;
                #     blur_popups = true;
                # }
                {
                    name = "noctalia";
                    "match:namespace" = "noctalia-background-.*$";
                    ignore_alpha = 0.3;
                    blur = true;
                    blur_popups = true;
                }
                {
                    name = "onscreendisplay";
                    "match:namespace" = "noctalia-osd-.*$";
                    ignore_alpha = 0.1;
                    blur = true;
                    blur_popups = true;
                }
                {
                    name = "notifications";
                    "match:namespace" = "noctalia-notifications-.*$";
                    ignore_alpha = 0.1;
                    blur = true;
                    blur_popups = true;
                }
            ];
        };

        programs.kitty.settings = {
            window_padding_width = "10 12";
            background_opacity = 0.775;
        };
    };
}

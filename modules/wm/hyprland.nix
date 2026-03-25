{ inputs, ... }:
{
    flake.nixosModules.hyprlandModule = { self, inputs, pkgs, ... }: {
        imports = [
            self.poseidonBatteryOptimizations
            self.poseidonDisplayModule
        ];

        environment.systemPackages = [ pkgs.wayland ];
        services.xserver = {
            enable = true;
            xkb = {
                layout = "us";
                variant = "colemak_dh";
            };
        };

        programs.hyprland = {
            enable = true;
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
            portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        };

        services.displayManager.gdm.enable = true;
        services.gnome.gnome-keyring.enable = true;

        # Mountable Drives
        services.devmon.enable = true;
        services.gvfs.enable = true;
        services.udisks2.enable = true;
    };

    flake.homeModules.hyprlandModule = { self, inputs, pkgs, ... }: {
        imports = [
            self.homeModules.kittyModule
            self.homeModules.fishModule
        ];

        home.packages = with pkgs; [
            hyprshot
        ];

        wayland.windowManager.hyprland = {
            enable = true;
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
            portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
            settings = {
                monitor = [
                    ",preferred,auto,1.0"
                ];

                input = {
                    kb_layout = "us";
                    kb_variant = "colemak_dh";

                    numlock_by_default = true;

                    follow_mouse = 2;
                    sensitivity = 0.2;
                    accel_profile = "0.2144477506 0.000 0.307 0.615 1.077 1.539 2.002 2.505 3.208 3.910 4.613 5.315 6.018 6.720 7.423 8.125 8.828 9.530 10.233 10.935 12.387";

                    touchpad = {
                        natural_scroll = true;
                    };
                };

                device = {
                    name = "instant-usb-gaming-mouse-";
                    accel_profile = "flat";
                    sensitivity = -0.2;
                };

                general = {
                    layout = "scrolling";
                };

                scrolling = {
                    fullscreen_on_one_column = true;
                    column_width = 0.5;
                    explicit_column_widths = "0.333, 0.5, 0.667, 1.0";
                };

                gestures = {
                    workspace_swipe_distance = 600;
                    workspace_swipe_min_speed_to_force = 30;
                };

                gesture = [
                    # Scroll how much force and distance needed to swipe gesture
                    "3, vertical, workspace"
                ];

                dwindle = {
                    pseudotile = true;
                    preserve_split = true;
                };

                animation = [
                    "workspaces, 1, 5, default, slidevert"
                ];

                "$mainMod" = "SUPER";
                bind = [
                    # General Bindings
                    "$mainMod, Q, killactive,"
                    "$mainMod, M, layoutmsg, colresize 1.0"
                    "$mainMod, V, togglefloating,"
                    "$mainMod, T, togglesplit,"

                    "$mainMod, SPACE, exec, vicinae toggle"

                    "$mainMod SHIFT, DELETE, exit"

                    "$mainMod, F11, fullscreen,"
                    "$mainMod SHIFT, F11, fullscreenstate, 0 2"

                    "$mainMod, F1, exec, bash /home/pranavanathryali/hyprland_battery.sh"

                    # TODO: Screenshots
                    "$mainMod SHIFT, PRINT, exec, hyprshot -m region -o /home/pranavanathryali/Pictures/Screenshots/" # TODO: Declare a global username variable
                    ", PRINT, exec, hyprshot -m active -m output -o /home/pranavanathryali/Pictures/Screenshots/"

                    # Application Bindings
                    "$mainMod, RETURN, exec, kitty"
                    "$mainMod, E, exec, nautilus"

                    "$mainMod, 1, workspace, 1"
                    "$mainMod, 2, workspace, 2"
                    "$mainMod, 3, workspace, 3"
                    "$mainMod, 4, workspace, 4"
                    "$mainMod, 5, workspace, 5"
                    "$mainMod, F, workspace, 6"
                    "$mainMod, P, workspace, 7"

                    "$mainMod CONTROL, A, layoutmsg, colresize -conf"
                    "$mainMod CONTROL, S, layoutmsg, colresize +conf"

                    "$mainMod SHIFT, S, movewindow, r"
                    "$mainMod SHIFT, A, movewindow, l"
                    "$mainMod SHIFT, W, movewindow, u"
                    "$mainMod SHIFT, R, movewindow, d"

                    "$mainMod SHIFT, T, layoutmsg, promote"

                    "$mainMod CONTROL SHIFT, S, layoutmsg, swapcol r"
                    "$mainMod CONTROL SHIFT, A, layoutmsg, swapcol l"

                    "$mainMod CONTROL SHIFT, 1, movetoworkspace, 1"
                    "$mainMod CONTROL SHIFT, 2, movetoworkspace, 2"
                    "$mainMod CONTROL SHIFT, 3, movetoworkspace, 3"
                    "$mainMod CONTROL SHIFT, 4, movetoworkspace, 4"
                    "$mainMod CONTROL SHIFT, 5, movetoworkspace, 5"
                    "$mainMod CONTROL SHIFT, F, movetoworkspace, 6"
                    "$mainMod CONTROL SHIFT, P, movetoworkspace, 7"

                    "$mainMod, S, layoutmsg, focus r"
                    "$mainMod, A, layoutmsg, focus l"
                    "$mainMod, W, layoutmsg, focus u"
                    "$mainMod, R, layoutmsg, focus d"

                    "$mainMod, mouse_down, workspace, e-1"
                    "$mainMod, mouse_up, workspace, e-1"
                ];

                binde = [
                    "$mainMod CONTROL, W, resizeactive, 0 -30"
                    "$mainMod CONTROL, R, resizeactive, 0 30"
                ];

                bindel = [
                    ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
                    ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
                    ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                    ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                    ",XF86MonBrightnessUp, exec, brightnessctl s 1%+"
                    ",XF86MonBrightnessDown, exec, brightnessctl s 1%-"
                ];

                bindl = [
                    ", XF86AudioNext, exec, playerctl next"
                    ", XF86AudioPause, exec, playerctl play-pause"
                    ", XF86AudioPlay, exec, playerctl play-pause"
                    ", XF86AudioPrev, exec, playerctl previous"
                ];

                bindm = [
                    "$mainMod, mouse:272, movewindow"
                    "$mainMod, mouse:273, resizewindow"
                ];

                decoration = {
                    rounding = 8;
                    active_opacity = 0.94;
                    inactive_opacity = 0.9;
                    fullscreen_opacity = 1.0;

                    blur = {
                        enabled = true;
                        size = 6;
                        passes = 4;
                        brightness = 0.725;
                    };
                };
            };
        };

        home.file."/home/pranavanathryali/hyprland_battery.sh" = {
            executable = true;
            text = ''
#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword animation borderangle,0; \
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword decoration:fullscreen_opacity 1;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    hyprctl notify 1 5000 "rgb(40a02b)" "Gamemode [ON]"
    exit
else
    hyprctl notify 1 5000 "rgb(d20f39)" "Gamemode [OFF]"
    hyprctl reload
    exit 0
fi
exit 1
            '';
        };
    };
}

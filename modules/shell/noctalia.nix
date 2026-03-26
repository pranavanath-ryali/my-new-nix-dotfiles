{ ... }:
{
    flake.homeModules.noctaliaShellModule = { inputs, lib, ... }: {
        imports = [
            inputs.noctalia.homeModules.default
        ];

        programs.noctalia-shell = {
            enable = true;
            settings = (builtins.fromJSON (builtins.readFile ../rice/default/noctalia.json)).settings;
            # settings = {
            #     # configure noctalia here
            #     bar = {
            #         density = "compact";
            #         position = "right";
            #         showCapsule = false;
            #         widgets = {
            #             left = [
            #                 {
            #                     id = "ControlCenter";
            #                     useDistroLogo = true;
            #                 }
            #                 {
            #                     id = "Network";
            #                 }
            #                 {
            #                     id = "Bluetooth";
            #                 }
            #             ];
            #             center = [
            #                 {
            #                     hideUnoccupied = false;
            #                     id = "Workspace";
            #                     labelMode = "none";
            #                 }
            #             ];
            #             right = [
            #                 {
            #                     alwaysShowPercentage = false;
            #                     id = "Battery";
            #                     warningThreshold = 30;
            #                 }
            #                 {
            #                     formatHorizontal = "HH:mm";
            #                     formatVertical = "HH mm";
            #                     id = "Clock";
            #                     useMonospacedFont = true;
            #                     usePrimaryColor = true;
            #                 }
            #             ];
            #         };
            #         colorSchemes.predefinedScheme = "Monochrome";
            #         general = {
            #             avatarImage = "/home/drfoobar/.face";
            #             radiusRatio = 0.2;
            #         };
            #         location = {
            #             monthBeforeDay = true;
            #             name = "Marseille, France";
            #         };
            #     };
            # };
        };

        wayland.windowManager.hyprland.settings = {
            exec-once = lib.mkAfter [
                "noctalia-shell"
            ];

            "$ipc" = "noctalia-shell ipc call";
            bind = lib.mkAfter [
                "$mainMod, SPACE, exec, $ipc launcher toggle"
            ];

            bindel = lib.mkAfter [
                ", XF86AudioRaiseVolume, exec, $ipc volume increase"
                ", XF86AudioLowerVolume, exec, $ipc volume decrease"
                ", XF86MonBrightnessUp, exec, $ipc brightness increase"
                ", XF86MonBrightnessDown, exec, $ipc brightness decrease"
            ];

            bindl = lib.mkAfter [
                ", XF86AudioMute, exec, $ipc volume muteOutput"
            ];
        };
    };
}

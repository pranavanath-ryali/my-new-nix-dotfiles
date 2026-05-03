{ ... }:
{
  flake.homeModules.hyprlandPitchBlackRice =
    {
      self,
      config,
      pkgs,
      ...
    }:
    {
      imports = [
        self.homeModules.kittyModule
        self.homeModules.fishModule
        self.homeModules.vicinaeModule
        self.homeModules.awwwModule
        self.homeModules.dunstModule
        self.homeModules.waybarModule
      ];

      config.home.packages = with pkgs; [
        nautilus
        file-roller
        euphonica
        zathura
      ];

      config.dotfiles.hyprland = {
        exec-once = [
          "awww-daemon"
        ];

        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92 "
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1"
        ];

        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slidefadevert 15%"
          # "workspaces, 1, 7, menu_decel, slidevert"
          # "workspaces, 1, 2.5, softAcDecel, slidevert"
          # "layers, 1, 2, md3_decel, slide"
          # "specialWorkspace, 1, 3, md3_decel, slidefadevert 15%"
        ];

        general = {
          border_size = 4;
          gaps_in = 8;
          gaps_out = 18;

        };

        decoration = {
          rounding = 0;

          dim_inactive = true;
          dim_strength = 0.125;

          blur.enabled = false;

          shadow = {
            enabled = true;
            range = 12;
            render_power = 4;

            offset = "6 6";
            scale = 1.0;
          };
        };

        color = {
          inactive_border = "0xff8f8f8f";
          active_border = "0xffffffff";

          shadow_active = "rgba(505050ff)";
          shadow_inactive = "rgba(505050ff)";
        };

        bind = [
          "$mainMod, RETURN, exec, kitty"

          "$mainMod, SPACE, exec, vicinae toggle"
        ];
        bindel = [
          ",XF86MonBrightnessUp, exec, brightnessctl s 1%+"
          ",XF86MonBrightnessDown, exec, brightnessctl s 1%-"
        ];
      };

    };
}

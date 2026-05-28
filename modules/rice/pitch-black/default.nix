{ ... }:
{
  flake.nixosModules.pitchBlackRice =
    { pkgs, ... }:
    {
      boot = {
        plymouth = {
          enable = true;
          theme = "hexagon_dots_alt";
          themePackages = with pkgs; [
            (adi1090x-plymouth-themes.override {
              selected_themes = [ "hexagon_dots_alt" ];
            })
          ];
        };

        # Enable "Silent boot"
        consoleLogLevel = 3;
        initrd.verbose = false;
        kernelParams = [
          "quiet"
          "udev.log_level=3"
          "systemd.show_status=auto"
        ];
        # Hide the OS choice for bootloaders.
        # It's still possible to open the bootloader list by pressing any key
        # It will just not appear on screen unless a key is pressed
        loader.timeout = 0;
      };

      fonts.packages = with pkgs; [
        nerd-fonts.martian-mono
        nerd-fonts.iosevka
      ];
    };

  flake.homeModules.pitchBlackRice =
    {
      self,
      pkgs,
      config,
      ...
    }:
    {
      imports = [
        self.homeModules.hyprlandPitchBlackRice
      ];

      # ======================== DUNST CONFIG ========================
      config.dotfiles.dunst = {
        global = {
          width = "350";
          height = "(50, 350)";
          offset = "(8, 8)";
          origin = "top-right";
          gap_size = 4;
          transparency = 10;
          frame_color = "#eceff1";
          font = "MartianMono NF 8";
        };
      };

      # ======================== VICINAE CONFIG ========================
      config.dotfiles.vicinae = {
        settings = {
          launcher_window = {
            # opacity = 1.0;
            client_side_decorations = {
              enabled = false;
              # rounding = 0;
            };
          };
        };
      };

      # ======================== KITTY CONFIG ========================
      config.programs.kitty.themeFile = "Hurtado";

      # ======================== WAYBAR CONFIG ========================
      config.dotfiles.waybar = {
        settings = {
          mainBar = {
            layer = "top";
            position = "bottom";
            height = 20;
            output = [
              "eDP-1"
            ];
            modules-left = [

            ];
            modules-center = [

            ];
            modules-right = [
              "battery"
            ];

            "battery" = {
              interval = 60;
              states = {
                warning = 40;
                critical = 20;
              };
              format = "{icon} {capacity}%";
            };
          };
        };
      };
    };
}

{ ... }:
{
  flake.nixosModules.pitchBlackRice =
    { pkgs, self, ... }:
    {
      import = [
        self.nixosModules.dunstModule
      ];

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
        nerd-fonts.departure-mono
      ];
    };

  flake.homeModules.pitchBlackRice =
    { self, pkgs, ... }:
    {
      imports = [
        self.homeModules.hyprlandPitchBlackRice
      ];
    };
}

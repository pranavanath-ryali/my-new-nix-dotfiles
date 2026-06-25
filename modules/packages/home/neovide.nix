{ ... }:
{
  flake.homeModules.neovideModule =
    { config, lib, ... }:
    {
      programs.neovide = {
        enable = true;
        settings = {
          linespace = 2;

          font = {
            normal = [ "CaskaydiaCove Nerd Font" ];
            size = 10.0;
          };
        };
      };

      wayland.windowManager.hyprland.settings.bind = lib.mkAfter [
        "$mainMod, N, exec, neovide"
      ];
    };
}

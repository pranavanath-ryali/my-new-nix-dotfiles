{ ... }:
{
  flake.homeModules.hyprlandPitchBlackRice =
    { config, ... }:
    {
      config.dotfiles.hyprland = {
        bindel = [
          ",XF86MonBrightnessUp, exec, brightnessctl s 5%+"
          ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        ];
      };
    };
}

{ ... }:
{
  flake.homeModules.waybarModule =
    {
      options,
      config,
      lib,
      ...
    }:
    let
      inherit (lib) mkOption types;
    in
    {
      options.dotfiles.waybar = mkOption {
        default = { };
        type = types.submodule {
          options = {
            settings = mkOption {
              default = { };
              type = types.attrs;
            };
            style = mkOption {
              default = "";
              type = types.str;
            };
          };
        };
      };
      config = {
        programs.waybar = {
          enable = true;
          settings = config.dotfiles.waybar.settings;
          style = config.dotfiles.waybar.style;
        };
      };
    };
}

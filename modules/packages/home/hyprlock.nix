{ ... }:
{
  flake.homeModules.hyprlockModule =
    {
      options,
      config,
      lib,
      inputs,
      ...
    }:
    let
      inherit (lib) mkOption types;
    in
    {
      options.dotfiles.hyprlock = mkOption {
        type = types.submodule {
          options = {
            settings = mkOption {
              type = types.attrs;
              default = { };
            };
          };
        };
        default = { };
      };
      config = {
        programs.hyprlock = {
          enable = true;
          settings = config.dotfiles.hyprlock.settings;
        };
      };
    };
}

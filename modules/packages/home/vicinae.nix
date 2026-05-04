{ ... }:
{
  flake.homeModules.vicinaeModule =
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
      options.dotfiles.vicinae = mkOption {
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
        programs.vicinae = {
          enable = true;
          useLayerShell = true;
          systemd = {
            enable = true;
            autoStart = true;
          };
          settings = config.dotfiles.vicinae.settings;
        };
      };
    };
}

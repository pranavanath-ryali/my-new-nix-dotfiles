{ ... }:
{
  flake.homeModules.dunstModule =
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
      options.dotfiles.dunst = mkOption {
        type = types.attrs;
        default = { };
      };

      config = {
        services.dunst = {
          enable = true;
          settings = config.dotfiles.dunst;
        };
      };
    };
}

{ ... }:
{
  flake.nixosModules.dunstModule =
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
        type = types.attr;
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

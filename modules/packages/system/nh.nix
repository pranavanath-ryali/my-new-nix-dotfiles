{ userSettings, ... }:
{
    flake.nixosModules.nhModule = { ... }: {
        programs.nh = {
          enable = true;
          flake = "/home/userSettings.username/.dotfiles";
        };
    };
}

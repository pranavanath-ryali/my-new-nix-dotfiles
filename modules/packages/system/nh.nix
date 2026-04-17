{ ... }:
{
    flake.nixosModules.nhModule = { ... }: {
        programs.nh = {
          enable = true;
          flake = "/home/pranavanathryali/.dotfiles";
        };
    };
}

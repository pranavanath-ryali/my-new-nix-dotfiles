{ ... }:
{
    flake.nixosModules.nhModule = { ... }: {
        programs.nh = {
          enable = true;
          flake = "/home/pranavanath/.dotfiles";
        };
    };
}

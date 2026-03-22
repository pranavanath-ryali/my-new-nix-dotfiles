{ ... }:
{
    flake.nixosModules.direnvModule = { ... }: {
        programs.direnv.enable = true;
    };
}
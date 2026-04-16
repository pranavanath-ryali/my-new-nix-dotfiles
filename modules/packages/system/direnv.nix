{ ... }:
{
    flake.nixosModules.direnvModule = { ... }: {
        programs.direnv.enable = true;
        programs.direnv.enableFishIntegration = true;
    };
}

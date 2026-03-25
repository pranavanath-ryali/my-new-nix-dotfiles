{ ... }:
{
    flake.nixosModules.poseidonDisplayModule = { ... }: {
        services.geoclue2.enable = true;
        location.provider = "geoclue2";

    };
}

{ ... }:
{
    flake.nixosModules.syncthingModule = { ... }: {
        services.syncthing = {
        enable = true;
            openDefaultPorts = true;
        };
    };
}
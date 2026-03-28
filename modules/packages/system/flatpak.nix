{ ... }:
{
    flake.nixosModules.flatpakModule = { ... }: {
         services.flatpak.enable = true;
    };
}

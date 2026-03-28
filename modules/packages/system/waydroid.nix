{ ... }:
{
    flake.nixosModules.waydroidModule = { ... }: {
        virtualisation.waydroid.enable = true;
    };
}

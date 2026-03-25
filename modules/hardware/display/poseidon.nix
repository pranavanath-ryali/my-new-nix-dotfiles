{ ... }:
{
    flake.nixosModules.poseidonDisplayModule = { ... }: {
        services.geoclue2.enable = true;
        location.provider = "geoclue2";

        services.gammastep = {
            enable = true;
            tray = true;
            provider = "geoclue2";

            temperature = {
                day = 7000;
                night = 3500;
            };

            dawnTime = "4:00-5:00";
            duskTime = "23:35-24:00";
        };
    };
}

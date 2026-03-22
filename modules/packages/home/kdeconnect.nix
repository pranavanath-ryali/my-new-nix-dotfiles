{ ... }:
{
    flake.homeModules.kdeConnectModule = { ... }: {
        services.kdeconnect.enable = true;
    };

    flake.nixosModules.kdeConnectModule = { ... }: {
        networking.firewall = rec {
            allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
            allowedUDPPortRanges = allowedTCPPortRanges;
        };
    };
}
{ inputs, ... }:
{
    flake.nixosModules.bluetoothModule = { ... }: {
        hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
            settings = {
                General = {
                    Experimental = true;
                    FastConnectable = true;
                };
                Policy = {
                    # Enable all controllers when they are found. This includes
                    # adapters present on start as well as adapters that are plugged
                    # in later on. Defaults to 'true'.
                    AutoEnable = true;
                };
            };
        };
        services.blueman.enable = true;
    };
}
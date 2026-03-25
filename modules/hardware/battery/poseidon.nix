{ ... }:
{
    flake.nixosModules.poseidonBatteryOptimizations = { ... }: {
        # Power Management
        powerManagement.enable = true;

        services.upower.enable = true;
        services.tlp = {
            enable = true;

            settings = {
                CPU_SCALING_GOVERNOR_ON_AC = "performance";
                CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

                CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

                START_CHARGE_THRESH_BAT0 = 75;
                STOP_CHARGE_THRESH_BAT0 = 80;
            };
        };

        services.logind.settings.Login = {
            lidSwitch = "suspend";
            powerKey = "suspend";
        };

        boot.kernelParams = [
            "pcie_aspm=force"
            "pcie_aspm.policy=powersupersave"
        ];
    };
}

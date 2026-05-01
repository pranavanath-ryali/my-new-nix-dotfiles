{ ... }:
{
    flake.homeModules.prismLauncherModule = { pkgs, ... }:
    {
        home.packages = with pkgs; [
            (prismlauncher.override {
                additionalPrograms = [ffmpeg];

                jdks = [
                    zulu8
                    zulu25
                ];
            })
        ];
    };
}

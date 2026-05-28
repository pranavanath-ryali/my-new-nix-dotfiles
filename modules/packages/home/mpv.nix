{ ... }:
{
    flake.homeModules.mpvModule = { pkgs, ... }: {
        programs.mpv = {
            enable = true;

            # package = (
            #     pkgs.mpv.override {
            #         scripts = with pkgs.mpvScripts; [
            #             uosc
            #             sponsorblock
            #         ];

            #         mpv = pkgs.mpv-unwrapped.override {
            #             ffmpeg = pkgs.ffmpeg-full;
            #             waylandSupport = true;
            #         };
            #     }
            # );

            # package = (
            #   pkgs.mpv.override {
            #     scripts = with pkgs.mpvScripts [
            #       uosc
            #       sponsorblock
            #     ];
            #   }
            # );

            config = {
                profile = "high-quality";
                ytdl-format = "bestvideo+bestaudio";
                cache-default = 4000000;
            };
        };
    };
}

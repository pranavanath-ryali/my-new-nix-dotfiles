{ ... }:
{
    flake.homeModules.zenBrowserModule = { inputs, pkgs, ... }: {
        home.packags = [
            inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
    };
}

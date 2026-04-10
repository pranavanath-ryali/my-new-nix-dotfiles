{ ... }:
{
    flake.homeModules.heliumBrowserModule = { inputs, ... }: {
        home.packages = [
            inputs.helium.packages.${system}.default
        ];
    };
}

{ ... }:
{
    flake.homeModules.riceDefaultNoctalia = { self, lib, ... }: {
        imports = [
            self.homeModules.kittyModule
            self.homeModules.fishModule
        ];
    };
}

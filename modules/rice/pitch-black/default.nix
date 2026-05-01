{ ... }:
{
  flake.nixosModules.pitchBlackRice = { ... }: { };

  flake.homeModules.pitchBlackRice =
    { self, pkgs, ... }:
    {
      imports = [
        self.homeModules.hyprlandPitchBlackRice
      ];
    };
}

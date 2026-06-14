{ userSettings, ... }:
{
  flake.nixosModules.dockerModule = { ... }: {
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}

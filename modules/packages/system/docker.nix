{ userSettings, ... }:
{
  flake.nixosModules.dockerModule = { ... }: {
    virtualization.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}

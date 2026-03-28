{
    flake.nixosModules.nixosContainerModule = { ... }: {
        boot.enableContainers = true;
        virtualisation.containers.enable = true;
    };
}

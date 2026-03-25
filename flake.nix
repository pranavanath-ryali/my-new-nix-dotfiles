{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/release-25.11";
        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";

        home-manager.url = "github:nix-community/home-manager/release-25.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        hyprland.url = "github:hyprwm/Hyprland";

        illogical-flake.url = "github:soymou/illogical-flake";

        caelestia-shell = {
            url = "github:caelestia-dots/shell";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        caelestia-cli.url = "github:caelestia-dots/cli";
        caelestia-cli.inputs.nixpkgs.follows = "nixpkgs";

        # NixVim
        nixvim.url = "github:nix-community/nixvim";

        # NVF
        nvf.url = "github:NotAShelf/nvf";
        nvf.inputs.nixpkgs.follows = "nixpkgs";

        zen-browser.url = "github:youwen5/zen-browser-flake";
        zen-browser.inputs.nixpkgs.follows = "nixpkgs";

        # Vicinae
        vicinae.url = "github:vicinaehq/vicinae";
    };

    outputs = inputs@{ flake-parts, import-tree, ... }:
        flake-parts.lib.mkFlake { inherit inputs; }
            (import-tree ./modules);
}

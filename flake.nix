{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/release-25.11";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";

        chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

        home-manager.url = "github:nix-community/home-manager/release-25.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        hyprland.url = "github:hyprwm/Hyprland";

        noctalia.url = "github:noctalia-dev/noctalia-shell";
        noctalia.inputs.nixpkgs.follows = "nixpkgs-unstable";

        # NixVim
        nixvim.url = "github:nix-community/nixvim";

        # NVF
        nvf.url = "github:NotAShelf/nvf";
        nvf.inputs.nixpkgs.follows = "nixpkgs";

        # Zen Browser
        zen-browser.url = "github:youwen5/zen-browser-flake";
        zen-browser.inputs.nixpkgs.follows = "nixpkgs";

        # Helium Browser
        helium.url = "github:schembriaiden/helium-browser-nix-flake";
        helium.inputs.nixpkgs.follows = "nixpkgs";

        # Vicinae
        vicinae.url = "github:vicinaehq/vicinae";

        # AWWW
        awww.url = "git+https://codeberg.org/LGFae/awww";
    };

    outputs = inputs@{ chaotic, flake-parts, import-tree, ... }: 
    flake-parts.lib.mkFlake { inherit inputs; }
    {
        imports = [ (import-tree ./modules) ];

        _module.args = {
            globalSettings = {
                wm = "hyprland";
                rice = "pitch-black";
            };
        };
    };
}

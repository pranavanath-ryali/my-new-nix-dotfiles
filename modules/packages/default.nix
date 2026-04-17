{...}: {
  flake.nixosModules.basePackages = {
    self,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.direnvModule
      self.nixosModules.kdeConnectModule
      self.nixosModules.steamModule
      self.nixosModules.waydroidModule
      self.nixosModules.flatpakModule
      self.nixosModules.nixosContainerModule
      self.nixosModules.virtualizationModule
      self.nixosModules.nhModule
    ];

    environment.systemPackages = with pkgs; [
      linux-wifi-hotspot

      zed-editor

      powertop
      nvme-cli

      btop
      htop
      ranger
      grc
      ripgrep
      bat
      pciutils
      ispell
      inotify-tools
      libnotify
      wireplumber
      qjackctl
      pavucontrol

      git
      gh

      vim
      wget
      curl
      unzip
      cmatrix

      gcc

      jack2
      qjackctl

      adw-gtk3
      papirus-icon-theme
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove

      montserrat
      garamond-libre
      merriweather
    ];
  };

  flake.homeModules.basePackages = {
    self,
    pkgs,
    inputs,
    ...
  }: {
    imports = [
      self.homeModules.heliumBrowserModule
      self.homeModules.musicModule
      self.homeModules.kdeConnectModule
      self.homeModules.nvfModule
      self.homeModules.mpvModule
    ];

    home.packages = with pkgs; [
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

      lazygit
      wl-gammactl
      imagemagick
      inotify-tools
      libnotify

      vim
      neovim
      localsend
      vscode
      obsidian

      libreoffice
      calibre

      easyeffects
      strawberry
      lrcget

      bottles
      discord
      (prismlauncher.override {
        # Add binary required by some mod
        additionalPrograms = [ffmpeg];

        # Change Java runtimes available to Prism Launcher
        jdks = [
          zulu8
          zulu25
        ];
      })
    ];

    networking.firewall = {
      allowedTCPPorts = [ 53317 ];
    };
  };
}

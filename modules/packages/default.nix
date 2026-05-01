{...}: {
  flake.nixosModules.basePackages = {
    self,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.direnvModule
      self.nixosModules.steamModule
      self.nixosModules.waydroidModule
      self.nixosModules.flatpakModule
      self.nixosModules.nixosContainerModule
      self.nixosModules.virtualizationModule
      self.nixosModules.nhModule
    ];

    environment.systemPackages = with pkgs; [
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
      self.homeModules.direnvModule
      self.homeModules.heliumBrowserModule
      self.homeModules.musicModule
      self.homeModules.nvfModule
      self.homeModules.neovideModule
      self.homeModules.mpvModule
      self.homeModules.prismLauncherModule
    ];

    home.packages = with pkgs; [
      lazygit
      wl-gammactl
      imagemagick
      inotify-tools
      libnotify

      vim
      neovim
      ollama
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
    ];
  };
}

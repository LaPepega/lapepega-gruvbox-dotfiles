{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pepegOS"; # Define your hostname.
  networking.networkmanager.enable = true;
  
  time.timeZone = "Asia/Yekaterinburg";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024; # 16GB
  }];
  
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
  };

  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "startx";
        user = "lapepega";
      };
    };
  };

  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

  users.users.lapepega = {
    isNormalUser = true;
    description = "LaPepega";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  environment.variables = {
  };
  
  environment.systemPackages = with pkgs; [
    polybar
    rofi
    bspwm
    sxhkd
    polybar
    ksuperkey

    pulseaudio
    greetd.greetd
    ntfs3g    

    kitty
    zsh
    wget
    git
    imagemagick
    tldr
    doas
    htop

    atool
    zip
    unzip
    xclip
    zoxide
    feh
    wine
    winetricks
    protontricks
    tmux
    git-credential-oauth

    gnumake
    cmake
    libgcc
    dotnetCorePackages.sdk_9_0
    jdk
    nodePackages.nodejs
    nodePackages.npm
    python312Packages.pip
    python3
    rustup
    docker
    docker-compose
    docker-buildx
    

    firefox
    discord
    steam
    steamPackages.steamcmd
    pavucontrol
    arandr
    vlc
    qbittorrent
    vscode

    gruvbox-gtk-theme
    papirus-icon-theme
    lxappearance
    graphite-cursors
    home-manager
    
#    xdg-desktop-portal
#    xdg-desktop-portal-hyprland
#    xdg-desktop-portal-gtk
#    xdg-desktop-portal-wlr
  ];

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  programs = {
    hyprlock.enable = true;
    hyprland.enable = true;
    steam.enable = true;
  };

  virtualisation.docker.enable = true;

  security.doas.enable = true;
  security.doas.extraConfig = "permit nopass lapepega";
  security.doas.extraRules = [{
    users = [ "lapepega" ];
    keepEnv = true;
    noPass = true;
  }];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.05"; # Did you read the comment?
}

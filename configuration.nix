{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    
    alacritty
    bibata-cursors
    btop
    discord
    eww
    fastfetch
    foot
    galculator
    gamemode
    github-desktop
    hyprlock
    hyprpaper
    hyprshot
    hyprsunset
    imv
    libreoffice
    librewolf-wayland
    mako
    mangohud
    mpv
    mpvpaper
    neovim
    nvtopPackages.full
    nwg-look
    pavucontrol
    pcmanfm
    prismlauncher
    qbittorrent
    rofi-wayland
    signal-desktop
    starship
    tmux
    ungoogled-chromium
    waypaper
    wev
    yazi
    zsh
				  
    dash		          #─┬ needed
    git			          # │
    jq			          # │
    killall		          # │
    libnotify		          # │
    nh			          # │
    socat		          # │
    unzip		          # │
    uutils-coreutils-noprefix     # │
    uutils-diffutils		  # │
    uutils-findutils		  #─╯

    egl-wayland			  #─┬ driver related
    libGL                         # │
    libglvnd                      # │
    libva-utils                   # │
    libvdpau-va-gl                # │
    mesa                          # │
    vdpauinfo                     # │
    vulkan-tools                  # │
    vulkan-validation-layers      # │
    wgpu-utils                    #─╯

    (graphite-gtk-theme.override {
      sizeVariants = [ "compact" ];
      tweaks = [ "black" "rimless" ];
      withGrub = true;
    })
  ];

  fonts.packages = with pkgs; [
    adwaita-fonts
    font-awesome
    maple-mono.NF
    nerd-fonts.caskaydia-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
  ];

  programs.nano.enable = false;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
#    configure = {
#      customRC = ''
#        set number
#        set cc=80
#        set list
#        set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
#        if &diff
#          colorscheme blue
#        endif
#      '';
#      packages.myVimPackage = with pkgs.vimPlugins; {
#        start = [ ctrlp ];
#      };
#    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.steam = {
    enable = true;
#    remotePlay.openFirewall = true;
#    dedicatedServer.openFirewall = true;
  };

  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
      ];
    };
  };

#  services.gnome.gnome-keyring.enable = true;

#  services.printing.enable = true;
#  services.avahi = {
#    enable = true;
#    nssmdns4 = true;
#    openFirewall = true;
#  };

  services.displayManager.ly.enable = true;

  services.xserver = {
#    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

#  services.getty.autologinUser = "j";

  systemd.services."systemd-run".serviceConfig.ExecStart = "/bin/true";  # Disable systemd-run

  security.sudo.enable = false;
#  security.sudo-rs.enable = true;
#  programs.doas-sudo-shim.enable = true;
#  security.doas.enable = true;
#  security.doas.extraRules = [{
#    groups = ["wheel"];
#    keepEnv = true;  # Optional, retains environment variables while running commands 
#                     # e.g. retains your NIX_PATH when applying your config
#    persist = true;  # Optional, only require password verification a single time
#  }];

  security.rtkit.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
#  networking.wireless.enable = true;
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  environment.variables.EDITOR = "nvim";

  users.users.j = {
    isNormalUser = true;
    description = "j";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
#    grub = {
#      enable = true;
#      devices = [ "nodev" ];
#      efiSupport = true;
#      useOSProber = true;
#    };
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
#  boot.kernelModules = [ "nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia" "glaxnimate" ];
  boot.blacklistedKernelModules=["nouveau"];

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;  # or can pick beta
#    powerManagement = {
#      enable = false;
#      finegrained = false;
#    };
    nvidiaSettings = true;
#    nvidiaPersistenced = true;
    modesetting.enable = true;
#    dynamicBoost.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}


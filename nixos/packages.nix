{ config, pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alacritty
    bibata-cursors
    bottom
    btop
    discord
    cmst
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
    skim
    starship
    tmux
    ungoogled-chromium
    waypaper
    wev
    wget
    yazi
    ydotool
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
#    cuda                          #─┬ nvidia related
#    egl-wayland                   # │
#    libGL                         # │
#    libglvnd                      # │
#    libva-utils                   # │
#    libvdpau-va-gl                # │
#    mesa                          # │
#    vdpauinfo                     # │
#    vulkan-tools                  # │
#    vulkan-validation-layers      # │
#    wgpu-utils                    #─╯
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

}


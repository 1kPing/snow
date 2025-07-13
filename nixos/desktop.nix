{ config, pkgs, ... }:

{
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

  security.rtkit.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  environment.variables.EDITOR = "nvim";
}


{ config, pkgs, ... }: {

  services = {
    connman.enable = true;
#    printing.enable = true;
#    gnome.gnome-keyring.enable = true;

#    avahi = {
#      enable = true;
#      nssmdns4 = true;
#      openFirewall = true;
#    };

    ollama = {
      enable = true;
    };

    open-webui = {
      enable = true;
#      port = 8080;
    };

    displayManager = {
      ly = {
        enable = true;
      };
    };

    xserver = {
#      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  }; 

}


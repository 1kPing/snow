{ config, pkgs, ... }:

{
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

  systemd.services."systemd-run".serviceConfig.ExecStart = "/bin/true";
}


{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
#  boot.kernelModules = [ "nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia" "glaxnimate" ];
  boot.blacklistedKernelModules = ["nouveau"];

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
#    powerManagement = {
#      enable = false;
#      finegrained = false;
#    };
    nvidiaSettings = true;
#    nvidiaPersistenced = true;
    modesetting.enable = true;
#    dynamicBoost.enable = true;
  };
}


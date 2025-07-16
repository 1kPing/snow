{ config, lib, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
  ];
 
  hardware.graphics.enable = true;

###########
# AMD GPU

# soon
          #
###########


#############
# INTEL GPU

# soon
            #
#############


##############
# NVIDIA GPU

  boot = {
#    kernelModules = [ "nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia" "glaxnimate" ];
    blacklistedKernelModules = ["nouveau"];
  };

  hardware.nvidia = {
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    nvidiaSettings = true;
    modesetting.enable = true;
#    dynamicBoost.enable = true;
#    nvidiaPersistenced = true;
#    powerManagement = {
#      enable = false;
#      finegrained = false;
#    };
  };

  services = {
    xserver.videoDrivers = [ "nvidia" ];
    ollama.acceleration = "cuda";
  };

  nixpkgs.config.allowUnfreePredicate = with pkgs; [
    "cuda_cccl"
    "cuda_cudart"
    "cuda_nvcc"
    "libcublas"
  ];
             #
##############

}


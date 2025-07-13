{ config, pkgs, ... }:

{
  users.users.j = {
    isNormalUser = true;
    description = "j";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

#  services.getty.autologinUser = "j";

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
}


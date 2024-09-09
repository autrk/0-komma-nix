{ config, pkgs, ... }: {
  home.username =  "autrk";
  home.homeDirectory = "/home/autrk";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.tree
    pkgs.neovim
  ];
}

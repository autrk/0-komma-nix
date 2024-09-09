{ config, pkgs, ... }: {
  home.username =  "autrk";
  home.homeDirectory = "/home/autrk";
  home.stateVersion = "24.05";
 
  # Let Home Manager install and manage itself. 
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.tree
    pkgs.neovim
  ];

  imports = [
    ./features/terminal.nix
  ];
}

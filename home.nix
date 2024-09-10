{ config, pkgs, ... }: {
  home.username =  "autrk";
  home.homeDirectory = "/home/autrk";
  home.stateVersion = "24.05";
 
  # Let Home Manager install and manage itself. 
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.tree
    pkgs.neovim
    pkgs.kubectl
    pkgs.k9s
    pkgs.docker_27
    pkgs.kubectx
  ];

  imports = [
    ./features/terminal.nix
  ];
}

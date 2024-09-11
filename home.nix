{ config, pkgs, ... }: {
  home.username =  "autrk";
  home.homeDirectory = "/home/autrk";
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion 
  home.stateVersion = "24.05";
 
  # Let Home Manager install and manage itself. 
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.neofetch
    pkgs.tree
    pkgs.neovim
    pkgs.kubectl
    pkgs.k9s
    pkgs.kubectx
  ];
   
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  programs.git = {
    enable = true;
    userName = "Christian Kihm-Landau";
    userEmail = "57010+autrk@users.noreply.github.com";
  };

  imports = [
    ./features/terminal.nix
  ];
}

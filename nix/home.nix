{ pkgs, ...}: 

{
  home.username = "lapepega";
  home.homeDirectory = "/home/lapepega";
  home.stateVersion = "24.05";

  

  programs = {
    git = {
        enable = true;
        extraConfig = {
            credential.helper = "oauth";
        };
    };
  };
}

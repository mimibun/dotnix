{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./noctalia.nix
  ];

  home.packages = with pkgs; [];
}
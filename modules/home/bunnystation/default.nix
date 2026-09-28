{ pkgs, ... }:

{
  imports = [
    ./niri.nix
    ./noctalia.nix
  ];

  home.packages = with pkgs; [
  ];

  programs = {
  };
}

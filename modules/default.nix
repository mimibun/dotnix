{ pkgs, ... }:
{
  imports = [
    ./stylix.nix
  ];

  services = {
    gnome.gnome-keyring.enable = true;
  };
}

{ pkgs, ... }:
{
  imports = [];

  services = {
    gnome.gnome-keyring.enable = true;

    openssh = {
      enable = false;
      ports = [ 69 ];
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}

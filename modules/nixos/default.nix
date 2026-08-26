{ pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

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

  programs.noctalia-greeter = {
    enable = true;

    # Optional configuration
    greeter-args = "";
    # Full declarative greeter.toml (overwritten on each activation).
    # See examples/greeter.toml for every key (appearance.palette, output, …).
    settings = {
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 24;
        path = "${pkgs.bibata-cursors}/share/icons";
      };
      keyboard = {
        layout = "de";
      };
    };
  };
}

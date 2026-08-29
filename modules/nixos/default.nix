{ pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  services = {
    gnome.gnome-keyring.enable = true;

    openssh = {
      enable = true;
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

  programs.ioquake3 = {
    enable = true;
    settings = {
      sensitivity = 0.6;
      name = "mimi";
      com_maxfps = 280;
      cg_drawFPS = true;
      cg_fov = 103;
      r_mode = "-1";
      r_customheight = 1440;
      r_customwidth = 2560;
    };
  };

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      droidcam-obs
    ];
  };
}

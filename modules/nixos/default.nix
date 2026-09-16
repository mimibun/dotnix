{ pkgs, inputs, ... }:
{
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

  programs = {
    noctalia-greeter = {
      enable = true;
      greeter-args = "";
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

   ioquake3 = {
      baseq3 = "/home/mimi/.local/state/Quake3";
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

    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs.obs-studio-plugins; [
        droidcam-obs
      ];
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };
}

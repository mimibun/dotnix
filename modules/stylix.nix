{ pkgs, ... }:
{
  stylix = {
    enable = true;
    
    polarity = "dark";

    # cursor = {
    #   name = "Bibata-Modern-Ice";
    #   package = pkgs.bibata-cursors;
    #   size = 24;
    # };

    # fonts = {
    #   serif = {
    #     package = pkgs.literata;
    #     name = "Literata";
    #   };

    # sansSerif = {
    #   package = pkgs.overpass;
    #   name = "Overpass";
    # };

    #   # full monospace
    #   # serif = config.stylix.fonts.monospace;
    #   # sansSerif = config.stylix.fonts.monospace;

    #   monospace = {
    #     # package = pkgs.departure-mono;
    #     # name = "Departure Mono";
    #     package = pkgs.agave;
    #     name = "Agave";
    #   };

    #   emoji = {
    #     package = pkgs.noto-fonts-color-emoji;
    #     name = "Noto Color Emoji";
    #   };
    # };

    icons = {
      enable = true;
      dark = "Tela-dark";
      light = "Tela-light";
      package = pkgs.tela-icon-theme;
    };
  };

  home-manager.sharedModules = [
    {
      stylix.targets = {
        noctalia-shell.enable = true;
        catppuccin.rofi = {
          enable = true;
          flavor = "macchiato";
        };
        catppuccin.btop = {
          enable = true;
          flavor = "macchiato";
        };
        discord.enable = true;
        firefox.enable = true;
        gtk.enable = true;
        hyprland.enable = true;
        qt.enable = true;
      };
    }
  ];
}

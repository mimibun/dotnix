{ lib, pkgs, inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./kitty.nix
    ./shell.nix
    ./vscode.nix
    ./starship.nix
    ./noctalia.nix
    ./vicinae.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    # utils
    usbutils
    btop
    fzf
    gparted
    tig
    nmap
    tldr
    dig
    bat
    s-tui
    pavucontrol
    gimp
    loupe
    nautilus
    gnome-calculator
    gnome-disk-utility
    gnome-characters
    gnome-font-viewer

    # shell
    zoxide
    starship
    lsd

    # coding
    gcc
    rustup
    uv
    nodejs_26

    # social
    signal-desktop
    element-desktop

    # browsers
    ungoogled-chromium

    # fonts
    maple-mono.NF-unhinted
    font-awesome_7
    inputs.apple-fonts.packages.${pkgs.system}.sf-pro

    # programs
    obsidian
    spotify
    
    # 3d
    prusa-slicer
    orca-slicer
    freecad

    # gaming
    prismlauncher
  ];

  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  programs = {
    # kitty = {
    #   enable = true;
    #   themeFile = "Catppuccin-Macchiato";
    #   extraConfig = builtins.readFile ./kitty/kitty.conf;
    #   shellIntegration.enableFishIntegration = true;
    # };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    vesktop = {
      enable = true;

      vencord.settings = {};
    };
  };

  xdg = { 
    enable = true;

    desktopEntries.loupe = {
      name = "Loupe";
      exec = "${pkgs.loupe}/bin/loupe";
    };    

    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "x-scheme-handler/about" = ["firefox.desktop"];
        "x-scheme-handler/unknown" = ["firefox.desktop"];
        "image/png" = ["loupe.desktop"];
        "image/jpg" = ["loupe.desktop"];
        "image/jpeg" = ["loupe.desktop"];
        "image/bmp" = ["loupe.desktop"];
      };
    }; 
  };
}

{ lib, pkgs, inputs, ... }:
{
  imports = [
    ./hypr/hyprland.nix
    ./shell.nix
    ./vscode.nix
    ./starship/starship.nix
    ./rofi/rofi.nix
    ./noctalia.nix
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
    brightnessctl
    dig
    bat
    s-tui


    # shell
    zoxide
    starship
    lsd

    # coding
    gcc
    rustup

    # social
    signal-desktop

    # fonts
    maple-mono.NF-unhinted
    font-awesome_7
    inputs.apple-fonts.packages.${pkgs.system}.sf-pro

    # programs
    obsidian
    spotify
    freecad
    flatpak
    orca-slicer
    nautilus
  ];

  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  programs = {
    kitty = {
      enable = true;
      themeFile = "Catppuccin-Macchiato";
      extraConfig = builtins.readFile ./kitty/kitty.conf;
      shellIntegration.enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    waybar.enable = true;

    discord.enable = true;
    rofi.enable = true;
    vicinae.enable = true;
  };
}

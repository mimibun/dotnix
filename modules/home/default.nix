{ lib, pkgs, ... }:
{
  imports = [
    ./hypr/hyprland.nix
    ./shell.nix
    ./vscode.nix
    ./starship/starship.nix
    ./rofi/rofi.nix
    # ./waybar/waybar.nix
    ./noctalia.nix
  ];

  home.packages = with pkgs; [
    # utils
    usbutils
    btop
    fzf
    gparted
    vscode
    tig
    nmap
    tldr
    brightnessctl
    dig
    bat

    # shell
    zoxide
    starship
    lsd

    # social
    signal-desktop

    # fonts
    maple-mono.NF-unhinted
    font-awesome_7

    # programs
    obsidian

    hyprpaper
  ];

  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true; # Uncomment if you use any XWayland apps
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
    hyprlock.enable = true;
    vicinae.enable = true;
  };
}

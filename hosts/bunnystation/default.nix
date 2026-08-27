# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ../../modules/nixos/default.nix
  ];

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "bunnystation";
    networkmanager.enable = true;

    firewall = {
      enable = true;

      allowedTCPPorts = [ 8883 ];
      allowedUDPPorts = [ 1990 2021 ];
    
      extraCommands = ''
        iptables -I INPUT -m pkttype --pkt-type multicast -j ACCEPT
      '';
    };
  };

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  console.keyMap = "de";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users."mimi" = {
    isNormalUser = true;
    description = "mimi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kitty
      vscode
    ];
    shell = pkgs.fish;
  };

  home-manager.users."mimi" = {
    programs.home-manager.enable = true;

    home = {
      username = "mimi";
      homeDirectory = "/home/mimi";
      stateVersion = "26.05";
    };

    programs.fish.shellAliases = {
      nsw = "sudo nixos-rebuild switch --flake '.#bunnystation'"; 
    };

    imports = map (x: ../../modules + x) [
      /home
    ]; 
  };

  programs = {
    fish.enable = true;
    firefox.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  nix = {
    settings.experimental-features = [
       "nix-command"
       "flakes"
    ];
    
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
      persistent = true;
    };

    optimise.automatic = true;
  };

  system.stateVersion = "26.05";
}

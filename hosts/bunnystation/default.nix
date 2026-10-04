{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
  ];

  fileSystems = {
    "/mnt/games" = {
      device = "/dev/disk/by-uuid/30EA92A7EA9268BC";
      fsType = "ntfs";
      options = [ "nofail" ];
    };

    "/mnt/misc" = {
      device = "/dev/disk/by-uuid/C8947D83947D7532";
      fsType = "ntfs";
      options = [ "nofail" ];
    };
    "/mnt/games2" = {
      device = "/dev/disk/by-uuid/BC3257063256C4D4";
      fsType = "ntfs";
      options = [ "nofail" ];
    };
  };

  services.gvfs.enable = true;

  # make nvidia stuff work
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # networking
  networking = {
    hostName = "bunnystation";
    networkmanager.enable = true;

    firewall = {
      enable = true;

      allowedTCPPorts = [ 8883 ];
      allowedUDPPorts = [
        1990
        2021
      ];

      extraCommands = ''
        iptables -I INPUT -m pkttype --pkt-type multicast -j ACCEPT
      '';
    };
  };

  # locale stuff
  time.timeZone = "Europe/Berlin";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "de";
      variant = "";
    };
  };
  console.keyMap = "de";

  services.udev = {
    packages = with pkgs; [
      qmk
      qmk-udev-rules
      qmk_hid
      via
      vial
    ];
  };
  hardware.keyboard.qmk.enable = true;

  # audio and bluetooth
  hardware.bluetooth.enable = true;

  services = {
    printing.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  security.rtkit.enable = true;

  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };

  # here i spawn myself
  users.users."mimi" = {
    isNormalUser = true;
    description = "mimi";
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
    ];
    packages = with pkgs; [
      kitty
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
      /home/bunnystation
    ];
  };

  programs = {
    fish.enable = true;
    firefox.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    qmk
    qmk-udev-rules
    qmk_hid
    via
    vial
    dos2unix
    vim
    git
  ];

  # making sure my ssd doesnt explode
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

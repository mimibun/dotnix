{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  services.fwupd.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      START_CHARGE_THRESH_BAT0 = 40; 
      STOP_CHARGE_THRESH_BAT0 = 80; 

    };
  };

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend-then-hibernate";
  };
  
  # CHECK SWAP FOR SUSPEND/HIBERNATION THINGY OWO

  systemd.sleep.settings.Sleep = {
    AllowSuspendThenHibernate = "yes";
    HibernateDelaySec = "240min";
  };

  security.pam.services.hyprlock = {};

  nixpkgs.overlays = [
    (final: prev: {
      fwupd = prev.fwupd.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [
            (final.fetchpatch {
              name = "fwupd-jcat-limit-fix.patch";
              url = "https://github.com/fwupd/fwupd/pull/10479.patch";
              hash = "sha256-wthjHm3yjevkOCAqCgZNpyybbI3TZ+07knOdRbUQV7g=";
            })
          ];
      });
    })
  ];

  networking = {
    hostName = "bunnypad";
    networkmanager = {
      enable = true;
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

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    }; 
    autoLogin = {
      enable = false;
      user = "mimi";
    };
  };
      
  programs.hyprland = {
    enable = true;
    xwayland.enable = true; 
  };

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
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

  home-manager.users."mimi" = {
    home = {
      username = "mimi";
      homeDirectory = "/home/mimi";
      stateVersion = "26.05";
    };

    programs.home-manager.enable = true;

    programs.fish.shellAliases = {
      nsw = "sudo nixos-rebuild switch --flake '.#bunnypad'"; 
    };

    imports = map (x: ../../modules + x) [
      /home
    ]; 
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    wireguard-tools
  ];

  documentation = {
    enable = true;
    man.enable = true;
    dev.enable = true;
  };

  nix = {
    settings.experimental-features = [
       "nix-command"
       "flakes"
    ];
    
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than-30d";
      persistent = true;
    };

    optimise.automatic = true;
  };
  
  system.stateVersion = "26.05"; 
}

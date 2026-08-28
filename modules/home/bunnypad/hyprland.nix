{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      #---monitors---
      monitor=eDP-1, highres@60, 0x0, 1
      monitor=HDMI-A-2, 2560x1440@60, 0x0, 1, mirror, eDP-1

      #---workspaces---
      workspace=1,monitor:eDP-1
      workspace=2,monitor:eDP-1
      workspace=3,monitor:eDP-1
      workspace=4,monitor:eDP-1
      workspace=5,monitor:eDP-1
      workspace=6,monitor:eDP-1
      workspace=7,monitor:eDP-1
      workspace=8,monitor:eDP-1
      workspace=9,monitor:eDP-1
      workspace=10,monitor:eDP-1
    '';
  };
}

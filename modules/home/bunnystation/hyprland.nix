{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      #---monitors---
      monitor=DP-1, highres@274, 0x0, 1
      monitor=DP-2, highres@169, auto-right, 1
      #monitor=HDMI-A-2, 2560x1440@60, 0x0, 1, mirror, eDP-1

      #---workspaces---
      workspace=1,monitor:DP-1
      workspace=2,monitor:DP-2
      workspace=3,monitor:DP-2
      workspace=4,monitor:DP-2
      workspace=5,monitor:DP-2
      workspace=6,monitor:DP-2
      workspace=7,monitor:DP-2
      workspace=8,monitor:DP-2
      workspace=9,monitor:DP-2
      workspace=10,monitor:DP-2
    '';
  };
}

{
  config,
  inputs,
  lib,
  ...
}:
{
  programs.noctalia = {
    enable = true;
    settings = {
      bar.default.end = [ "cpu" "ram" "network" "bluetooth" "volume" "brightness" "battery" "notifications" "tray" ];
    };
  };
}
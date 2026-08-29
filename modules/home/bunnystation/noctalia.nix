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
      bar.default.end = [ "cpu" "ram" "bluetooth" "volume" "notifications" "tray" ];
    };
  };
}
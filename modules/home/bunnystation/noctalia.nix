{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    settings = {
      bar.default.end = [ "cpu" "ram" "bluetooth" "volume" "notifications" "tray" ];
    };
  };
}
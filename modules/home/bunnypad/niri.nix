{ ... }:
{
  programs.niri = {
    settings = {
      outputs = {
        "eDP-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.0;
          };
          position.x = 0;
          position.y = 0;
          scale = 1;
          focus-at-startup = true;
        };
      };
    };
  };
}

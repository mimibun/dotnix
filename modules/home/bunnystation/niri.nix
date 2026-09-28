{ ... }:
{
  programs.niri = {
    settings = {
      outputs = {
        # main monitor
        "DP-1" = {
          mode = {
            width = 2560;
            height = 1440;
            # refresh = 60.0;
          };
          variable-refresh-rate = true;
          position.x = 0;
          position.y = 0;
          scale = 1;
          focus-at-startup = true;
        };
        # second screen
        "DP-2" = {
          mode = {
            width = 2560;
            height = 1440;
            # refresh = 60.0;
          };
          variable-refresh-rate = true;
          position.x = 2560;
          position.y = 0;
          scale = 1;
          focus-at-startup = true;
        };
      };
    };
  };
}

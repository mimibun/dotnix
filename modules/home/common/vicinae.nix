{ pkgs, ... }:
{
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true; 
      autoStart = true;
    };

    settings = {
      
    };

    themes = {
      mimi-cotton-candy = {
        meta = {
          name = "mimi's theme :3";
          description = "a pastel-y cotton candy kinda theme";
          variant = "dark";
          inherits = "catppuccin-macchiato";
          icon = "icons/theme-name.png";
        };
        colors = {
          core = {
            accent = "#cba6f7";
            background = "#5c5179";
          };
          main_window = {
            border = "#cba6f7";
          };
        };
      };
    };
  };
}
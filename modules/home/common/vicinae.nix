{ pkgs, ... }:
{
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true; 
      autoStart = true;
    };

    # settings = {
    #   search_files_in_root = false;
    #   escape_key_behavior = "close_window";
    #   pop_to_root_on_close = true;
    #   keybinding = "vim";
    #   font = {
    #     normal.family = "SF Pro Text";
    #   };
    #   launcher_window = {
    #     opacity = 0.5;
    #     material = "blur";
    #     rounding = 15;
    #   };
    # };

    themes = {
      mimi-cotton-candy = {
        meta = {
          version = 1;  
          name = "mimis theme :3";
          description = "a pastel-y cotton candy kinda theme";
          variant = "dark";
          inherits = "catppuccin-macchiato";
          icon = "icons/theme-name.png";
        };
        colors = {
          core = {
            background = "#5c5179";
            secondary_background = "#454060";
          };
          main_window = {
            border = "#cba6f7";
          };
        };
      };
    };
  };
}
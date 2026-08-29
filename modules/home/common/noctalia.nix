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
      accessibility = {
        ui_scale = 1.15;
      };
      bar = {
        density = "default";
        marginHorizontal = 0.1;
        marginVertical = 0.15;
        position = "top";
        default = {
          background_opacity = 0.67;
          capsule_opacity = 0.5;
          capsule_padding = 14.0;
          capsule_thickness = 1.0;
          concave_edge_corners = true;
          font_family = "SF Pro Text";
          font_weight = 600;
          margin_edge = 0;
          margin_ends = 0;
          radius = 0;
          radius_bottom_left = 18;
          radius_bottom_right = 18;
          shadow = false;
          start = [ "workspaces" ];
          thickness = 38;
          widget_spacing = 20;
        };
      };
      battery = {
        warning_threshold = 15;
      };
      control_center = {
        hidden_tabs = [ "media" "weather" "notifications" "screen-time" ];
        calendar = {
          show_week_numbers = true;
        };
      };
      desktop_widgets = {
        enabled = false;
      };
      keybinds = {
        cancel = [ "Escape" ];
      };
      location = {
        auto_locate = true;
      };
      lockscreen = {
        blur_intensity = 0.67;
        blurred_desktop = true;
        fingerprint = false;
        tint_intensity = 0.0;
      };
      notification = {
        background_opacity = 0.5;
        border = false;
        show_actions = false;
      };
      osd = {
        background_opacity = 0.5;
        border = false;
        kinds = {
          media = false;
        };
      };
      shell = {
        button_borders = false;
        card_borders = false;
        clipboard_enabled = false;
        font_family = "SF Pro Rounded";
        input_borders = false;
        polkit_agent = true;
        popup_borders = false;
        settings_window_translucent = true;
        telemetry_enabled = true;
        greeter_sync = {
          auto_sync = true;
        };
        panel = {
          borders = false;
          open_near_click_control_center = true;
          shadow = false;
          transparency_mode = "soft";
        };
        screen_corners = {
          enabled = true;
        };
      };
      theme = {
        builtin = "Catppuccin";
        community_palette = "Catppuccin Lavender";
        source = "community";
        templates = {
          enable_builtin_templates = false;
          enable_community_templates = false;
        };
      };
      wallpaper = {
        directory = "/home/mimi/Pictures";
        default = {
          path = "/home/mimi/Pictures/2026-07-07 01-16-42.jpg";
        };
        last = {
          path = "/home/mimi/Pictures/2026-07-07 01-16-42.jpg";
        };
      };
      widget = {
        battery = {
          display_mode = "graphic";
        };
        clipboard = {
          enabled = false;
        };
        clock = {
          enabled = true;
        };
        control-center = {
          enabled = false;
        };
        cpu = {
          visualization = "none";
        };
        date = {
          enabled = true;
          format = "{:%A,%e %B %Y}";
        };
        media = {
          hide_album_art = true;
          hide_when_no_media = true;
          max_length = 190;
          min_length = 51;
          title_scroll = "always";
        };
        ram = {
          visualization = "none";
        };
        session = {
          enabled = true;
        };
        workspaces = {
          empty_color = "outline";
          enabled = true;
          show_labels = false;
        };
      };
    };
  };
}
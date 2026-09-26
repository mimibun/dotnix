{ config, ... }:
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

      # input stuff
      input = {
        keyboard = {
          xkb = {
            layout = "de";
            options = "ctrl:nocaps";
          };

          repeat-delay = 200;
          repeat-rate = 50;
        };

        focus-follows-mouse.enable = true;

        touchpad = {
          enable = true;
          accel-speed = 0.5;
          accel-profile = "flat";
        };

        # todo : mouse config stuff
      };

      recent-windows = {
        highlight = {
          active-color = "#00ff00ff";
          urgent-color = "#ff0000ff";
          padding = 12;
          corner-radius = 16;
        };
        previews = {
          max-scale = 0.3;
        };
      };

      prefer-no-csd = true;

      layout = {
        empty-workspace-above-first = true;

        struts = {
          top = -4;
          bottom = -4;
          left = -4;
          right = -4;
        };
        preset-column-widths = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
          { proportion = 1. / 1.; }
        ];
      };

      window-rules = [
        {
          geometry-corner-radius = {
            bottom-left = 16.0;
            bottom-right = 16.0;
            top-left = 16.0;
            top-right = 16.0;
          };
          clip-to-geometry = true;
          background-effect = {
            blur = true;
            xray = false;
          };
          popups.background-effect = {
            blur = true;
            xray = false;
          };
          focus-ring = {
            enable = true;
          };
        }
      ];

      layer-rules = [
        {
          background-effect.xray = false;
        }
        {
          matches = [ { namespace = "^noctalia-backdrop"; } ];
          place-within-backdrop = true;
        }
        {
          matches = [ { namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$"; } ];
          background-effect = {
            xray = false;
          };
        }
      ];

      blur = {
        enable = true;
        passes = 4;
        offset = 0.5;
        saturation = 1.0;
      };

      # binds
      binds = with config.lib.niri.actions; {
        "Mod+Q" = {
          action.spawn = "kitty";
        };
        "Mod+Space".action.spawn = [
          "vicinae"
          "toggle"
        ];
        "Mod+Tab" = {
          repeat = false;
          action = toggle-overview;
        };
        "Mod+C" = {
          repeat = false;
          action = close-window;
        };
        "Mod+Shift+F1" = {
          repeat = false;
          action = show-hotkey-overlay;
        };

        # focusing
        "Mod+H" = {
          action = focus-column-left;
        };
        "Mod+J" = {
          action = focus-window-or-workspace-down;
        };
        "Mod+K" = {
          action = focus-window-or-workspace-up;
        };
        "Mod+L" = {
          action = focus-column-right;
        };

        # moving
        "Mod+Shift+H" = {
          action = move-column-left;
        };
        "Mod+Shift+J" = {
          action = move-window-to-workspace-down;
        };
        "Mod+Shift+K" = {
          action = move-window-to-workspace-up;
        };
        "Mod+Shift+L" = {
          action = move-column-right;
        };

        # resizing
        "Mod+R" = {
          action = switch-preset-column-width;
        };
        "Mod+Ctrl+R" = {
          action = switch-preset-column-width-back;
        };

        "Mod+W".action = toggle-column-tabbed-display;

        # lock session
        "Alt+Shift+L".action.spawn = [
          "noctalia"
          "msg"
          "session"
          "lock"
        ];

        # screenshot
        "Print".action.screenshot = [ ];

        # media keys
        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "volume-up"
          ];
        };
        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "volume-down"
          ];
        };
        "XF86AudioMute" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "volume-mute"
          ];
        };
        "XF86AudioPlay" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "media"
            "toggle"
          ];
        };
        "XF86AudioNext" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "media"
            "next"
          ];
        };
        "XF86AudioPrev" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "media"
            "previous"
          ];
        };
        "XF86MonBrightnessUp" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "brightness-up"
          ];
        };
        "XF86MonBrightnessDown" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "brightness-down"
          ];
        };
      };
    };
  };
}

{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    systemd.enable = true;
    settings = {
      decoration = {
        "$mainMod" = "SUPER";
        #"$terminal" = "kitty";
        #"$fileManager" = "nautilus";
        "$menu" = "rofi";

        bind = [
          "$mainMod, Q, exec, kitty"
          "bind = $mainMod, left, movefocus, l"
          "bind = $mainMod, right, movefocus, r"
          "bind = $mainMod, up, movefocus, u"
          "bind = $mainMod, down, movefocus, d"
          "bind = $mainMod,f,fullscreen "

          "bind = $mainMod SHIFT, left, movewindow, l"
          "bind = $mainMod SHIFT, right, movewindow, r"
          "bind = $mainMod SHIFT, up, movewindow, u"
          "bind = $mainMod SHIFT, down, movewindow, d"

          "bind = $mainMod, 1, workspace, 1"
          "bind = $mainMod, 2, workspace, 2"
          "bind = $mainMod, 3, workspace, 3"
          "bind = $mainMod, 4, workspace, 4"
          "bind = $mainMod, 5, workspace, 5"
          "bind = $mainMod, 6, workspace, 6"
          "bind = $mainMod, 7, workspace, 7"
          "bind = $mainMod, 8, workspace, 8"
          "bind = $mainMod, 9, workspace, 9"
          "bind = $mainMod, 0, workspace, 10"
          "bind = $mainMod,Page_Up,workspace,e-1"
          "bind = $mainMod,Page_Down,workspace,e+1"

          "bind = $mainMod SHIFT, 1, movetoworkspace, 1"
          "bind = $mainMod SHIFT, 2, movetoworkspace, 2"
          "bind = $mainMod SHIFT, 3, movetoworkspace, 3"
          "bind = $mainMod SHIFT, 4, movetoworkspace, 4"
          "bind = $mainMod SHIFT, 5, movetoworkspace, 5"
          "bind = $mainMod SHIFT, 6, movetoworkspace, 6"
          "bind = $mainMod SHIFT, 7, movetoworkspace, 7"
          "bind = $mainMod SHIFT, 8, movetoworkspace, 8"
          "bind = $mainMod SHIFT, 9, movetoworkspace, 9"
          "bind = $mainMod SHIFT, 0, movetoworkspace, 10"

          "bind = $mainMod, Q, exec, $terminal"
          "bind = $mainMod, C, killactive,"
          #"bind = $mainMod, E, exec, $fileManager"
          "bind = $mainMod, V, togglefloating, "
          "bind = $mainMod, space, exec, $menu -show combi $focusRofi # rofi/app launcher"
          "bind = $mainMod, O,exec, noctalia msg screenshot-region"
          #"bind = $mainMod, P,exec,pavucontrol"
          "bind = $mainMod, L, exec, noctalia msg session lock"

          "bind = $mainMod, S, togglespecialworkspace, magic"
        ];

        # Startup Apps
        exec-once = [
          "noctalia"
        ];

        bindm = [
          # mouse movements
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
          "$mainMod ALT, mouse:272, resizewindow"
        ];
      };
    };

    extraConfig = ''
      # l -> do stuff even when locked
      # e -> repeats when key is held 

      #--media-keys---
      bindel = , XF86AudioRaiseVolume, exec, noctalia msg volume-up
      bindel = , XF86AudioLowerVolume, exec, noctalia msg volume-down
      bindl = , XF86AudioMute, exec, noctalia msg volume-mute
      bindl = , XF86AudioPlay, exec, playerctl play-pause
      bindl = , XF86AudioPrev, exec, playerctl previous
      bindl = , XF86AudioNext, exec, playerctl next
      binde = , XF86MonBrightnessDown, exec, noctalia msg brightness-down
      binde = , XF86MonBrightnessUp, exec, noctalia msg brightness-up
      bindl=,switch:Lid Switch, exec, brightnessctl -d "tpacpi::kbd_backlight" set "2"; noctalia msg session lock


      $mainMod = SUPER

      # Se but waiting for rofi to open then trigger focus
      $focusRofi = & while [ "$(hyprctl clients | grep "class: Rofi")x" == "x" ]; do continue; done; hyprctl dispatch focuswindow "^(Rofi)"

      $rosewater = rgb(f4dbd6)
      $rosewaterAlpha = f4dbd6

      $flamingo = rgb(f0c6c6)
      $flamingoAlpha = f0c6c6

      $pink = rgb(f5bde6)
      $pinkAlpha = f5bde6

      $mauve = rgb(c6a0f6)
      $mauveAlpha = c6a0f6

      $red = rgb(ed8796)
      $redAlpha = ed8796

      $maroon = rgb(ee99a0)
      $maroonAlpha = ee99a0

      $peach = rgb(f5a97f)
      $peachAlpha = f5a97f

      $yellow = rgb(eed49f)
      $yellowAlpha = eed49f

      $green = rgb(a6da95)
      $greenAlpha = a6da95

      $teal = rgb(8bd5ca)
      $tealAlpha = 8bd5ca

      $sky = rgb(91d7e3)
      $skyAlpha = 91d7e3

      $sapphire = rgb(7dc4e4)
      $sapphireAlpha = 7dc4e4

      $blue = rgb(8aadf4)
      $blueAlpha = 8aadf4

      $lavender = rgb(b7bdf8)
      $lavenderAlpha = b7bdf8

      $text = rgb(cad3f5)
      $textAlpha = cad3f5

      $subtext1 = rgb(b8c0e0)
      $subtext1Alpha = b8c0e0

      $subtext0 = rgb(a5adcb)
      $subtext0Alpha = a5adcb

      $overlay2 = rgb(939ab7)
      $overlay2Alpha = 939ab7

      $overlay1 = rgb(8087a2)
      $overlay1Alpha = 8087a2

      $overlay0 = rgb(6e738d)
      $overlay0Alpha = 6e738d

      $surface2 = rgb(5b6078)
      $surface2Alpha = 5b6078

      $surface1 = rgb(494d64)
      $surface1Alpha = 494d64

      $surface0 = rgb(363a4f)
      $surface0Alpha = 363a4f

      $base = rgb(24273a)
      $baseAlpha = 24273a

      $mantle = rgb(1e2030)
      $mantleAlpha = 1e2030

      $crust = rgb(181926)
      $crustAlpha = 181926

      #---monitors---
      #monitor=eDP-2, highres@169, auto-right, 1
      #monitor=eDP-2, highres@169, 2048x-700, 1.25, transform, 1
      #monitor=eDP-1, highres@274, 0x0, 1
      monitor=DP-1, highres@274, 0x0, 1
      monitor=DP-2, highres@169, auto-right, 1
      #monitor=HDMI-A-2, 2560x1440@60, 0x0, 1, mirror, eDP-1
      #monitor=DP-1, highres@60, 1920x0, 1, transform, 0

      #---workspaces---
      workspace=1,monitor:eDP-1
      workspace=2,monitor:eDP-1
      workspace=3,monitor:eDP-1
      workspace=4,monitor:eDP-1
      workspace=5,monitor:eDP-1
      workspace=6,monitor:eDP-1
      workspace=7,monitor:eDP-1
      workspace=8,monitor:eDP-1
      workspace=9,monitor:eDP-1
      workspace=10,monitor:eDP-1

      windowrule {
          name = music
          match:class = ^(Spotify)$
          workspace = special:magic
      }

      layerrule = blur on, match:namespace swaync-control-center
      layerrule = blur on, match:namespace swaync-notification-window
      layerrule = ignore_alpha 0.1, match:namespace swaync-control-center
      layerrule = ignore_alpha 0.1, match:namespace swaync-notification-window
      layerrule = ignore_alpha 0.4, match:namespace swaync-control-center
      layerrule = ignore_alpha 0.4, match:namespace swaync-notification-window  

      layerrule = no_anim on, match:namespace hyprpicker
      layerrule = no_anim on, match:namespace selection
      layerrule = no_anim on, match:namespace ^(rofi)$


      #---settings---
      general {
          gaps_in = 3
          gaps_out = 5
          border_size = 2
          col.active_border = rgba($pinkAlpha78)
          col.inactive_border = rgba($surface0Alpha7B)

          resize_on_border = true

          layout = dwindle

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false
      }

      decoration {
          rounding = 15
          
          blur {
              enabled = true
              size = 1
              passes = 4
              popups = true
              layerrule = blur on, match:namespace waybar
              layerrule = blur on, match:namespace rofi
              layerrule = blur on, match:namespace vicinae
          }
 
          shadow {
              enabled = false
              range = 14
              render_power = 3
              color = rgba(1a1a1aaa)
          }
      }

      input {
          kb_layout = de
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          repeat_delay = 200
          repeat_rate = 50

          follow_mouse = 1

          touchpad {
              natural_scroll = yes
          }

        accel_profile = flat
          sensitivity = 0.5 # -1.0 to 1.0, 0 means no modification.
      }

      animations {
          enabled = yes

          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
          bezier = better, 0, -0.01, 1, 1

          animation = windows, 1, 1, default
          animation = windowsOut, 1, 7, default, slide
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 0, 2, default
          animation = specialWorkspace, 1, 3, default, slidefade top 100% 
          animation = fade, 0
      }
    '';
  };
}

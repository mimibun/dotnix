{ ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Macchiato";
    shellIntegration.enableFishIntegration = true;
    keybindings = {
      "kitty_mod+h" = "previous_tab";
      "kitty_mod+j" = "next_window";
      "kitty_mod+k" = "previous_window";
      "kitty_mod+l" = "next_tab";
      "kitty_mod+p" = "next_layout";
    };
    extraConfig = ''
      # BEGIN_KITTY_FONTS
      font_family      family='Maple Mono NF' style=Bold features=+calt
      bold_font        family='Maple Mono NF' style=ExtraBold features=+calt
      italic_font      family='Maple Mono NF' style='ExtraBold Italic' features=+calt
      bold_italic_font auto
      font_size 11.5
      # END_KITTY_FONTS

      window_padding_width 7
      hide_window_decorations no
<<<<<<< HEAD
      background_opacity 0.75
=======
      background_opacity 0.6
>>>>>>> d00649d (feat: change kitty bg opacity)
      cursor_shape beam
      cursor_beam_thickness 2
      cursor_trail 1
      cursor_trail_decay 0.1 0.4

      tab_bar_style powerline
      tab_powerline_style round

      background              #3a3154
    '';
  };
}

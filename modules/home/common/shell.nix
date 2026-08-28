{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      f = "z";
      ff = "zi";
      l = "lsd --tree --depth '1' --group-directories-first";
      ls = "lsd -la";
    };
    interactiveShellInit = ''
      set fish_greeting
      starship init fish | source
    '';
  };
}
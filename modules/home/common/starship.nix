{ lib, pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      command_timeout = 1000;
      palette = "catppuccin_macchiato";
      format = "$username$hostname$directory$git_branch$git_status $fill $c$dart$elixir$elm$golang$haskell$java$nodejs$php$rust$cmd_duration$time$line_break$character";
      username = {
        show_always = true;
        style_user = "bold pink";
        style_root = "red";
        format = "[🐇 $user]($style) ";
        disabled = false;
      };
      hostname = {
        ssh_only = true;
        format = "[$ssh_symbol](bold blue) [on](subtext0) [$hostname](lavender) ";
        disabled = false;
      };
      fill = {
        symbol = ".";
      };
      c = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      character = {
        error_symbol = "[❯](fg:red)";
        success_symbol = "❯";
      };
      line_break = {
        disabled = false;
      };
      cmd_duration = {
        format = "[ $duration](fg:yellow)";
      };
      dart = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      directory = {
        read_only = " ";
        format = "[$path]($style)[$read_only]($read_only_style)";
        style = "blue";
        truncation_length = 3;
        truncate_to_repo = true;
        truncation_symbol = "…/";
        repo_root_style = "green";
        repo_root_format = "[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($repo_root_style)[$read_only]($read_only_style) - ";
        substitutions = {
          
        };
      };
      time = {
        disabled = false;
        format = "[ $time]($style)";
        time_format = "%R";
        utc_time_offset = "local";
        style = "dimmed white";
      };
      elixir = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      elm = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      git_branch = {
        format = "[$symbol $branch](fg:purple)";
        symbol = "";
      };
      git_status = {
        format = "[$all_status$ahead_behind](fg:bold red)";
      };
      golang = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      haskell = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      java = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      nodejs = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      package = {
        format = "[$symbol ($version)](fg:red) ";
        symbol = "";
      };
      php = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "";
      };
      rust = {
        format = "[$symbol ($version)](fg:green) ";
        symbol = "🦀";
      };
      python = {
        format = "[$symbol ($venv)](fg:green) ";
        symbol = "🐍";
        pyenv_version_name = true;
      };
      palettes = {
        catppuccin_macchiato = {
          rosewater = "#f4dbd6";
          flamingo = "#f0c6c6";
          pink = "#f5bde6";
          mauve = "#c6a0f6";
          red = "#ed8796";
          maroon = "#ee99a0";
          peach = "#f5a97f";
          yellow = "#eed49f";
          green = "#a6da95";
          teal = "#8bd5ca";
          sky = "#91d7e3";
          sapphire = "#7dc4e4";
          blue = "#8aadf4";
          lavender = "#b7bdf8";
          text = "#cad3f5";
          subtext1 = "#b8c0e0";
          subtext0 = "#a5adcb";
          overlay2 = "#939ab7";
          overlay1 = "#8087a2";
          overlay0 = "#6e738d";
          surface2 = "#5b6078";
          surface1 = "#494d64";
          surface0 = "#363a4f";
          base = "#24273a";
          mantle = "#1e2030";
          crust = "#181926";
        };
      };
    };
  };
}
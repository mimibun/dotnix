{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    
    profiles.default.extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      vscodevim.vim
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons#
      bbenoist.nix
    ];
  };
}
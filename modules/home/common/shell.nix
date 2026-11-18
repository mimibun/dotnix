{ ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      f = "z";
      ff = "zi";
      l = "lsd --tree --depth '1' --group-directories-first";
      ls = "lsd -la";
      sk = "ssh-keygen -K";
    };
    interactiveShellInit = ''
      set fish_greeting
      starship init fish | source
    '';
    functions = {
      ns = {
        description = "nix shell shortcut";
        body = # fish
          ''
            if test (count $argv) -eq 0
                echo "Error: Please provide at least one package name"
                return 1
            end

            set nix_shell_cmd "nix shell"

            for pkg in $argv
                set nix_shell_cmd "$nix_shell_cmd nixpkgs#$pkg"
            end

            eval $nix_shell_cmd
          '';
      };
    };
  };
}

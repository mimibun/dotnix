{ pkgs, lib, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user.name = "mimi";
      user.email = "mimi@bnuuy.garden";

      init.defaultBranch = "main";

      pull.rebase = true;
      push.default = "current";
    };
  }
}
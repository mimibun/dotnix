{ ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    ignores = [
      ".DS_Store"
      ".direnv"
      ".claude"
    ];

    settings = {
      user.name = "mimi";
      user.email = "mimi@bnuuy.garden";

      init.defaultBranch = "main";

      pull.rebase = true;
      push.default = "current";
      push.autoSetupRemote = true;
    };
  };
}

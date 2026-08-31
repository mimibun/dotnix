{ pkgs, ...}:

{
  wayland.windowManager.mango= {
    enable = true;
    settings = {
      # animations = 0;
      bordercolor="0x595959aa";
      bind = [
        "SUPER,r,reload_config"
        "SUPER,space,spawn,vicinae toggle"
        "SUPER,Q,spawn,kitty"
      ];
    };
  };
}
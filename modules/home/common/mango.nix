{ config, pkgs, inputs, ...}:
{
  imports = [
    inputs.mango.hmModules.mango
  ];

  wayland.windowManager.mango= {
    enable = true;
    settings = {
      # animations = 0;
      bordercolor="0x595959aa";
      xkb_rules_layout = "de"; 
      bind = [
        "SUPER,r,reload_config"
        "SUPER,space,spawn,vicinae toggle"
        "SUPER,Q,spawn,kitty"
      	"SUPER,C,killclient"

        "SUPER,h,focusdir,left"
        "SUPER,j,focusdir,down"
        "SUPER,k,focusdir,up"
        "SUPER,l,focusdir,right"
      ];

      blur = 1;
      blur_optimized = 1;
      blur_params = {
        radius = 1;
        num_passes = 2;
      };

      border_radius = 15;
      focused_opacity = 1.0;

      extraConfig = ''
        exec-once=vicinae server
        noctalia 
      '';
    };

  };
}

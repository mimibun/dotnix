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
      ];
   };
  };
}

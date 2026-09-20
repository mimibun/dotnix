{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.mango.hmModules.mango
  ];

  wayland.windowManager.mango = {
    enable = true;
    settings = {
      # animations = 0;
      bordercolor = "0x595959aa";
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

        "SUPER,s,toggle_special_tag"
      ];

      blur = 1;
      blur_optimized = 1;
      blur_params = {
        radius = 1;
        num_passes = 2;
      };

      border_radius = 15;
      focused_opacity = 1.0;

      default_mfact = 0.55;
      center_master_overspread = 0;

      tagrule = [
        "id:0,layout_name:deck"

        "id:1,layout_name:tile"
        "id:2,layout_name:tile"
        "id:3,layout_name:tile"
        "id:4,layout_name:tile"
        "id:5,layout_name:tile"
        "id:6,layout_name:tile"
      ];

      windowrule = [
        "tags:0,appid:spotify"
      ];

      extraConfig = ''
        exec-once=vicinae server
        noctalia 
      '';
    };

  };
}

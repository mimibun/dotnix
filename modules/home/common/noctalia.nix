{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    # settings = {
# 
#      capsules
      # bar.backgroundOpacity = lib.mkForce 0.0;
      # bar.useSeparateOpacity = true;
      # bar.showCapsule = true;
      # ui.panelsAttachedToBar = true;
      # general.enableShadows = true;
# 
      # general = {
        # animationSpeed = 1.0;
      # };
# 
      # bar = {
        # background_opacity = 0.67;
        # concave_edge_corners = true;
        # font_family = "SF Pro Text";
        # font_weight = 600;
        # margin_edge = 0;
        # margin_ends = 0;
        # widget_spacing = 20;
        # thickness = 38;
# 
        # density = "default";
        # position = "top";
# 
        # widgets = {
          # start = [ "workspaces" ];
          # center = [ "clock" ];
          # end = [ 
            #  "cpu"
            #  "ram"
            #  "network"
            #  "volume"
            #  "brightness"
            #  "battery"
            #  "notifications"
            #  "tray"
          # ];
        # };
      # };
    # };
  };
}
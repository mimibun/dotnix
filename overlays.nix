self: super:
{
  nixpkgs.overlays = [ apple-fonts.overlays.default ];
}
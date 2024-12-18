{ nixvim, ... }:
{
  imports = [
    ./pyprland.nix
    ./eza.nix
    ./hyprland.nix
    ./yazi.nix
    ./zoxide.nix
    ./kitty.nix
    ./spicetify.nix

    ./NixVim
    ./terminal
  ];
}

{ config, pkgs, lib, ... }:

let
  user = "keynold";
  xdg_configHome  = "/home/${user}/.config";
  shared-programs = import ../shared/home-manager.nix { inherit config pkgs lib; };
  shared-files = import ../shared/files.nix { inherit config pkgs; };
in
{
  home = {
    enableNixpkgsReleaseCheck = false;
    username = "${user}";
    homeDirectory = "/home/${user}";
    packages = pkgs.callPackage ./packages.nix {};
    file = shared-files // import ./files.nix { inherit user; };
    stateVersion = "21.05";
  };

  # Use a dark theme
  gtk = {
    enable = false;
  };

  # Screen lock
  services = {
    screen-locker = {
      enable = false;
      inactiveInterval = 10;
      lockCmd = "${pkgs.i3lock-fancy-rapid}/bin/i3lock-fancy-rapid 10 15";
    };

    # Auto mount devices
    udiskie.enable = false;

    polybar = {
      enable = false;
    };

    dunst = {
      enable = false;
    };
  };

  programs = shared-programs // {};

}

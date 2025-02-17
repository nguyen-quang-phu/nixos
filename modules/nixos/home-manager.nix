{
  config,
  pkgs,
  ...
}: let
  user = "keynold";
  xdg_configHome = "/home/${user}/.config";
in {
  imports = [
    ../shared/home-manager.nix
  ];
  home = {
    enableNixpkgsReleaseCheck = false;
    username = "${user}";
    homeDirectory = "/home/${user}";
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
}

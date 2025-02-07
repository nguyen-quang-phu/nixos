{pkgs, ...}: let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww daemon &
  '';
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-one = ''
        ${startupScript}/bin/start
      '';
    };
    systemd = {
      enable = true;
    };
  };
}

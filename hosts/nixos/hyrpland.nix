# {pkgs, ...}: {
#   programs = {
#     hyprland = {
#       enable = true;
#       xwayland = {
#         enable = true;
#       };
#     };
#   };
#
#   environment = {
#     sessionVariables = {
#       WLR_NO_HARDWARE_CURSORS = "1";
#       NIXOS_OZONE_WL = "1";
#     };
#     systemPackages = with pkgs; [
#       waybar
#       eww
#       dunst
#       libnotify
#       hyprpaper
#       swaybg
#       wpaperd
#       mpvpaper
#       swww
#       rofi-wayland
#       wofi
#       bemenu
#       fuzzel
#       tofi
#     ];
#   };
#
#   hardware = {
#     opengl = {
#       enable = true;
#     };
#     nvidia.modesetting.enable = true;
#   };
#
#   xdg = {
#     portal = {
#       extraPortals = [pkgs.xdg-desktop-portal-gtk];
#     };
#   };
#
#   security.rtkit.enable = true;
#   services = {
#     pulseaudio.enable = false;
#     pipewire = {
#       enable = true;
#       alsa.enable = true;
#       alsa.support32Bit = true;
#       pulse.enable = true;
#       jack.enable = true;
#     };
#   };
# }

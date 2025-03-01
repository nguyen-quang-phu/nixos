{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Enable the uinput module
  boot.kernelModules = [ "uinput" ];

  # Enable uinput
  hardware.uinput.enable = true;

  # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = { };

  # Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          # Replace the paths below with the appropriate device paths for your setup.
          # Use `ls /dev/input/by-path/` to find your keyboard devices.
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:1:1.2-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:2:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:1:1.2-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:2:1.0-event-kbd"
          "/dev/input/by-id/usb-Genius_Wireless_Device-if02-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          ;; Hold caps activates arrows for keys: h j k l
          (defsrc caps h j k l)
          (defalias caps-mode (tap-hold 200 200 esc
            (layer-while-held arrows)))
          (deflayer base   @caps-mode   h    j    k    l)
          (deflayer arrows _ left down up right)
        '';
      };
    };
  };
}






{
  config,
  inputs,
  system,
  pkgs,
  lib,
  ...
}: let
  user = "keynold";
  bamboo = inputs.ibus-bamboo.packages."${system}".default;
in {
  imports = [
    ../../modules/shared
    ./hardware-configuration.nix
    ./secrects.nix
    ./kanata.nix
    # ./hyrpland.nix
  ];

  environment.variables.EDITOR = "nvim";
  fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  boot = {
    # Bootloader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
  networking = {
    hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
    useDHCP = false;
    wireless.iwd.enable = true;
    networkmanager.wifi.backend = "iwd";
  };

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n = {
    # Select internationalisation properties.
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "vi_VN";
      LC_IDENTIFICATION = "vi_VN";
      LC_MEASUREMENT = "vi_VN";
      LC_MONETARY = "vi_VN";
      LC_NAME = "vi_VN";
      LC_NUMERIC = "vi_VN";
      LC_PAPER = "vi_VN";
      LC_TELEPHONE = "vi_VN";
      LC_TIME = "vi_VN";
    };

    inputMethod = {
      enable = true;
      type = "ibus";
      ibus.engines = [
        bamboo
      ];
    };
  };
  security.rtkit.enable = true;
  users = {
    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    defaultUserShell = pkgs.zsh;
    users.keynold = {
      isNormalUser = true;
      description = "keynold";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
      packages = with pkgs; [
        kate
        #  thunderbird
      ];
      useDefaultShell = true;
      shell = pkgs.zsh;
    };
  };
  programs = {
    # Install firefox.
    firefox.enable = true;
    zsh.enable = true;
    nix-ld.enable = true;
    honkers-railway-launcher.enable = true;
    hyprland.withUWSM  = true;
  };
  environment.shells = with pkgs; [
    zsh
  ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  hardware.graphics.enable = true;
  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      desktopManager = {
        plasma6 = {
          enable = true;
          enableQt5Integration = true;
        };
      };

      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    displayManager = {
      defaultSession = "plasma";
      # Enable the KDE Plasma Desktop Environment.
      sddm.enable = true;
      sddm.wayland.enable = true;
      autoLogin = {
        # Enable automatic login for the user.
        enable = true;
        user = "keynold";
      };
    };

    # List packages installed in system profile. To search, run:
    # $ nix search wget

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    xserver.videoDrivers = ["nvidia"];
    udev.enable = true;

    udev.extraRules = ''
      SUBSYSTEM=="input", KERNEL=="event6", ACTION=="add", RUN+="${pkgs.bash}/bin/bash -c 'echo 1 > /sys/devices/platform/i8042/serio0/input/input0/inhibited'"
      SUBSYSTEM=="input", KERNEL=="event6", ACTION=="remove", RUN+="${pkgs.bash}/bin/bash -c 'echo 0 > /sys/devices/platform/i8042/serio0/input/input0/inhibited'"
      ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
      '' ;
  };
  hardware.nvidia.open = true; # Set to false for proprietary drivers # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}

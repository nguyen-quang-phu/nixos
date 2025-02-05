{
  config,
  pkgs,
  inputs,
  system,
  ...
}: let
  user = "keynold";
  nvim-pacckages = import ../shared/nvim-packages.nix {inherit pkgs;};
in {
  nix = {
    nixPath = ["nixos-config=/home/${user}/.local/share/src/nixos-config:/etc/nixos"];
    settings = {
      allowed-users = ["${user}"];
      trusted-users = ["@admin" "${user}"];
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
      allowInsecure = false;
      allowUnsupportedSystem = true;
    };
  };

  environment.systemPackages = with pkgs;
    [
      (lutris.override {
        extraLibraries = pkgs: [
          # List library dependencies here
        ];
      })
      # support both 32-bit and 64-bit applications
      wineWowPackages.stable

      # support 32-bit only
      wine

      # support 64-bit only
      (wine.override {wineBuild = "wine64";})

      # support 64-bit only
      wine64

      # wine-staging (version with experimental features)
      wineWowPackages.staging

      # winetricks (all versions)
      winetricks

      # native wayland support (unstable)
      wineWowPackages.waylandFull
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      unzip
      gzip
      stow
      just
      gnumake
      nodejs
      devenv
      xclip
      nix-prefetch-scripts
      inputs.agenix.packages."${system}".default
    ]
    ++ nvim-pacckages;
}

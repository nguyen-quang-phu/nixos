{pkgs}:
with pkgs; let
  shared-packages = import ../shared/packages.nix {inherit pkgs;};
in
  shared-packages
  ++ [
    # App and package management
    appimage-run
    gnumake
    cmake
    home-manager

    # Media and design tools
    zathura
    vim
    spotify
    # texlive.combined.scheme-full
  ]

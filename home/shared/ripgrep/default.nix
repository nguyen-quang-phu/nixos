{...}: {
  programs = {
    ripgrep = {
      enable = true;
      arguments = [
        "--no-require-git"
      ];
    };
  };
}

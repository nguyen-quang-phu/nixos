{pkgs, ...}: {
  programs = {
    fd = {
      enable = true;
      ignores = [
        "*.bak"
        ".git/"
        "node_modules/"
        "vendor/"
      ];
    };
  };
}

{pkgs, ...}: {
  programs = {
    eza = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      git = true;
      icons = "auto";
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };
  };
}

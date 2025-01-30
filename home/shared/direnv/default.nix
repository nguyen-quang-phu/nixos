{...}: {
  programs = {
    direnv = {
      enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;

      nix-direnv = {
        enable = true;
      };
      mise = {
        enable = true;
      };
    };
  };
}

{...}: {
  programs = {
    thefuck = {
      enable = true;
      enableInstantMode = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };
  };
}

{pkgs, ...}: {
  programs = {
    freetube = {
      enable = true;
      settings = {
        defaultQuality = "1080";
        baseTheme = "catppuccinMocha";
      };
    };
  };
}

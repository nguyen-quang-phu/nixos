{...}: {
  home.file."home/keynold/.config/spotify-player/theme.toml".text = builtins.readFile (fetchGit {
      url = "https://github.com/catppuccin/spotify-player.git";
    }
    + "/theme.toml");
  programs = {
    spotify-player = {
      enable = true;
      settings = {
        theme = "Catppuccin-mocha";
      };
    };
  };
}

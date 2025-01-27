{...}: {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    clearDefaultKeybinds = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      theme = "catppuccin-mocha";
      macos-titlebar-proxy-icon = "hidden";
      title = "";
      clipboard-trim-trailing-spaces = true;
      copy-on-select = true;
      window-decoration = false;
      fullscreen = true;
      clipboard-read = "allow";
      clipboard-write = "allow";
      shell-integration = "zsh";
    };
  };
}

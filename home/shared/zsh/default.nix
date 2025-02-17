{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    oh-my-zsh.enable = true;
    syntaxHighlighting.enable = true;
    sessionVariables = {
      EDITOR = "nvim";
      PRIVATE_KEY = "~/.ssh/id_ed25519";
    };
    initExtra = "
    ";
    envExtra = "
      export PATH=$PATH:$(go env GOPATH)/bin/
      export GTK_IM_MODULE=ibus
      export XMODIFIERS=@im=ibus
      export QT_IM_MODULE=ibus
      pidof ibus-daemon > /dev/null || ibus-daemon -drx
    ";
  };
}

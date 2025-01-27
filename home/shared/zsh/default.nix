{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    oh-my-zsh.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = "
    ";
    envExtra = "
      export GTK_IM_MODULE=ibus
      export XMODIFIERS=@im=ibus
      export QT_IM_MODULE=ibus
      pidof ibus-daemon > /dev/null || ibus-daemon -drx
    ";
  };
}

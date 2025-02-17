{...}: {
  programs = {
    zathura = {
      enable = true;
      extraConfig = ''
        set synctex true
        set synctex-editor-command "nvim --headless -c \"VimtexInverseSearch %{line} '%{input}'\""
        '';
    };
  };
}

{pkgs, ...}: {
  programs = {
    vscode = {
      enable = true;
      mutableExtensionsDir = false;
      package = pkgs.vscodium;
      profiles = {
        default = {
          enableExtensionUpdateCheck = false;
          enableUpdateCheck = false;
          extensions = with pkgs.vscode-extensions; [
            eamodio.gitlens
            catppuccin.catppuccin-vsc-icons
            catppuccin.catppuccin-vsc
          ];
          userSettings = {
            "files.autoSave" = "onFocusChange";
            "merge-conflict.autoNavigateNextConflict.enabled" = true;
            "git.mergeEditor" = true;
          };
        };
      };
    };
  };
}

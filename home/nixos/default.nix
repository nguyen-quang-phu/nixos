{
  inputs,
  ...
}:
{
  # import sub modules
  imports = [
    ../shared
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  home = {
    # homeDirectory = "/Users/keynold";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.11";
    file = {};

    shellAliases = {
      "..." = "cd ../..";
      "code" = "codium";
      "darwin-build" = "just -f ~/.config/nix-darwin/justfile build";
      "edit-secrets" = "just -f ~/.config/nix-darwin/justfile edit-secrets";
      "darwin-update" = "just -f ~/.config/nix-darwin/justfile update";
      "ze" = "zellij";
      "zed" = "ze a -c default";
      "pbcopy" = "xclip -selection clipboard";
      "pbpaste" = "xclip -selection clipboard -o";
    };
  };
  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  };
}

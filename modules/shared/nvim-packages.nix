{pkgs}:
with pkgs; [
  # c/c++
  gcc
  # nix
  deadnix
  nil
  nixd
  alejandra
  statix
  ripgrep
  # typo
  typos-lsp
  # lua
  luajitPackages.luacheck
  lua-language-server
  codeium
]

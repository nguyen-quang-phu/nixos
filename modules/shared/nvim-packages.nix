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
  # typo
  typos-lsp
  # lua
  luajitPackages.luacheck
  lua-language-server
  codeium
  # json
  nodePackages.vscode-json-languageserver
  # latex
  texliveFull
  texlab
  # all
  ctags-lsp
  # go
  golangci-lint-langserver
  delve
]

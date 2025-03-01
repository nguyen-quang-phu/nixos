{pkgs, ...}:
with pkgs; [
  # c/c++
  gcc
  pandoc
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
  # yaml
  yaml-language-server
  # latex
  texliveFull
  texlab
  # all
  ctags-lsp
  # go
  golangci-lint-langserver
  delve
  marksman
  markdownlint-cli2
  markdown-oxide
  # proto
  protobuf
  buf
  protols
  clang-tools
  # js/ts
  angular-language-server
  vue-language-server
  svelte-language-server
]

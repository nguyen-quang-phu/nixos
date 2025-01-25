{ config, pkgs, lib, ... }:

let name = "keynold";
    user = "keynold";
    email = "nqphu1998@gmail.com"; in
{
  # Shared shell configuration
  zsh = {
    enable = false;
  };

  git = {
    enable = true;
  };

  vim = {
    enable = false;
  };

  alacritty = {
    enable = false;
  };

  ssh = {
    enable = false;
  };

  tmux = {
    enable = false;
    };
}

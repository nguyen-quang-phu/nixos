{...}: let
  useremail = "nqphu1998@gmai.com";
  username = "keynold";
in {
  programs = {
    git = {
      enable = true;
      lfs.enable = true;

      includes = [
        {
          condition = "gitdir:~/.config/";
          contents = {
            user = {
              email = useremail;
              name = username;
            };
          };
        }
        {
          condition = "gitdir:~/Code/";
          contents = {
            user = {
              email = useremail;
              name = username;
            };
          };
        }
      ];

      extraConfig = {
        init.defaultBranch = "master";
        repack.usedeltabaseoffset = "true";
        color.ui = "auto";
        diff.algorithm = "histogram"; # a much better diff
        help.autocorrect = 10; # 1 second warning to a typo'd command
        core.whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
        branch = {
          autosetupmerge = "true";
          sort = "committerdate";
        };
        commit.verbose = true;

        fetch.prune = true;
        pull.ff = "only"; # equivalent to --ff-only
        pull.rebase = true;
        push = {
          default = "current";
          followTags = true;
          autoSetupRemote = true;
        };
        merge = {
          stat = "true";
          conflictstyle = "zdiff3";
          tool = "meld";
        };
        mergetool = {
          meld = {
            path = "/usr/local/bin/meld";
          };
        };

        rebase = {
          autoSquash = true;
          autoStash = true;
        };

        rerere = {
          enabled = true;
          autoupdate = true;
        };
        diff.mnemonicprefix = true;

        # prevent data corruption
        transfer.fsckObjects = true;
        fetch.fsckObjects = true;
        receive.fsckObjects = true;
        url = {
          # "git@github.com:".insteadOf = "https://github.com/";
          # "ssh://git@github.com".pushInsteadOf = "gh:";
          # "git@gitlab.com:".insteadOf = "https://gitlab.com/";
          # "ssh://git@gitlab.com".pushInsteadOf = "gl:";
        };
      };

      # signing = {
      #   key = "xxx";
      #   signByDefault = true;
      # };

      delta = {
        enable = true;
        options = {
          navigate = true;
          side-by-side = true;
          line-numbers = true;
        };
      };

      aliases = {
        email = "config --local user.email";
        name = "config --local user.name";

        br = "rev-parse --abbrev-ref HEAD";
        can = "!git add . && git status && git commit --amend --no-edit";
        cara = "!git commit --amend --reset-author --no-edit";
        colast = "!git checkout -";
        fsck = "fsck --unreachable | grep commit | cut -d' ' -f3 | xargs git log --merges --no-walk --grep=WIP";
        hide = "update-index --skip-worktree";
        pf = "push --force-with-lease";
        rsho = "reset --hard ORIG_HEAD";
        rss = "reset --soft HEAD~1";
        s = "stash -u";
        sp = "stash apply stash@{0}";
        unhide = "update-index --no-skip-worktree";
      };
      ignores = [
        ".DS_Store"
        "Thumbs.db"
        ".devenv"
        ".direnv"
        ".lazy.lua"
        ".envrc"
        "devenv.yaml"
        "devenv.nix"
        "justfile"
        "vendor"
        ".ignore"
        "Gemfile.local"
        "Gemfile.local.lock"
        "bin"
      ];
    };

    git-cliff = {
      enable = true;
    };
  };
}

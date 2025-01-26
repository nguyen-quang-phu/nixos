{...}: {
  programs = {
    lazygit = {
      enable = true;
      settings = {
        os = {
          editPreset = "nvim-remote";
          openLink = "open \"$(echo \"{{link}}\" | sed 's/%2F/\\//g')\"";
        };
        customCommands = [
          {
            key = "c";
            command = "npx better-commits";
            description = "commit with better-commits";
            context = "files";
            loadingText = "opening better-commits tool";
            subprocess = true;
          }
          {
            key = "n";
            command = "npx -p better-commits better-branch";
            description = "new branch with better-branch";
            context = "localBranches";
            loadingText = "opening better-branch tool";
            subprocess = true;
          }
        ];
      };
    };
  };
}

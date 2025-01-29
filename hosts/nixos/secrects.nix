{
  age = {
    identityPaths = ["/home/keynold/.ssh/id_ed25519"];
    secrets = {
      github-nqp = {
        file = ../../secrets/github-nqp.age;
        owner = "keynold";
        mode = "0400";
      };
      gitlab-nqp = {
        file = ../../secrets/gitlab-nqp.age;
        owner = "keynold";
        mode = "0400";
      };
    };
  };
}

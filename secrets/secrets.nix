let
  keynold = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG8S3B+A91OZQ/30IzRZXV4aEV8qsg3qsPWFcDxN/ON0 keynold@nixos";
  users = [keynold];

  system1 = "";
  systems = [system1];
in {
  "github-nqp.age".publicKeys = [keynold];
  "gitlab-nqp.age".publicKeys = [keynold];
}

{ lib, ...}:
{
  nix.settings.experimental-features = "nix-command flakes";

    # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 7d";
  };
}

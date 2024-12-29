{
  description = "Sean's Nix-Darwin System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

   nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

   # Optional: Declarative tap management
   homebrew-core = {
     url = "github:homebrew/homebrew-core";
     flake = false;
   };
   homebrew-cask = {
     url = "github:homebrew/homebrew-cask";
     flake = false;
   };
   homebrew-bundle = {
     url = "github:homebrew/homebrew-bundle";
     flake = false;
   };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages =
        [ 
          pkgs.neovim
          pkgs.tmux
          pkgs.go
          pkgs.lua
          pkgs.pnpm
          pkgs.ripgrep
          pkgs.stow
          pkgs.tree
          pkgs.wget
          pkgs.yazi
          pkgs.zoxide
          pkgs.lazygit
          pkgs.zsh
          pkgs.zsh
          pkgs.oh-my-posh
          pkgs.obsidian
          pkgs.spotify
          pkgs.aerosapce
        ];

      nix.settings.experimental-features = "nix-command flakes";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      nixpkgs.hostPlatform = "x86_64-darwin"; # "aarch64-darwin" for M series chips
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#personal
    darwinConfigurations."personal" = nix-darwin.lib.darwinSystem {
      modules = 
      [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = false;

            # User owning the Homebrew prefix
            user = "sean";

            # Automatically migrate existing Homebrew installations
            autoMigrate = true;
          };
        }
      ];
    };
  };
}

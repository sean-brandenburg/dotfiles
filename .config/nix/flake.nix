{
  description = "Sean's Nix-Darwin System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {
      nix.settings.experimental-features = "nix-command flakes";
      security.pam.enableSudoTouchIdAuth = true;

      nixpkgs = {
        hostPlatform = "x86_64-darwin"; # "aarch64-darwin" for M series chips
        config.allowUnfree = true; # Allow non open source system packages
      };

      environment.systemPackages = [ 
          pkgs.neovim
          pkgs.tmux
          pkgs.pnpm
          pkgs.ripgrep
          pkgs.p7zip
          pkgs.ffmpeg
          pkgs.stow
          pkgs.tree
          pkgs.wget
          pkgs.yazi
          pkgs.zoxide
          pkgs.lazygit
          pkgs.zsh
          pkgs.zsh-vi-mode
          pkgs.oh-my-posh
          pkgs.jq
          pkgs.poppler
          pkgs.fd
          pkgs.fzf
          pkgs.imagemagick
          pkgs.xclip
          pkgs.wl-clipboard
          pkgs.xsel
          pkgs.mongodb-ce
          pkgs.zsh-syntax-highlighting
          pkgs.zsh-completions
          pkgs.zsh-autosuggestions
          pkgs.zsh-fzf-tab

          # Languages
          pkgs.go
          pkgs.gotestsum
          pkgs.lua
          pkgs.python314

          # CLI
          pkgs.codecrafters-cli

          # GUI
          pkgs.obsidian
          pkgs.spotify
          pkgs.aerospace
          pkgs.raycast
          pkgs.appcleaner
          pkgs.vscode
      ];

      homebrew = {
        enable = true;
        brews = [
          "mas"
          "mtools"
        ];
        casks = [
          "ghostty"
          "scroll-reverser"
        ];
        masApps = {
          "todoist" = 585829637;
          "kindle" = 302584613;
          "affnity-photo" = 1616822987;
          "affnity-designer" = 1616831348;
          "affnity-publisher" = 1606941598;
          "paprika" = 1303222628;
          "klack" = 6446206067;
          "toothfairy" = 1191449274;
          "final-cut-pro" = 424389933;
          "logic-pro" = 634148309;
        };
        onActivation = {
          upgrade = true;
          autoUpdate = true;
          cleanup = "zap"; 
        };
      };

      system = {
        configurationRevision = self.rev or self.dirtyRev or null; # Set Git commit hash for darwin-version
        stateVersion = 5; # Check `darwin-rebuild changelog` before changing

        defaults = {
          dock.autohide = true;
          finder.AppleShowAllExtensions = true;
          finder.FXPreferredViewStyle = "clmv";
          screencapture.location = "~/Pictures/screenshots";
        };
      };

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
            enable = true;
            enableRosetta = false; # Apple silicon only
            user = "sean";
            autoMigrate = true; # Automatically migrate existing Homebrew installations
          };
        }
      ];
    };
  };
}

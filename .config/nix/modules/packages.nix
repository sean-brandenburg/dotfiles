{pkgs, ...}: {
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
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
    pkgs.oh-my-posh
    pkgs.jq
    pkgs.poppler
    pkgs.fd
    pkgs.fzf
    pkgs.imagemagick
    pkgs.mongodb-ce
    pkgs.zsh-fzf-tab
    pkgs.codecrafters-cli
    pkgs.pnpm
    pkgs.gawk
    pkgs.claude-code

    # Languages
    pkgs.go
    pkgs.gotestsum
    pkgs.lua
    pkgs.python314
    pkgs.rustup

    # GUI
    pkgs.obsidian
    pkgs.spotify
    pkgs.aerospace
    pkgs.raycast
    pkgs.appcleaner
    pkgs.vscode
    pkgs.arc-browser
  ];
}

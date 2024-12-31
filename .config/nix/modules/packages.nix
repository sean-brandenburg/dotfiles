{pkgs, ...}: {
  nixpkgs = {
    hostPlatform = "x86_64-darwin";
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
    pkgs.codecrafters-cli

    # Languages
    pkgs.go
    pkgs.gotestsum
    pkgs.lua
    pkgs.python314
    pkgs.cargo

    # GUI
    pkgs.obsidian
    pkgs.spotify
    pkgs.aerospace
    pkgs.raycast
    pkgs.appcleaner
    pkgs.vscode
  ];
}

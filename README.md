# My Dotfiles

## Getting Setup

```
sh <(curl -L https://nixos.org/nix/install)
nix-shell -p git --run 'git clone git@github.com/sean-brandenburg/dotfiles.git'

cd dotfiles
stow .
nix run nix-darwin --extra-experimental-features "nix-command flakes"-- switch --flake ~/dotfiles/.config/nix-darwin#personal
```

## Rebuilding After Making Changes

```
darwin-rebuild switch --flake ~/dotfiles/.config/nix#personal
```

## Brew install depedencies (Deprecated)

`brew bundle --file=./Brewfile`

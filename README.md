# My Dotfiles

## Getting Setup

```
sudo xcode-select --install
sh <(curl -L https://nixos.org/nix/install)
nix-shell -p git --run 'git clone https://github.com/sean-brandenburg/dotfiles.git'
cd dotfiles
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/dotfiles/.config/nix#personal
stow .
```

## Rebuilding After Making Changes

```
darwin-rebuild switch --flake ~/dotfiles/.config/nix#personal
```

## Brew install depedencies (Deprecated)

`brew bundle --file=./Brewfile`

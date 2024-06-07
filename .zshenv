. "$HOME/.cargo/env"

export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/dotnet

export DOTNET_ROOT=$HOME/dotnet

# pnpm
export PNPM_HOME="/Users/sean/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# opam configuration (ocaml package mananger)
[[ ! -r /Users/sean/.opam/opam-init/init.zsh ]] || source /Users/sean/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

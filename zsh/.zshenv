# Exports

if [[ $OSTYPE == 'darwin'* ]]; then
  export PATH="$HOME/Library/Python/3.8/bin:$PATH"
  export PATH="$HOME/opt/anaconda3/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# DOTNET
# for ZSH
case "$OSTYPE" in
  darwin*)
    # ...
  ;;
  linux*)
    export DOTNET_ROOT=/snap/dotnet-sdk/current
  ;;
  dragonfly*|freebsd*|netbsd*|openbsd*)
    # ...
  ;;
esac

export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:'~/.local/bin':$PATH
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:'/usr/local/go/bin':$PATH

# diff-so-fancy
export PATH=$PATH:'~/.config/diff-so-fancy/lib':$PATH

# dumb oracle shit
export LD_LIBRARY_PATH=/opt/oracle/instantclient:$LD_LIBRARY_PATH
export OCI_LIB_DIR=/opt/oracle/instantclient/sdk/include:$OCI_LIB_DIR

export NVM_DIR="$HOME/.nvm"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# rbenv
# eval "$(rbenv init -)"

# deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

if [[ $OSTYPE == 'darwin'* ]];
then
  # pnpm
  export PNPM_HOME="/Users/rene8209/Library/pnpm"
  export PATH="$PNPM_HOME:$PATH"
  # pnpm end
else
  # pnpm
  export PNPM_HOME="~/.local/share/pnpm"
  export PATH="$PNPM_HOME:$PATH"
  # pnpm end
fi

. "$HOME/.cargo/env"

# Misc

# setopt prompt_subst
# PS1='%n@%m $(shrink_path -f)>'
local ret_status="%(?:%{$fg_bold[green]%}λ :%{$fg_bold[red]%}λ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

# FZF remaps
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="fd --type f"
export FZF_ALT_C_COMMAND="fd --type f"

[ -f "~/.ghcup/env" ] && source "~/.ghcup/env" # ghcup-env

# Bindings
bindkey -s ^f "tmux-sessionizer\n"

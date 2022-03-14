# Language settings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Enabled true color support for terminals
# export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Enable `ls` colors
export CLICOLOR=1

# Set XDG values
export XDG_CONFIG_HOME="$HOME/.config"

export FZF_DEFAULT_OPTS="--tiebreak end,length,index"

#  n (node manager packages) should install node versions here
export N_PREFIX=$HOME/.n

# Add NPM libraries to PATH
if [ -d "$HOME/.npm/bin" ]; then
    export PATH="$HOME/.npm/bin:$PATH"
fi

# Add N_PREFIX to PATH
export PATH="$N_PREFIX/bin:$PATH"

if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.npm-global/bin" ]; then
  export PATH="$HOME/.npm-global/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

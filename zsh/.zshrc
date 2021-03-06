# Without this, Ctrl+S would freeze the terminal
# https://unix.stackexchange.com/a/12108
stty -ixon

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# turn off all beeps
unsetopt BEEP

if [ ! -d "$HOME/.zplug" ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source $HOME/.zplug/init.zsh

# better and friendly vi(vim) mode plugin for ZSH
zplug "jeffreytse/zsh-vi-mode"

# provides many aliases and a few useful functions
zplug "plugins/git", from:oh-my-zsh

# adds support for doing system clipboard copy and paste operations
zplug "lib/clipboard", from:oh-my-zsh

# improves history command
zplug "lib/history", from:oh-my-zsh

# improves history command
zplug "lib/directories", from:oh-my-zsh

# provides many aliases and a few useful functions
zplug "plugins/aliases", from:oh-my-zsh

# (warp directory) lets you jump to custom directories in zsh
zplug "mfaerevaag/wd"

# Tracks your most used directories, based on 'frecency'.
zplug "rupa/z", use:"z.sh"

# Powerlevel10k is a theme for Zsh.
zplug "romkatv/powerlevel10k", as:theme, depth:1

zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

# Setting rg as the default source for fzf
if command -v fd > /dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

function my_zvm_init() {
  [ -f $XDG_CONFIG_HOME/fzf/fzf.zsh ] && source $XDG_CONFIG_HOME/fzf/fzf.zsh

  bindkey '^P' history-beginning-search-backward
  bindkey '^N' history-beginning-search-forward

  # Key bindings for zsh autosuggest
  bindkey '^i'   complete-word       # tab          | complete
  bindkey '^ ' autosuggest-accept  # ctrl + space  | autosuggest
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  ZSH_AUTOSUGGEST_USE_ASYNC=true
}

zvm_after_init_commands+=(my_zvm_init)

if command -v nvim > /dev/null 2>&1; then
  export EDITOR='nvim'
  export MANPAGER='nvim -c "Man!"'

  alias vim='nvim'
fi

if command -v rbenv > /dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
fi

if command -v pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)";
fi

if command -v pyenv-virtualenv-init > /dev/null 2>&1; then
  eval "$(pyenv virtualenv-init -)";
fi

if command -v plenv > /dev/null 2>&1; then
  eval "$(plenv init -)"
fi

gbf() {
  TEMP_BRANCH_NAME=gbf-$(date +%F)
  CURRENT_BRANCH="$(git_current_branch)"

  git checkout --quiet -b $TEMP_BRANCH_NAME && \
    git branch -f $CURRENT_BRANCH origin/$CURRENT_BRANCH && \
    git checkout --quiet $CURRENT_BRANCH && \
    git branch --quiet -D $TEMP_BRANCH_NAME
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [ -f "$HOME/.p10k.zsh" ]; then
  source "$HOME/.p10k.zsh"
fi

if [ $(ps ax | grep "[s]sh-agent" | wc -l) -eq 0 ] ; then
    eval $(ssh-agent -s) > /dev/null
fi

# If a command is issued that can’t be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
# useful to call `..` and `...` to go up folders.
setopt AUTO_CD


# Alias

# Bat 
alias cat="bat"

# cat fallback
alias ccat="cat"

# Exe
alias ls="exa -la --group-directories-first --icons"

# ls fallback
alias l="ls -lha --color=auto"

# ripgrep
alias grep="rg"


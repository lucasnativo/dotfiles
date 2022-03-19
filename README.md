# LucasNativo's Dotfiles - Arch Linux

On this page, I'll be sharing my dotfiles with you.
This setup come with a bunch of useful tools and configurations for the Arch Linux.

Here's the list of the tools I'm using: neovim, tmux, zsh, git, nodejs, typescript, stow, ripgrep, fd, wget and much more.

## Install

   1. Clone this repository
   2. Go to the directory git/.config/git/config and changes [user] and [github] sections.
   3. Delete your previous dotfiles (if you have), like `.zshrc, .config/nvim/init.vim, .tmux.conf, etc.`
   4. In the cloned repository run the following command: `make`. If in your systems don't have `make` you can install it with `pacman -S make`.
   5. Make the zsh as default shell. You can do this by running the following command: `chsh -s /bin/zsh` (or `sudo chsh -s /bin/zsh $USER`). Then you can logout and login again.
   6. Open your terminal and if appears the Powerlevel10k configurations, configure it as you want. If not appears, probably you not running the zsh.
   7. After configuring the Powerlevel10k, you can open the Neovim and run the following command: `:PlugInstall`
   8. Enjoy it!

## How to configure to your like

Now you have all the tools and configurations to use this setup. You can use it as a base for your own setup. You just need to change and save the dotfiles on the clone repository and the settings will take effect. You don't need to go on the files locally, because the files is linked.

## Features

### Neovim

- nvim-lspconfig
- Plug plugin manager
- tpop's plugins
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim), search files with `<space> p` and search in files with `<space> s`
- File navigation with vim-dirvish, open with `-`
- File manipulation with [vim-dirvish-dovish](https://github.com/roginfarrer/vim-dirvish-dovish)
- And a lot more plugins and cool maps (look the init.vim)

### Zsh

- Powerlevel10k as zsh theme
- zsh-autosuggestions, use `<C-space>` to autocomplete
- fzf integration, use <C-t> to open fzf
- [rupa/z](https://github.com/rupa/z) tracks your most used directories, use `z dot` to open the dotfiles directory
- zsh-vi-mode
- zplug "plugins/git" for nices git aliases
- zsh-syntax-highlighting
- And a lot more (look the zshrc)

### Tmux

- For tile the windows in the tmux session. You can use the following commands: 
- `<C-a> c` to create a new windows
- `<C-a> -` to split a window horizontally
- `<C-a> |` to split a window vertically
- `<C-a> x` to kill a pane without confirmation.
- `<C-a> n` to cycle the windows.
- `<C-a> 1,2,3...` to go to that window number.
- `<C-a> h,j,k,l` to go move between pane as vim style.
- For more look the (tmux.conf)

### Stow

- For managing the links between the dotfiles and the local files.

### [Rewritten in Rust: Modern Alternatives of Command-Line Tools](https://zaiste.net/posts/shell-commands-rust/)

- [bat](https://github.com/sharkdp/bat) - A cat clone with syntax highlighting and Git integration.
- [exe](https://github.com/ogham/exa) - Exa is a modern replacement for the venerable file-listing command-line program ls that ships with Unix and Linux operating systems, giving it more features and better defaults.
- [ripgrep](https://github.com/BurntSushi/ripgrep) - ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern. By default, ripgrep will respect gitignore rules and automatically skip hidden files/directories and binary files.
- [bandwhich](https://github.com/imsnif/bandwhich) - This is a CLI utility for displaying current network utilization by process, connection and remote IP/hostname - ` man bandwhich `
- [git-delta](https://dandavison.github.io/delta/introduction.html) - Code evolves, and we all spend time studying diffs. Delta aims to make this both efficient and enjoyable: it allows you to make extensive changes to the layout and styling of diffs, as well as allowing you to stay arbitrarily close to the default git/diff output.

----
Many thanks to [@matheussampaio](https://github.com/matheussampaio) for this awesome setup.

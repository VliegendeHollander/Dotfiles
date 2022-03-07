## VliegendeHollander Dotfiles

 ###### TABLE OF CONTENTS
 - ###### VIM CONFIGURATION
 - ###### SHELL CONFIGURATION
 - ###### SETUP
 - ###### CLONE
##

###### VIM CONFIGURATION
- ###### [Vim-plug](https://github.com/junegunn/vim-plug) - A minimalist Vim plugin manager.
- ###### [Lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of common configurations for Neovim's built-in language server client.
- ###### [Nvim-Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter configurations and abstraction layer for Neovim.
- ###### [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua.
- ###### [Lspsaga.nvim](https://github.com/tami5/lspsaga.nvim) - Lspsaga is light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
- ###### [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Telescope.nvim is a highly extendable fuzzy finder over lists.
- ###### [Defx.nvim](https://github.com/Shougo/defx.nvim) - Defx is a dark powered plugin for Neovim/Vim to browse files.

###### SHELL CONFIGURATION
- ###### [Fish](https://fishshell.com/) - Fish is a smart and user-friendly command line shell. 
- ###### [Fisher](https://github.com/jorgebucaran/fisher) - A plugin manager for Fish
- ###### [Z fish shell](https://github.com/jethrokuan/z) - Directory jumping
- ###### [Exa - ls replacement](https://the.exa.website/) - A modern replacement for ls
- ###### [Peco](https://github.com/peco/peco) - Simplistic interactive filtering tool
- ###### [Starship](https://github.com/starship/starship) - The minimal, blazing-fast, and infinitely customizable prompt for any shell!

###### SETUP
 
Define ~/.config/dotfiles directory as a git bare repository  
```
mkdir ~/.config && git init --bare $HOME/.config/dotfiles
```

File within the home folder can be versionned with commands like:
```
alias config='/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME'
```

Use config command anywhere to call any git command for this repo (entire home directory is not waiting to be addded with this one)
```
config config status.showUntrackedFiles no
```

Verify if the working tree status is empty
```
config status
```

###### CLONE

Clone to a linux computer
```
git clone --separate-git-dir=$HOME/.config/dotfiles https://github.com/VliegendeHollander/Dotfiles.git /tmp
cd /tmp/Dotfiles
mv .git ~/.config/dotfiles
cd
cp -r /tmp/config-linux/* .
rm -r /tmp/config-linux
config config status.showUntrackedFiles no
```

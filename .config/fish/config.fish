if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Disable default welcome message
set fish_greeting ""


#####
###	THEME
#####
starship init fish | source
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

source (dirname (status --current-filename))/config_theme.fish

#####
###	ALIASES
#####
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH


#####
##	NVM 
#####
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

#####
##	IMPORT CONFIG FOR THE SPECIFIC OS
#####
switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config_osx.fish
  case Linux
    source (dirname (status --current-filename))/config_linux.fish
end 

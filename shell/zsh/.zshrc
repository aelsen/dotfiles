# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Random Themes
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Config

# COMPLETION_WAITING_DOTS="true"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13

# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-256color
)

source $ZSH/oh-my-zsh.sh

# User configuration
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Unset TMUX share
setopt noincappendhistory
setopt nosharehistory

# ZSH Prompt
## Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
	user_style="%F{red}";
else
	user_style="%F{166}";
fi;

## Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	host_style="%F{red}";
  dir_style="%F{095}";
else
	host_style="%F{yellow}";
  dir_style="%F{green}";
fi;

# Apply prompt colors and formatting
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT="$user_style$USER%f"                                             # username
PROMPT+="%F{white}@%f"                                                  # @
PROMPT+="$host_style%m%f:"                                                # hostname
PROMPT+="$dir_style%c%f "                                                  # current directory
# PROMPT+="$(git_prompt_info) "                                           # git information
PROMPT+="${ret_status} "                                                # return status arrow
PROMPT+="%{$reset_color%}"                                              # reset color


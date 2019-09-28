# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the OhMyZSH theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="tjkirch"

eval `gdircolors $HOME/.dir_colors`

# Load the shell dotfiles, and then some:
# * ~/.mix-path can be used to extend `$PATH`.
# * ~/.mix-extra can be used for other settings you don’t want to commit to your repo.
for file in ~/.mix-{path,exports,aliases,extra}; do
[ -r "$file" ] && source "$file"
done
unset file

if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
source ~/.gnupg/.gpg-agent-info
export GPG_AGENT_INFO
else
eval $(gpg-agent --daemon)
fi

bindkey -e; bindkey '\e\e[C' forward-word; bindkey '\e\e[D' backward-word

# Init pyenv if it exsits to ease with python environments
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# --- ZSH CONFIG -----------------------
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# --- PLUGINS ----------------------------------
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git brew bundler capistrano cloudapp composer gem laravel npm rvm bower sublime)
plugins=(zsh-syntax-highlighting aws brew zsh-completions autopep8 docker pgp-agent github history jsontool node pip python pylint sudo tmux pip-env z docker hub)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

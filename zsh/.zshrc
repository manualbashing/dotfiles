if [ -z "$TMUX" ]
then
    if [[ "$TERM_PROGRAM" == "vscode" ]]
    then
        tmux new-session -A -s vscode
    else
        tmux new-session -A -s terminal
    fi
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#export ZSH="/home/mbatsching/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"
eval "$(oh-my-posh init zsh --config https://raw.githubusercontent.com/manualbashing/dotfiles/mother/oh-my-posh/.oh-my-posh.json)"
#eval "$(oh-my-posh init zsh --config /home/mbatsching/git/dotfiles/oh-my-posh/.oh-my-posh.json)"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-completions zsh-pyenv ssh-agent)

# Ensure agent is running
ssh-add -l &>/dev/null
if [ $? -eq 2 ]; then
  # Could not open a connection to your authentication agent.

   # Load stored agent connection info.
   test -r ~/.ssh-agent && \
     eval "$(<~/.ssh-agent)" >/dev/null

   ssh-add -l &>/dev/null
   if [ $? -eq 2 ]; then
     # Start agent and store agent connection info.
     (umask 066; ssh-agent > ~/.ssh-agent)
     eval "$(<~/.ssh-agent)" >/dev/null
   fi
fi

# Load identities
ssh-add -l &>/dev/null
if [ $? -eq 1 ]; then
 # The agent has no identities.
 # Time to add one.
 ssh-add -t 4h
fi

zstyle :omz:plugins:ssh-agent agent-forwarding yes

#source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=black,bold,underline"

autoload bashcompinit 
bashcompinit 

source /etc/bash_completion.d/azure-cli
# For Loading the SSH key
#/usr/bin/keychain --nogui $HOME/.ssh/id_rsa
# source $HOME/.keychain/WSMBA03-sh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -e ~/.bash_aliases ]] && source ~/.bash_aliases

source <(kubectl completion zsh)
complete -F __start_kubectl k

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init --path)"
#eval "$(pyenv virtualenv-init -)"
. $HOME/.asdf/asdf.sh

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

# GO PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Make sure that ~/.local/bin is preferred over /usr/local/bin
export PATH=/home/mbatsching/.local/bin:$PATH


if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  export XDG_RUNTIME_DIR=/run/user/$UID
  if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
    export XDG_RUNTIME_DIR=/tmp/$USER-runtime
    if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
      mkdir -m 0700 "$XDG_RUNTIME_DIR"
    fi
  fi
fi

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#export PATH="/home/mbatsching/git/git-fuzzy/bin:$PATH"

# Control the preview window with the up/down keys
export FZF_DEFAULT_OPTS="--bind up:preview-up,down:preview-down"

export PATH=$PATH:/home/mbatsching/.dotnet/tools   
enable_poshtransientprompt

# Start Docker daemon automatically when logging in if not running.

export PATH=/usr/bin:$PATH
#export DOCKER_HOST=unix:///mnt/wslg/runtime-dir/docker.sock
#service docker status > /dev/null
#if [[ "$?" -eq "1" || "$?" -eq "3" ]]; then
    ##sudo service docker start
    #PATH=/usr/bin:/sbin:/usr/sbin:$PATH dockerd-rootless.sh  --iptables=false
#fi

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

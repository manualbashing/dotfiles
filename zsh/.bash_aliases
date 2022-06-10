 alias ii="printf '\"%s\"' \$(wslpath -w \$PWD) | clip.exe;echo \"\u001b[33mCurrent windows path copied to clipboard.\""
 alias cls='clear'
 alias ra='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
 how() 
 {
	command="${@//[ ]/+}" 
	curl cheat.sh/"$command"
        print -S "`curl -s cheat.sh/\"$command?QT\"`"
 }
alias pass='openssl rand -base64 14'
alias wrap='tput smam'
alias bfg='java -jar ~/jar/bfg-1.13.2.jar'
alias nowrap='tput rmam'
alias k=kubectl
alias pyenv=/home/mbatsching/.pyenv/bin/pyenv

alias azswitch=$'az account list --all --query \'[].[id, user.name, name, homeTenantId]\' -o table |\
  awk \'(NR>2)\' |\
  fzf --preview "echo {} | awk \'{print \\$1}\' | xargs az account show -o yaml -s" --preview-window up,15,border-horizontal |\
  awk \'{print $1}\' |\
  xargs az account set -s && az account show'

alias start='xdg-open'

batgrep () {
    grep $@ | fzf --preview 'batcat --color=always --style=numbers --line-range=:500 {}'
  }

alias lumos='powershell.exe -NoProfile -Command "Invoke-Lumos"'

export PATH="$PATH:$HOME/.composer/vendor/bin"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

function sshConnectToTeam(){
  ssh wood@$1dev72.dev.expt.ca
}

alias ssht='sshConnectToTeam'

function jail(){

  umount -f agwdev54.dev.experiencepoint.vpn:/var/www/sites/

  if  ! echo "$APPS" | grep -q "$1"; then
      echo "Application can only be one of the following: $APPS"
      return
  fi

  if [[ ! $PWD == '/Users/$(whoami)/Projects' ]]; then
      cd "/Users/$(whoami)/Projects"
  fi

  if [[ ! -d "./$1" ]]; then
      mkdir "./$1"
  fi

  sshfs "agwdev54.dev.experiencepoint.vpn:/var/www/sites/$1" "./$1"
}

function jail72(){

  umount -f agwdev72.dev.experiencepoint.vpn:/var/www/sites/

  if  ! echo "$APPS" | grep -q "$1"; then
      echo "Application can only be one of the following: $APPS"
      return
  fi

  if [[ ! $PWD == '/Users/$(whoami)/Projects72' ]]; then
      cd "/Users/$(whoami)/Projects72"
  fi

  if [[ ! -d "./$1" ]]; then
      mkdir "./$1"
  fi

  sshfs "agwdev72.dev.experiencepoint.vpn:/var/www/sites/$1" "./$1"
}

function jwatch(){
 for var in "$@"
 do
     unison -ui text -batch -repeat watch $var
 done
}

function jsync(){
 for var in "$@"
 do
     unison -ui text -batch $var
 done
}

function sshTunnel(){
 ssh -N -L localhost:8080:localhost:8080 wood@agwdev72.dev.experiencepoint.vpn
}

export TERM='xterm-256color'

source /usr/local/share/git-core/contrib/completion/git-prompt.sh
source /usr/local/share/git-core/contrib/completion/git-completion.bash
export PS1='\[\e[01;30m\]\u@\h\[\e[00m\]:\[\e[00;36m\]\w\[\e[00m\]$(__git_ps1 " (%s)")\$ ' # nice prompt

#
# Aliases
#
alias rssh72='ssh wood@agwdev72.dev.experiencepoint.vpn'
alias rssh='ssh wood@agwdev21q4.dev.experiencepoint.vpn'
alias rssh23='ssh wood@agwdev23q4.dev.expt.ca'

alias ll='ls -GhlF'                                                            # Color + Human readable + long + metadata
alias la='ll -A'                                                               # same that above + every files

alias vi='vim'                                                                 # You never want to use vi
alias gl='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias g='git'                                                                  # because I'm always type "gti"
source ~/PhpstormProjects/files/aliases.sh
alias composer='~/.brew/sbin/composer'

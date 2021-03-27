PATH=~/bin:~/bin/homebrew/bin:$PATH

APPS="assets auth ec ei facilitator gateway eiaware eiapply ei-frontend-engine mycommitment selfserve simple techtest www timer mailq apply-nodejs"

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

function jailWatch(){
 for var in "$@"
 do
     ~/Applications/Unison.app/Contents/MacOS/Unison -ui text -batch -repeat watch $var &
 done
}

function jailSync(){
 for var in "$@"
 do
     ~/Applications/Unison.app/Contents/MacOS/Unison -ui text -batch $var &
 done
}

function sshTunnel(){
 ssh -N -L localhost:8080:localhost:8080 agwdev72.dev.experiencepoint.vpn
}

export TERM='xterm-256color'

source ~/.bashrc

#
# Aliases
#
alias rssh='ssh agwdev54.dev.experiencepoint.vpn'
alias rssh72='ssh agwdev72.dev.experiencepoint.vpn'

alias ll='ls -GhlF'                                                            # Color + Human readable + long + metadata
alias la='ll -A'                                                               # same that above + every files

alias vi='vim'                                                                 # You never want to use vi
alias gl='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias g='git'                                                                  # because I'm always type "gti"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

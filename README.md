Install
=======

    $ cd ~
    $ git clone [repo]
    $ git submodule update --init
    $ echo "" >> ~/.bash_profile && echo "source ~/.bash_profile.local" >> ~/.bash_profile
    $ ln -sf ~/Projects/files/_bash_profile ~/.bash_profile.local
    $ ln -sf ~/Projects/files/_tmux.conf ~/.tmux.conf
    $ ln -sf ~/Projects/files/_vimrc ~/.vimrc
    $ touch ~/.vim.local
    $ cp ~/Projects/files/_gitconfig.dist .gitconfig
    $ git config --global user.name [your name]
    $ git config --global user.email [your email]
    $ git config --global github.user [your github username]

tmux
====

Create a new session

    tmux -u new -s [name]

Attach to the session

    tmux -u attach

vim
===

You can create a `~/.vimrc.local` file to add private settings.

git
===

The copy of `_gitconfig.dist` contains your private settings.

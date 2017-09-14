#
# Aliases
#
connectToSql() {
    psql -hsql -U postgres
}

gitDiffTree() {
 git diff-tree --no-commit-id --name-only -r $1
}

showGitFilesChangedBetweenBranches() {

    if [ "$#" -ne 2 ]
    then
        echo "This function requires 2 arguments: gdf [branch_with_changes] [branch_to_compare_against]"
        return
    fi

    git diff --name-only $1 $(git merge-base $1 $2)
}

alias sql=connectToSql
alias gdt=gitDiffTree
alias gdf=showGitFilesChangedBetweenBranches

alias dc='docker-compose'

alias ll='ls -GhlF'                                                            # Color + Human readable + long + metadata
alias ls='ll -A'                                                               # same that above + every files

alias vi='vim'                                                                 # You never want to use vi

alias g='git'                                                                  # because I'm always type "gti"
alias gp='g pull origin $1'
alias gpp='g push'
alias gc='g commit'
alias gl='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias gld='git log --decorate'

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

gitCleanupBranch() {
    git branch -D $1
    git push origin :$1
}

function getBranchName() {

    branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
    branch_name="(unnamed branch)"     # detached HEAD
    branch_name=${branch_name##refs/heads/}
    git pull origin $(echo $branch_name)
}

function phpcs() {

    ~/dev/karon/bin/phpcs --runtime-set ignore_errors_on_exit true --runtime-set ignore_warnings_on_exit true --standard=../../karon/config/phpcs.xml --ignore=*.js --colors $1
}

alias phpcs=phpcs

alias sql=connectToSql
alias gdt=gitDiffTree
alias gdf=showGitFilesChangedBetweenBranches

alias dc='docker-compose'
alias ls='ls -GhlF -A'                                                               # same that above + every files
alias vi='vim'                                                                 # You never want to use vi

alias g='git'
alias gd='g diff'
alias grm='g rebase origin/master'
alias ga='g add'
alias gs='g status'
alias gp=getBranchName
alias gpp='g push'
alias gc='g commit'
alias gl='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias gld='git log --decorate'
alias gcb=gitCleanupBranch

#
# Aliases
#

configureSSHKeys() {
    eval "$(ssh-agent -s)"
    ssh-add
}

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

function applicationManagerBranchReplace() {

    if [ "$#" -ne 2 ]
    then
        echo 'Usage: amr ${project} ${branch}'
        return
    fi

    project=$1
    branch=$2

    cd ~/application-manager/
    git checkout master
    git pull
    git checkout -b "${branch}"
    sed -i '' "s/branch:.*/branch: ${branch}/g" "playbooks/${project}.yml"
    git add "playbooks/${project}.yml"
    git commit -m "added ${project} branch: ${branch}"
    git diff origin/master HEAD
}

function checkDiffBeforeBranchDelete() {
    git checkout $1
    git rebase origin/master
    git diff origin/master
    git checkout master
}

function makeTechtest() {
    cd ~/dev/ei-js/aware-techtest-app && make build
    cd ~/eiaware && make js && make css && app/console ep-assets:manifests
}

alias sshp=configureSSHKeys

alias maketechtest=makeTechtest

alias gappdiff=checkDiffBeforeBranchDelete

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
alias gppa='git add . && git commit --amend --no-edit && git push --force'
alias gcb=gitCleanupBranch
alias amr=applicationManagerBranchReplace
alias vi='vim'

alias composer='php -d memory_limit=-1 ./composer.phar'

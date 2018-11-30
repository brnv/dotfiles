function batrak-move() {
    local transition="$1"
    local issue="$2"
    batrak -M $issue $transition
}

alias bll='batrak -L -f 16053'
alias bl='batrak -L'
alias bd='batrak-move 21'
alias kc='jira-issue-create-schedule-current'
alias kn='jira-issue-create-schedule-next'

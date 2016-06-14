function ash-action() {
    local action=$1
    local subject=$2

    ash $subject $action
}

alias ai="ash inbox"
alias al="ash-action ls"
alias ar="ash-action review"
alias aa="ash-action approve"
alias alr="ash-action ls-reviews"

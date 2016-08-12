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

function ash-action-project-pull-request() {
    local project=$1
    local action=$2
    local pull_request=$3

    ash $project/$pull_request $action
}

alias ard="ash-action-project-pull-request deployerd review"
alias aad="ash-action-project-pull-request deployerd approve"

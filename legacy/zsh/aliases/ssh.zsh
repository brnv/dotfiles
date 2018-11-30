alias ssh='TERM=xterm ssh'

# 20.12.L -> ssh 192.168.20.12
# 20.12.P -> ssh 172.16.20.12
# t1.e    -> ssh ngs.ru.t1
# s.s     -> ssh s.s
# blah.ru -> ssh blah.ru
# node.p  -> ssh node.in.ngs.ru
# node.x  -> (resolve via search domain setting) ssh node
alias -s L='ssh-helper 192.168. .L ""'
alias -s P='ssh-helper 172.16. .P ""'
alias -s e='ssh-helper ngs.ru. .e ""'
alias -s s='ssh-helper "" .s .s'
alias -s ru='ssh-helper "" .ru .ru'
alias -s p='ssh-helper "" .p .in.ngs.ru'
alias -s x='ssh-helper "" .x ""'

ssh-helper() {
    local prefix="$1"
    local host="$4"
    local remove_suffix="$2"
    local suffix="$3"
    shift 4

    ssh-enhanced $prefix"${host%%$remove_suffix}"$suffix "${@}"
}

ssh-enhanced() {
    local hostname="$1"
    tmux set status on
    tmux set status-left "# $hostname"
    smash -z "$@"
    tmux set status off
}

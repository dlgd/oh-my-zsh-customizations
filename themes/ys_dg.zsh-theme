. $ZSH/themes/ys.zsh-theme

# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

RPS1='${return_code}'

function accept-line-or-clear-warning () {
        if [[ -z $BUFFER ]]; then
                time=$time_disabled
                return_code=$return_code_disabled
        else
                time=$time_enabled
                return_code=$return_code_enabled
        fi
        zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning

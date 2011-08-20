color_prompt=yes
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
bold=$(tput bold)
reset=$(tput sgr0)
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != 'nothing to commit (working directory clean)' ]] && echo $red || echo $green
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/\* \(.*\)/\1/"
}

if [ "$color_prompt" = yes ]; then
    PS1="\[$bold\]\[$green\]\u@\h\[$reset\]:\[$bold\]\[$blue\]\W\[$reset\]:\[\$(parse_git_dirty)\]\$(parse_git_branch)\[\$reset\]\$ "
else
    PS1='\u@\h:\W:$(parse_git_branch) " (%s)")\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h:\w\a\]$PS1"
    ;;
*)
    ;;
esac

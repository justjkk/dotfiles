color_prompt=yes
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
bold=$(tput bold)
reset=$(tput sgr0)
function _ver_higher {
  ver=`echo -ne "$1\n$2" |sort -Vr |head -n1`
  if [ "$2" == "$1" ]; then
    return 1
  elif [ "$2" == "$ver" ]; then
    return 0
  else
    return 1
  fi
}
function parse_git_dirty {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 && \
    git diff --quiet --ignore-submodules HEAD && echo $green || echo $red
}
function parse_git_branch {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 && \
  git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||'
}

function add_git_status_to_prompt {
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
}

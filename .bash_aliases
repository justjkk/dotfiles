alias ppjson=~/bin/ppjson.py
alias gitl="git log --all --decorate --graph --date-order"
alias gits="git status"
alias gitd="git diff"
alias gitdc="git diff --cached"
alias mysqlcsvimport="head -1 $2 | xargs mysqlimport $1 --fields-terminated-by=, --fields-optionally-enclosed-by='\"' --ignore-lines=1 --local $2 --columns"
function mysqlprettydump {
  mysqldump $1 | sed -e 's/,(/,\n(/g' -e 's/VALUES (/VALUES\n(/g'
}
function audio_duration {
  find "$1" -name '*.mp3' -print0 |
  xargs -0 -n1 avprobe 2>&1 |
  grep 'Duration' | tr -s ' ' | cut -d' ' -f 3 | cut -d'.' -f 1 | tr ':' ' ' |
  xargs -l python -c 'import sys; print 3600 * int(sys.argv[1]) + 60 * int(sys.argv[2]) + int(sys.argv[3])' |
  python -c 'import sys; import datetime; print datetime.timedelta(seconds=sum(map(int, sys.stdin.readlines())))'
}

[ -f ~/.bash_aliases.local ] && . ~/.bash_aliases.local

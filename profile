source ~/.git-completion

export PATH=/Users/$(whoami)/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

#Default editor
export EDITOR='/usr/bin/vim'

# XCode 4.2 RVM Fix
export CC=gcc-4.2

# Initialise rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Profile aliases
alias profile='$EDITOR ~/.profile'
alias vimrc='$EDITOR ~/.vimrc'
alias resource='. ~/.profile'

# Git aliases
alias gg='git grep'
alias gco='git checkout'
alias gd='git diff'
alias gdc='gd --cached'
alias gp='git push'
alias gpl='git pull'
alias gplr='gpl --rebase'
alias gst='git status'
alias gs=gst
alias gf='git fetch'
alias ga='git add'
alias gca='git commit --amend'
alias gre!='git reset --hard head'
alias gcf!='git clean -fd'
alias gl='git lg'
alias gc='git shortlog -ns'

# Miscellaneous aliases
alias ll='ls -lah'
alias :q=exit

# Functions
# Convert videos to mp4 for iTunes/iOS. Use cores * 1.5 as the number of threads.
mp4() {
  ffmpeg -i "$1" -threads 3 -sameq -acodec libfaac -ar 48000 -ab 160k -ac 2 "$1".mp4
}

clone() {
  git clone git@github.com:$1.git
}

sd() {
  sudo shutdown -h +$1
}

google() { open http://www.google.com/search?q=$(echo "$*" | sed 's/ /+/g'); }

# Copies the previous command from history to the clipboard
copy()
{
  local previous=$(history 2 | head -1 | sed -E 's/^  [0-9]+  //' | tr -d '\n')
  echo -n $previous | pbcopy
  growlnotify -m  "Copied:"$'\n'"$previous"
}

mkcd()
{
  mkdir $1 && cd $1
}

# Helps gauge how long something is going to take by simulating its output
gauge()
{
  for i in $(eval echo {1..$1}); do echo -n $2; done
  echo
}

resolve() {
  curl -LIs $1 | grep Location | sed 's/Location: //' | head -1
}


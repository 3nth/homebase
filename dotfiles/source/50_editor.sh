# Editing

if [[ ! "$SSH_TTY" && "$OSTYPE" =~ ^darwin ]]; then
  export EDITOR='gvim'
  export LESSEDIT='gvim %f'
  alias q='gvim'
else
  export EDITOR="vim -e"
  alias q="$EDITOR -w -z"
fi

export VISUAL="$EDITOR"

alias q.='q .'

function qs() {
  pwd | perl -ne"s#^$(echo ~/.dotfiles)## && exit 1" && cd ~/.dotfiles
  q ~/.dotfiles
}

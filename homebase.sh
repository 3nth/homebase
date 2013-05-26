# Ensure that we can actually, like, compile anything.
if [[ ! "$(type -P gcc)" && "$OSTYPE" =~ ^darwin ]]; then
  e_error "The XCode Command Line Tools must be installed first."
  exit 1
fi

python ./homebase.py

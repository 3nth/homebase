# Ensure that we can actually, like, compile anything.
if [[ ! "$(type -P gcc)" && "$OSTYPE" =~ ^darwin ]]; then
  e_error "The XCode Command Line Tools must be installed first."
  exit 1
fi

MYDIR="$(dirname "$0")"
python $MYDIR/homebase.py

if [ ! -e ~/.vim/bundle/vundle ]; then
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

vim +BundleInstall +qall

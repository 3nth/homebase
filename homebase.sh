# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

# Ensure that we can actually, like, compile anything.
if [[ ! "$(type -P gcc)" && "$OSTYPE" =~ ^darwin ]]; then
  e_error "The XCode Command Line Tools must be installed first."
  exit 1
fi

if [[ ! "$(type -P brew)" ]]; then
     e_header "Installing Homebrew"
     true | /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
fi

e_header "Doing a kegstand..."
MYDIR="$(dirname "$0")"
python $MYDIR/kegstand.py
e_success "installed kegs:"

brew list

e_success "dotfiles, yo!"
dotfiles -C $MYDIR/dotfiles/dotfilesrc -s -f
dotfiles -l

e_header "vi or die."
if [ ! -e ~/.vim/bundle/vundle ]; then
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

vim +BundleInstall +qall 

source ~/.bashrc

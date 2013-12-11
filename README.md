# homebase

a ~ builder

## homebase does

homebase will set up your home environment with your dotfiles and favorites tools.

if you like my home, then come on in...

    bash < <(curl -fsSL https://raw.github.com/3nth/homebase/master/homebase)
  
...but you probably want your own, so fork off and edit homebase with your own repo address

#### dotfiles
homebase uses [dotfiles](https://pypi.python.org/pypi/dotfiles) to manage dotfiles and expects your dotfiles to be stored in the dotfiles subdirectory

#### bash
.bash_profile sources .bashrc which sources everything in .source

#### brew
kegstand.py reads your .kegstand file as a list of brew install calls.

#### vim
homebase will install vundle and then use it to install whatever bundles are in your .vimrc

## homebase thanks

It all started with [cowboy's dotfiles](https://github.com/cowboy/dotfiles), but then I found [dotfiles](https://pypi.python.org/pypi/dotfiles) and preferred it and conjured up kegstand.

send medals to derek [at] enth.net




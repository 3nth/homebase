# Ensure that we can actually, like, compile anything.
if [[ ! "$(type -P gcc)" && "$OSTYPE" =~ ^darwin ]]; then
  e_error "The XCode Command Line Tools must be installed first."
  exit 1
fi

# If Git is not installed...
if [[ ! "$(type -P git)" ]]; then
  # OSX
  if [[ "$OSTYPE" =~ ^darwin ]]; then
    # It's easiest to get Git via Homebrew, so get that first.
    if [[ ! "$(type -P brew)" ]]; then
      e_header "Installing Homebrew"
      true | /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
    fi
    # If Homebrew was installed, install Git.
    if [[ "$(type -P brew)" ]]; then
      e_header "Updating Homebrew"
      brew update
      e_header "Installing Git"
      brew install git
    fi
  # Ubuntu.
  elif [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]]; then
    # Git is fairly easy.
    e_header "Installing Git"
    sudo apt-get -qq install git-core
  fi
fi

# If Git isn't installed by now, something exploded. We gots to quit!
if [[ ! "$(type -P git)" ]]; then
  e_error "Git should be installed. It isn't. Aborting."
  exit 1
fi

# Update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

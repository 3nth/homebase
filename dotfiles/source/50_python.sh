export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export PROJECT_HOME=~/projects
export WORKON_HOME=~/envs
source virtualenvwrapper.sh

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end


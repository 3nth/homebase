<<<<<<< HEAD
#PYTHON_PATH=/usr/local/share/python
#PATH=$PYTHON_PATH:$(path_remove $PYTHON_PATH)
#export PATH
source virtualenvwrapper.sh
export PROJECT_HOME=~/projects
=======
# PYTHON_PATH=/usr/local/share/python
# PATH=$PYTHON_PATH:$(path_remove $PYTHON_PATH)
# export PATH

export PROJECT_HOME=~/projects
export WORKON_HOME=~/envs
source /usr/local/bin/virtualenvwrapper.sh

>>>>>>> 7698db069fd00230b204c382b52dc3b5e9eb6379
# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end


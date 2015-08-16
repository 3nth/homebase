if [[ "$(type -P powerline-daemon)" ]]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    SP=`python2.7 -c "from os import path; import powerline; print(path.dirname(powerline.__file__))"`
    . $SP/bindings/bash/powerline.sh
fi

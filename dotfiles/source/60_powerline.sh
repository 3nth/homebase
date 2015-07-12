if [[ "$(type -P powerline)" ]]; then
    #SP=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    SP=`python2.7 -c "from os import path; import powerline; print(path.dirname(powerline.__file__))"`
    . $SP/bindings/bash/powerline.sh
    #. ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
fi

if [[ "$(type -P powerline)" ]]; then
    #SP=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
    SP=`python2.7 -c "from os import path; import powerline; print(path.dirname(powerline.__file__))"`
    . $SP/bindings/bash/powerline.sh
    #. ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
fi

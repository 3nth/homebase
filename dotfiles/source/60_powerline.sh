if [[ "$(type -P powerline)" ]]; then
    SP=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
    . $SP/powerline/bindings/bash/powerline.sh
fi
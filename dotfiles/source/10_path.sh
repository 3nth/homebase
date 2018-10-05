# From http://stackoverflow.com/questions/370047/#370255
function path_remove() {
  IFS=:
  # convert it to an array
  t=($PATH)
  unset IFS
  # perform any array operations to remove elements from the array
  t=(${t[@]%%$1})
  IFS=:
  # output the new array
  echo "${t[*]}"
}

#This helper function will add a directory to the PATH if it exists
#This is a simple way to handle different machines, OSes, and configurations
function addPath() {
    if [ -d "${1}" ]; then
        if [ -z "${PATH}" ]; then
            export PATH="${1}"
        else
          export PATH=$PATH:"${1}"
        fi
    fi
}

function setupPath() {
    #Start with an empty PATH
    PATH=
    # #Local pwd stuff
    # addPath "${PWD}/script"
    # addPath "${PWD}/bin"
    # #For node
    # addPath "${PWD}/node_modules/.bin"
    # addPath "${PWD}/node/bin"
    # #For python virtualenvs
    # addPath "${PWD}/env/bin"

    #Personal home dir stuff
    addPath ~/bin
    # #For rbenv
    # addPath ~/.rbenv/bin
    # addPath ~/.cabal/bin
    #Homebrew
    # addPath ~/Library/Python/2.7/bin
    #XCode/Developer
    # addPath /Developer/usr/bin
    #Normal system stuff
    addPath /usr/local/bin
    addPath /usr/bin
    addPath /bin
    addPath /usr/local/sbin
    addPath /usr/sbin
    addPath /sbin
    addPath /opt/X11/bin
    addPath /usr/local/share/dotnet
    addPath "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
}
#Run this during shell startup. Can be re-run as needed manually as well
setupPath

function chpwd() {
        [ -d .git -o \
          -d  node_modules/.bin -o \
          -d python/bin -o \
          -d node/bin ] && setupPath
    }

function cd()
{
    builtin cd "$@"
    chpwd
}
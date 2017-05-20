source ~/lib/azure-cli/az.completion

return 

source dnvm.sh

dnxmon() {
    # Run dnx server continuously with nodemon
    # watching for changes to cs or json files
    # Usage:
    #   dnxmon <directory> <command>
    # dnxmon (applies the defaults: current directory and the "web" command)

    dnxmonFn() {
        nodemon --ext "cs,json" --exec "dnx $1 $2"
    }

    if [[ $# -eq 0 ]]
    then
        echo "running default ..."
        echo "nodemon --ext "cs,json" --exec "dnx . kestrel""
        dnxmonFn . kestrel
    else
        if [[ $# -eq 2 ]]
        then
            echo "nodemon --ext "cs,json" --exec "dnx $1 $2""
            dnxmonFn $1 $2
        else
            echo "must supply directory and command,"
            echo "such as dnxmon . kestrel"
        fi
    fi
}
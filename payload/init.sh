#!/usr/bin/env bash # do not make executable

k0-resolve () {
    local path=$1
    [ $path. == . ] && echo [k0-resolve]: ARG REQUIRED
    [ $path. == . ] && return 1
    while [ -L $path ]; do path=$(readlink $path); done
    local first_char=${path:0:1}
    if [ ! "$first_char" == "/" ]; then
        pushd $(dirname $path) > /dev/null
        path=$PWD/$(basename $path)
        popd > /dev/null
    fi
    echo $path
}

k0-init-nnn () {
    local here=$(k0-resolve $1)
    local name
    [ -f $here ] && here=$(dirname $here)
    for name in $(ls $here | sort | grep ^[0-9]); do
        local path=$here/$name
        [ ! -z $KISS_DEBUG ] && echo DEBUG: source $path
        source $path 
    done
}

export K0_THIS_CALLER=$0
export K_0=${BASH_SOURCE[0]}
export K_1=${BASH_SOURCE[1]}
k0-init-nnn $K_0
unset K_0
unset K_1

err4debug () {
    local err=./tmp.$RANDOM
    . .k0.debug abc 2>$err
    cat $err
    rm $err
}

err4err () {
    local err=$KT_SANDBOX/tmp.err4drr
    . .k0.err abc 2>$err
    cat $err
    rm $err
}
    
fatal () {
    . .k0.bold "    ${FUNCNAMS[1]}: fatal: $*" >&1
    return 1
}

remove () {
    [ -f $1 ] && rm $1
    return 0
}

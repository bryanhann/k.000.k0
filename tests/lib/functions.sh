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
    
my_regress () {
    # XXX This was refactored without regression testing.
    local fun=${FUNCNAME[1]}
    local exp_stdout=$KT_EXP/$fun.out
    local exp_stderr=$KT_EXP/$fun.err
    local got_stdout=$KT_GOT/$fun.out
    local got_stderr=$KT_GOT/$fun.err
    $* > $got_stdout 2> $got_stderr
    err=0
    cmp $got_stdout $exp_stdout > /dev/null || err=$(( $err + 1 ))
    cmp $got_stderr $exp_stderr > /dev/null || err=$(( $err + 2 ))
    return $err
}

fatal () {
    . .k0.bold "    ${FUNCNAMS[1]}: fatal: $*" >&1
    return 1
}

remove () {
    [ -f $1 ] && rm $1
    return 0
}

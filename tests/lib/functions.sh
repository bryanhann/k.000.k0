err4debug () {
    local err=./tmp.$RANDOM
    . .k0.debug abc 2>$err
    cat $err
    rm $err
}

err4err () {
    local err=$sandbox/tmp.err4drr
    . .k0.err abc 2>$err
    cat $err
    rm $err
}
    
my_regress () {
    local fun=${FUNCNAME[1]}
    local exp_stdout=$the_exp_dir/$fun.out
    local exp_stderr=$the_exp_dir/$fun.err
    local got_stdout=$the_got_dir/$fun.out
    local got_stderr=$the_got_dir/$fun.err
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

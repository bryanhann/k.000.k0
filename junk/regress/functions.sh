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


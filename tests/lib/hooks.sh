oneTimeSetUp() {
   # XXX This was refactored without regression testing.
   mkdir -p $KT_SANDBOX
   rm       $KT_GOT/*
   rmdir    $KT_GOT
   mkdir -p $KT_EXP
   mkdir -p $KT_GOT
}

oneTimeTearDown() {
   rm -rf $KT_SANDBOX
}

setUp () {
    real=$KT_SANDBOX/real.$RANDOM
    link=$KT_SANDBOX/link.$RANDOM
    remove $real
    remove $link
}

tearDown () {
    remove $real
    remove $link
}

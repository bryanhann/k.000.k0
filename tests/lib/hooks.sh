oneTimeSetUp() {
   mkdir -p $KT_SANDBOX
   rm       $the_got_dir/*
   rmdir    $the_got_dir
   mkdir -p $the_exp_dir
   mkdir -p $the_got_dir
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

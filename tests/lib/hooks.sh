oneTimeSetUp() {
   mkdir -p $sandbox
   rm       $the_got_dir/*
   rmdir    $the_got_dir
   mkdir -p $the_exp_dir
   mkdir -p $the_got_dir
}

oneTimeTearDown() {
   rm -rf $sandbox
}

setUp () {
    real=$sandbox/real.$RANDOM
    link=$sandbox/link.$RANDOM
    remove $real
    remove $link
}

tearDown () {
    remove $real
    remove $link
}

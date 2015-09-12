namespace eval futil {
    set version 0.1
 }

 proc futil::read {filename} {
    set fp [open $filename]
    set string [::read $fp] ;# prevent name conflict with itself
    close $fp
    return $string
 }
 proc futil::write {filename string} {
    set fp [open $filename w]
    if {[string index $string end]!="\n"} {append string \n}
    puts -nonewline $fp $string
    close $fp
 }
 proc futil::? {} {lsort [info procs ::futil::*]}
 # If execution comes this far, we have succeeded ;-)
 package provide futil $futil::version

 #--------------------------- Self-test code
 if {[info ex argv0] && [file tail [info script]] == [file tail $argv0]} {
    puts "package futil contains [futil::?]"
    set teststring {
        This is a teststring
        in several lines...}
    puts teststring:'$teststring'
    futil::write test.tmp $teststring
    set string2 [futil::read test.tmp]
    puts string2:'$string2'
    puts "strings are [expr {$teststring==$string2? {}:{not}}] equal"
    file delete test.tmp ;# don't leave traces of testing

    # Simple index generator, if the directory contains only this package
    pkg_mkIndex -verbose [file dirn [info scr]] [file tail [info scr]]
 }
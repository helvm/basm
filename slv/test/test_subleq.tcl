#!/usr/bin/tclsh
#!/bin/sh
# -*- tcl -*-
# The next line is executed by /bin/sh, but not tcl \
exec tclsh "$0" ${1+"$@"}

lappend ::auto_path ../main 

package require tcltest 2
namespace import tcltest::*

package require tempfile
namespace import ::tempfile::new_init_tempfile

set BF "bf"
#set SUBLEQ "../bin/Python-Subleq-master/subleq.py"
#set SUBLEQ "./subleq.py"
set SUBLEQ "../bin/sqrun"

test example-bf {an example test} -body {
    set c1 {++++++++++[>+++++++>++++++++++>+++>+<<<<-]}
    set c2 {>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.}
    set code [concat $c1 $c2]
    set codefile [new_init_tempfile $code]
    
    set out [exec $BF "$codefile"]
    puts $out
    return $out
} -result "Hello World!"

test example-sle {an example test} -body {


    set code {
a; p Z; Z a; Z
a:0 (-1)
m1 p;
a; E Z; Z a; Z;
p a (-1)
Z Z 0
. p:H Z:0 m1:-1
. H: "Hello, World!\n" E:E
}

    set codefile [new_init_tempfile $code]

    set out [exec $SUBLEQ "$codefile"]
    puts $out
    return $out
} -result "Hello World!"



cleanupTests
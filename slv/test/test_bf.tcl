#!/usr/bin/tclsh
#!/bin/sh
# -*- tcl -*-
# The next line is executed by /bin/sh, but not tcl \
exec tclsh "$0" ${1+"$@"}

lappend ::auto_path ../main 

package require tcltest 2
namespace import tcltest::*

package require logger
set log [logger::init main]

package require tempfile
namespace import ::tempfile::new_init_tempfile

set BF "bf"
set SLV "../main/slv.tcl"

set c1 {++++++++++[>+++++++>++++++++++>+++>+<<<<-]}
set c2 {>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.}
set code [concat $c1 $c2]
set codefile [new_init_tempfile $code]


set codefile_bug [new_init_tempfile {
>++++++++[<+++++++++>-]<.>>+>+>++>[-]+<[>[->+<<++++>]<<]>.+++++++..+++.>
>+++++++.<<<[[-]<[-]>]<+++++++++++++++.>>.+++.------.--------.>>+.>++++.
}]

test bf {an example test} -body {
    return [exec $BF $codefile]
} -result "Hello World!"

test slv {an example test} -body {
    return [exec $SLV --noinput -tbf $codefile]
} -result "Hello World!"

test slv-in {an example test} -body {
    return [exec $SLV -tbf -r < $codefile]
} -result "Hello World!"

test slv-cat {an example test} -body {
    return [exec cat $codefile |  $SLV  -tbf -r]
} -result "Hello World!"

test slv-echo {an example test} -body {
    return [exec echo $code |  $SLV  -tbf -r]
} -result "Hello World!"

test slv-bug {an example test} -body {
    return [exec cat $codefile_bug |  $SLV  -tbf -r]
} -result "Hello World!"




cleanupTests
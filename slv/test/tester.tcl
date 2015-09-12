#!/usr/bin/tclsh

lappend ::auto_path ../../slv/main

package require procs
namespace import ::procs::*

set TARGET bf
set ASM "../assembler/basm.tcl"
set SLV "../../slv/main/slv.tcl"

proc read_file {name} {
    set fp [open $name r]
    set result [read $fp]
    close $fp
    return $result
}

proc template { asm slv target name code result} {
    set result "test $target-${name} { $name} -body {
    return \[exec cat | $asm | $slv -t$target -r <<EOF
$code
EOF
\]
} -result $result"

    return $result 
}

set data [read_file "list.tcl"]
set pretest [read_file "pretest.tcl"]


set fp [open "test_list.tcl" w]
puts $fp $pretest

puts [llength $data]
set data0 [lindex $data 0]
puts [llength $data0]

foreach tuple $data0 {
    sets name code result $tuple
    puts $fp [template $ASM $SLV $TARGET $name $code $result] 
}

puts $fp cleanupTests

close $fp




#!/usr/bin/tclsh

set index [string last "/" $::argv0 ]
set dir [string range $::argv0 0 $index]

lappend ::auto_path ${dir}/../../slv/main 
lappend ::auto_path ${dir}/../generator/bf

package require tempfile
namespace import ::tempfile::new_tempfile

package require bbf
namespace import ::bbf::*

package require bf
package require ibf
package require ribf
package require print

proc pre {fp} {
    
}

proc post {fp} {
    
}


proc get_filename {} {
    set tmpfilename [new_tempfile]
    set fp [open $tmpfilename w]
    pre $fp
    while { 0 <= [gets stdin data] } {
        puts $fp $data
    }
    post $fp
    close $fp
    return $tmpfilename
}


proc main {} {
    set filename [get_filename]
    source $filename
}

main


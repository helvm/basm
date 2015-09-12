#!/bin/sh
# -*- tcl -*-
# The next line is executed by /bin/sh, but not tcl \
exec tclsh "$0" ${1+"$@"}
 

proc generate {cmd} {
puts "
    proc $cmd \{\} \{ 
        push
        ld0 \$operand
        ibf::i${cmd}0
        pop
    \}
"
}

proc generates {} {
    set cmds [list add sub mul div mod ls le gt ge eq ne and or xor]
    foreach cmd $cmds {
        generate $cmd
    }
}

generates

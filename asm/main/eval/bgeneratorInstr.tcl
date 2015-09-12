#!/bin/sh
# -*- tcl -*-
# The next line is executed by /bin/sh, but not tcl \
exec tclsh "$0" ${1+"$@"}

proc generate {cmd args} {
    set values [to_values $args]
    set new [string tolower $cmd]
    puts "
    proc $cmd \{$args\} \{
        puts \"#$cmd$values\"
        $new$values
        puts \"\"
    \}
"
}

proc to_values {args} {
    set result ""
    foreach arg $args {
        append result " \$" $arg
    }
    return $result
}

proc generates { } {
    set cmds1 [list LD ST ADD SUB MUL DIV MOD LS LE GT GE EQ NE AND OR XOR PRINTI INT]
    foreach cmd $cmds1 {
        generate $cmd operand
    }
    
    set cmds0 [list NOT NEG BOOL]
    foreach cmd $cmds0 {
        generate $cmd
    }
}

generates

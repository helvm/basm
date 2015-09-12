package require bf
package require ibf
package require ribf
package require print

namespace eval bbf {
    set version 0.1

    namespace export INT PRINTI
    namespace export LD ST
    namespace export ADD SUB MUL DIV MOD
    namespace export EQ NE LS LE GT GE
    namespace export NOT AND OR XOR
    
    #prosta tablica symboli
    set hash [dict create]

    #wskaźnik stosu wskazuje pierwszą zajętą komórkę
    set stack_pointer 0
    
proc hashset {name} {
    dict set ::bbf::hash $name $::bbf::stack_pointer
}

proc hashget {name} {
    dict get $::bbf::hash $name
}

proc push {{size 1}} {
    incr ::bbf::stack_pointer $size
    bf::mvr $size
}

proc pop {{size 1}} {
    incr ::bbf::stack_pointer -$size
    bf::mvl $size
}

proc ld0c {operand} {
    inc $operand
}

proc ld0v {operand} {
    #puts "operand $operand"
    set address [hashget $operand]
    #puts "address $address"
    #puts "offset [expr $::bbf::stack_pointer-$address]"
    ibf::ild [expr $::bbf::stack_pointer-$address]
}

proc ld0 {operand} {
    if {[regexp {^\d+$} $operand]} {
        ld0c $operand
    } else {
        ld0v $operand
    }    
}

source $dir/generated/bInstr.tcl
source $dir/generated/bProc.tcl

}

package provide bbf $bbf::version




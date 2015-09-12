package require bf
package require ibf
package require ribf
package require print

namespace eval mbf {
    set version 0.1

    
    namespace export DIM LIT RVAL LVAL LET PRINT
    namespace export ADD SUB MUL DIV MOD
    namespace export EQ NE LS LE GT GE
    namespace export NOT AND OR XOR
    
    #prosta tablica symboli
    set hash [dict create]

    #wskaźnik stosu wskazuje pierwszą zajętą komórkę
    set sp 0
    
    

proc hashset {v} {
    dict set hash $v $sp
}

proc hashget {v} {
    dict get $hash $v
}

proc spr {{c 1}} {
    incr sp $c
    bf::mvr $c
}

proc spl {{c 1}} {
    incr sp -$c
    bf::mvl $c
}

#### public

proc init {} {
    bf::mvr 4
}

proc DIM {v} {
    bf::const 0
    hashset $v
}

proc LIT {c} {
    spl
    bf::inc $c
}

proc RVAL {v} {
    set c [hashget $s]
    spl
    ibf::ild [expr $sp-$c]
}

#FIXME
proc LVAL {v} {
    set c [hashget $s]
    spl
    bf::inc $c
}

proc LET {} {
    ibf::iadd20 [expr $sp+2] 1
    spl
    ibf::iadd0 [expr $sp+1]
    rtabst
    ibf::iadd0 [expr -$sp-1]
}

proc PRINT {} {
    print::print
}

#### aritmetic


proc ADD { } {
    ibf::iadd0
    spl
}

proc SUB { } {
   ibf::isub0
   spl
}

proc MUL {} {
    
}

proc DIV {} {
    
}

proc NEG {} {
    ibf::isub -1
    ibf::radd -1 1
}

proc NOT {} {
    
}

proc EQ {} {
    
}

proc NE {} {
    
}

proc LE {} {
    
}

proc LS {} {
    
}

}

package provide mbf $mbf::version




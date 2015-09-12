namespace eval bf {
    set version 0.1

proc def {s} {
    puts  -nonewline $s
}

proc x {n c} {
    set result ""
    for {set i  0 } {$i < $n} {incr i} {
        append result $c
    }
    return $result;    
}

proc xx {i c0 c1} {
    if { 0 < $i } {
        return [x $i $c0]
    }
    if { 0 > $i} {
        set i [expr -$i]
        return [x $i $c1]
    }
    return ""
}

proc inc {{c 1}} {
    def [xx $c "+" "-"]
}

proc dec {{c 1}} {
    def [xx $c "-" "+"]    
}

proc mvl {{c 1}} {
    def [xx $c "<" ">"]
}

proc mvr {{c 1}} {
    def [xx $c ">" "<"]
}

proc wdo {} {
    def {[}
}

proc wend {} {
    def {]}
}

proc in {} {
    def ","
}

proc out {} {
    def "."
}

proc clr {} {
    wdo
    dec
    wend
}

}

package provide bf $bf::version







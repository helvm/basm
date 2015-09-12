namespace eval ::ibf {
    set version 0.1

proc iclr {{r 1}} {
    bf::mvl $r
    bf::clr
    bf::mvr $r
}    
    
proc iadd0 {{i 1}} {
    bf::wdo
    bf::dec
    bf::mvl $i
    bf::inc
    bf::mvr $i
    bf::wend
}

proc isub0 {{i 1}} {
    bf::wdo
    bf::dec
    bf::mvl $i
    bf::dec
    bf::mvr $i
    bf::wend
}

proc iadd20 {{i 1} {j 1}} {
    bf::wdo
    bf::dec
    bf::mvl $i
    bf::inc
    bf::mvl $j
    bf::inc
    bf::mvr $j
    bf::mvr $i
    bf::wend
}

#### private

proc ild {{i 1}} {
    set i1 [expr $i+0]
    set i2 [expr $i+1]
    #bf::mvr -$i
    ribf::riadd20 $i1 -$i1 -1
    ribf::riadd0 -1 $i2
}
}

package provide ibf $ibf::version

namespace eval ::ribf {
    set version 0.1

proc riadd0 {r i} {
    bf::mvl $r
    ibf::iadd0 $i
    bf::mvr $r
}

proc riadd20 {r i1 i2} {
    bf::mvl $r
    ibf::iadd20 $i1 $i2
    bf::mvr $r
}

proc rinc {r c} {
    bf::mvl $r
    bf::inc $c
    bf::mvr $r
}

}
package provide ribf $ribf::version

#x(y) = z
# > z y x
#space, index1, index2 and Data
# 0 y
proc rtabst {} {
    z[-space+data+z]
    space[-z+space]
    y[-space+index1+y]
    space[-y+space]
    y[-space+index2+y]
    space[-y+space]
    mvr
    rtabstdo
    mvr
    rist -1 -1
    rtabstend
    mvl
    mvl
}

proc rtabstdo {} {
    #[>>>[-<<<<+>>>>]<[->+<]<[->+<]<[->+<]>-]
    wdo
    mvr 3
    iadd 4
    mvl
    iadd -1
    mvl
    iadd -1
    mvl
    iadd -1
    mvr
    dec
    wend
}

proc rtabstend {
    #[[-<+>]<<<[->>>>+<<<<]>>-]
    wdo
    iadd
    mvl 
    riadd 2 -4
    dec
    wend
}

proc rist {r i} {
    mvl $r
    rclr $i
    iadd $i
    mvr $r
}

#x = y(z)
# > z y
#space, index1, index2 and Data
proc rtabld {} {
    z[-space+index1+z]
    space[-z+space]
    z[-space+index2+z]
    space[-z+space]
    mvr
    rtablddo
    riadd20 -3 1 2
    iadd0 -3
    mvr
    rtabldend
    mvl
    mvl
    x[-]
    data[-x+data]
}

proc ridup {r} {
    riadd20 $r $i $j
    iadd0 
}

proc rtablddo {} {
    #[>>>[-<<<<+>>>>]<<[->+<]<[->+<]>-]
    wdo
    mvr 3
    iadd0 4
    mvl 2
    iadd0 -1
    mvl 
    iadd0 -1
    mvr
    dec
    wend
}

proc rtabldend {} {
    #[[-<+>]>[-<+>]<<<<[->>>>+<<<<]>>-]
    wdo
    iadd0
    mvr
    iadd0
    mvl 2
    riadd0 2 -4
    dec
    wend
}
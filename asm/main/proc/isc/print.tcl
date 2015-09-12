namespace eval print {
    set version 0.1

proc printdef {} {
    def >>++++++++++<<
    def [->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]
    def >>
    def [-]
    def >>
    def >++++++++++<
    def [->-[>+>>]>[+[-<+>]>+>>]<<<<<]
    def >
    def [-]
    def >>
    def [>++++++[-<++++++++>]<.<<+>+>[-]]
    def <
    def [<[->-<]++++++[->++++++++<]>.[-]]
    def <<
    def ++++++
    def [-<++++++++>]
    def <
    def .
    def [-]
    def <<
    def [-<+>]
    def <
}

proc print {} {
    ribf::rinc -2 10
    bf::def {[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]}
    bf::mvr 2
    bf::clr
    bf::mvr 2
    ribf::rinc -1 10
    bf::def {[->-[>+>>]>[+[-<+>]>+>>]<<<<<]}
    bf::mvr
    bf::clr 
    bf::mvr 2
    bf::def {[>++++++[-<++++++++>]<.<<+>+>[-]]}
    bf::mvl
    bf::def {[<[->-<]++++++[->++++++++<]>.[-]]}
    bf::mvl 2
    bf::inc 6
    bf::def {[-<++++++++>]}
    bf::mvl
    bf::out
    bf::clr
    bf::mvl 2
    ibf::iadd0
    bf::mvl
}


proc printblock {} {
    >>++++++++++<<
    [->+>-
        [>+>>]
        >
        [+
            [-<+>]
        >+>>]
    <<<<<<]
    >>
    [-]
    >>>++++++++++<
    [->-
        [>+>>]
        >
        [+
            [-<+>]
        >+>>]
    <<<<<]
    >
    [-]
    >>
    [>++++++
        [-<++++++++>]
        <.<<+>+>
        [-]
    ]
    <
    [<
        [->-<]
        ++++++
        [->++++++++<]
        >.
        [-]
    ]
    <<++++++
    [-<++++++++>]
    <.
    [-]
    <<
    [-<+>]
    <
}

}

package provide print $print::version
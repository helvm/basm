#!/usr/bin/tclsh

lappend ::auto_path ../../slv/main 

package require tcltest 2
namespace import tcltest::*

package require logger
set log [logger::init main]

package require tempfile
namespace import ::tempfile::new_init_tempfile

set SLV "../../slv/main/slv.tcl"

test bf-LD { LD} -body {
    return [exec cat | ../assembler/basm.tcl | ../../slv/main/slv.tcl -tbf -r <<EOF

            LD 44
            PRINTI
        
EOF
]
} -result 44
test bf-ST { ST} -body {
    return [exec cat | ../assembler/basm.tcl | ../../slv/main/slv.tcl -tbf -r <<EOF

            INT a
            LD 44
            ST a
            LD 0
            LD a
            PRINTI
        
EOF
]
} -result 44
test bf-ADD { ADD} -body {
    return [exec cat | ../assembler/basm.tcl | ../../slv/main/slv.tcl -tbf -r <<EOF

            INT a 11
            INT b 33
            LD a
            ADD b
            PRINTI
        
EOF
]
} -result 44
test bf-SUB { SUB} -body {
    return [exec cat | ../assembler/basm.tcl | ../../slv/main/slv.tcl -tbf -r <<EOF

            INT a 55
            INT b 11
            LD a
            SUB b
            PRINTI
        
EOF
]
} -result 44
test bf-MUL { MUL} -body {
    return [exec cat | ../assembler/basm.tcl | ../../slv/main/slv.tcl -tbf -r <<EOF

            INT a 11
            INT b 4
            LD a
            ADD b
            PRINTI
        
EOF
]
} -result 44
test bf-DIV { DIV} -body {
    return [exec cat | ../assembler/basm.tcl | ../../slv/main/slv.tcl -tbf -r <<EOF

            INT a 176
            INT b 4
            LD a
            DIV b
            PRINTI
        
EOF
]
} -result 44
test bf-MOD { MOD} -body {
    return [exec cat | ../assembler/basm.tcl | ../../slv/main/slv.tcl -tbf -r <<EOF

            INT a 89
            INT b 45
            LD a
            MOD b
            PRINTI
        
EOF
]
} -result 44
cleanupTests


    proc add {} { 
        push
        ld0 $operand
        ibf::iadd0
        pop
    }


    proc sub {} { 
        push
        ld0 $operand
        ibf::isub0
        pop
    }


    proc mul {} { 
        push
        ld0 $operand
        ibf::imul0
        pop
    }


    proc div {} { 
        push
        ld0 $operand
        ibf::idiv0
        pop
    }


    proc mod {} { 
        push
        ld0 $operand
        ibf::imod0
        pop
    }


    proc ls {} { 
        push
        ld0 $operand
        ibf::ils0
        pop
    }


    proc le {} { 
        push
        ld0 $operand
        ibf::ile0
        pop
    }


    proc gt {} { 
        push
        ld0 $operand
        ibf::igt0
        pop
    }


    proc ge {} { 
        push
        ld0 $operand
        ibf::ige0
        pop
    }


    proc eq {} { 
        push
        ld0 $operand
        ibf::ieq0
        pop
    }


    proc ne {} { 
        push
        ld0 $operand
        ibf::ine0
        pop
    }


    proc and {} { 
        push
        ld0 $operand
        ibf::iand0
        pop
    }


    proc or {} { 
        push
        ld0 $operand
        ibf::ior0
        pop
    }


    proc xor {} { 
        push
        ld0 $operand
        ibf::ixor0
        pop
    }


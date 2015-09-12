
    proc LD {operand} {
        puts "#LD $operand"
        ld $operand
        puts ""
    }


    proc ST {operand} {
        puts "#ST $operand"
        st $operand
        puts ""
    }


    proc ADD {operand} {
        puts "#ADD $operand"
        add $operand
        puts ""
    }


    proc SUB {operand} {
        puts "#SUB $operand"
        sub $operand
        puts ""
    }


    proc MUL {operand} {
        puts "#MUL $operand"
        mul $operand
        puts ""
    }


    proc DIV {operand} {
        puts "#DIV $operand"
        div $operand
        puts ""
    }


    proc MOD {operand} {
        puts "#MOD $operand"
        mod $operand
        puts ""
    }


    proc LS {operand} {
        puts "#LS $operand"
        ls $operand
        puts ""
    }


    proc LE {operand} {
        puts "#LE $operand"
        le $operand
        puts ""
    }


    proc GT {operand} {
        puts "#GT $operand"
        gt $operand
        puts ""
    }


    proc GE {operand} {
        puts "#GE $operand"
        ge $operand
        puts ""
    }


    proc EQ {operand} {
        puts "#EQ $operand"
        eq $operand
        puts ""
    }


    proc NE {operand} {
        puts "#NE $operand"
        ne $operand
        puts ""
    }


    proc AND {operand} {
        puts "#AND $operand"
        and $operand
        puts ""
    }


    proc OR {operand} {
        puts "#OR $operand"
        or $operand
        puts ""
    }


    proc XOR {operand} {
        puts "#XOR $operand"
        xor $operand
        puts ""
    }


    proc PRINTI {operand} {
        puts "#PRINTI $operand"
        printi $operand
        puts ""
    }


    proc INT {operand} {
        puts "#INT $operand"
        int $operand
        puts ""
    }


    proc NOT {} {
        puts "#NOT $"
        not $
        puts ""
    }


    proc NEG {} {
        puts "#NEG $"
        neg $
        puts ""
    }


    proc BOOL {} {
        puts "#BOOL $"
        bool $
        puts ""
    }


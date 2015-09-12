{
    {
        LD
        {
            LD 44
            PRINTI
        }
        44
    }
    {
        ST
        {
            INT a
            LD 44
            ST a
            LD 0
            LD a
            PRINTI
        }
        44
    }
    {
        ADD
        {
            INT a 11
            INT b 33
            LD a
            ADD b
            PRINTI
        }
        44
    }
    {
        SUB
        {
            INT a 55
            INT b 11
            LD a
            SUB b
            PRINTI
        }
        44
    }
    {
        MUL
        {
            INT a 11
            INT b 4
            LD a
            ADD b
            PRINTI
        }
        44
    }
    {
        DIV
        {
            INT a 176
            INT b 4
            LD a
            DIV b
            PRINTI
        }
        44
    }
    {
        MOD
        {
            INT a 89
            INT b 45
            LD a
            MOD b
            PRINTI
        }
        44
    }
}
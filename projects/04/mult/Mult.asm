    // i = 0
    @i
    M=0
    // sum = 0
    @sum
    M=0
(LOOP)
    // if (i == R0) goto STOP
    @i
    D=M
    @R0
    D=D-M
    @STOP
    D;JEQ
    // sum = sum + R1
    @sum
    D=M
    @R1
    D=D+M
    @sum
    M=D
    // i = i + 1
    @i
    M=M+1
    // GOTO LOOP
    @LOOP
    0;JMP
(STOP)
    // R2 = sum
    @sum
    D=M
    @R2
    M=D
(END)
    @END
    0;JMP

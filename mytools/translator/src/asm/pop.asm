
//** pop {0} {1}
// R13 = {1} + *{0}
@{1}
D=A
@{0}
D=D+M
@R13
M=D
// pop D
@SP
AM=M-1
D=M
// *R13 = D
@R13
A=M
M=D

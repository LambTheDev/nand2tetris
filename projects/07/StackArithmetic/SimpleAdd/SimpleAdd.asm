
//** push constant 7
// D=7
@7
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 8
// D=8
@8
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** add
// pop D
@SP
AM=M-1
D=M
// *(SP-1) = D + *(SP-1)
A=A-1
M=D+M

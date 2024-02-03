
//** push constant 3030
// D=3030
@3030
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop R3
// pop D
@SP
AM=M-1
D=M
// *R3 = D
@3
M=D

//** push constant 3040
// D=3040
@3040
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop R4
// pop D
@SP
AM=M-1
D=M
// *R4 = D
@4
M=D

//** push constant 32
// D=32
@32
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop THIS 2
// R13 = 2 + *THIS
@2
D=A
@THIS
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

//** push constant 46
// D=46
@46
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop THAT 6
// R13 = 6 + *THAT
@6
D=A
@THAT
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

//** push R3
// D = *R3
@3
D=M
// push D
@SP
AM=M+1
A=A-1
M=D

//** push R4
// D = *R4
@4
D=M
// push D
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

//** push THIS 2
// D = *(2 + *THIS)
@2
D=A
@THIS
A=D+M
D=M
// push D
@SP
AM=M+1
A=A-1
M=D

//** sub
// pop D
@SP
AM=M-1
D=M
// *(SP-1) = *(SP-1) - D
A=A-1
M=M-D

//** push THAT 6
// D = *(6 + *THAT)
@6
D=A
@THAT
A=D+M
D=M
// push D
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

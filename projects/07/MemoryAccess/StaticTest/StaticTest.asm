
//** push constant 111
// D=111
@111
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 333
// D=333
@333
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 888
// D=888
@888
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop R24
// pop D
@SP
AM=M-1
D=M
// *R24 = D
@24
M=D

//** pop R19
// pop D
@SP
AM=M-1
D=M
// *R19 = D
@19
M=D

//** pop R17
// pop D
@SP
AM=M-1
D=M
// *R17 = D
@17
M=D

//** push R19
// D = *R19
@19
D=M
// push D
@SP
AM=M+1
A=A-1
M=D

//** push R17
// D = *R17
@17
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

//** push R24
// D = *R24
@24
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

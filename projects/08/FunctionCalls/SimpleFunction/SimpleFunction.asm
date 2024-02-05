//** function SimpleFunction.test
(SimpleFunction.test)

//** push constant 0
// D=0
@0
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D


//** push constant 0
// D=0
@0
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D


//** push LCL 0
// D = *(0 + *LCL)
@0
D=A
@LCL
A=D+M
D=M
// push D
@SP
AM=M+1
A=A-1
M=D

//** push LCL 1
// D = *(1 + *LCL)
@1
D=A
@LCL
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

//** not
@SP
A=M-1
M=!M

//** push ARG 0
// D = *(0 + *ARG)
@0
D=A
@ARG
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

//** push ARG 1
// D = *(1 + *ARG)
@1
D=A
@ARG
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

//** return
// endFrame = LCL
@LCL
D=M
@R13
M=D
// retAddr = *(endFrame - 5)
@5
D=A
@R13
A=M-D
D=M
@R14
M=D
// *ARG = pop()
@SP
AM=M-1
D=M
@ARG
A=M
M=D
// SP = ARG + 1
D=A+1
@SP
M=D
// THAT = *(endFrame - 1)
@R13
AM=M-1
D=M
@THAT
M=D
// THIS = *(endFrame - 2)
@R13
AM=M-1
D=M
@THIS
M=D
// ARG = *(endFrame - 3)
@R13
AM=M-1
D=M
@ARG
M=D
// LCL = *(endFrame - 4)
@R13
AM=M-1
D=M
@LCL
M=D
// goto retAddr
@R14
A=M
0;JMP

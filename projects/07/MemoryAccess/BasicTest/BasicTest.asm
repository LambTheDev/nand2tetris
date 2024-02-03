
//** push constant 10
// D=10
@10
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop LCL 0
// R13 = 0 + *LCL
@0
D=A
@LCL
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

//** push constant 21
// D=21
@21
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 22
// D=22
@22
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop ARG 2
// R13 = 2 + *ARG
@2
D=A
@ARG
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

//** pop ARG 1
// R13 = 1 + *ARG
@1
D=A
@ARG
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

//** push constant 36
// D=36
@36
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop THIS 6
// R13 = 6 + *THIS
@6
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

//** push constant 42
// D=42
@42
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 45
// D=45
@45
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop THAT 5
// R13 = 5 + *THAT
@5
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

//** pop THAT 2
// R13 = 2 + *THAT
@2
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

//** push constant 510
// D=510
@510
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop R11
// pop D
@SP
AM=M-1
D=M
// *R11 = D
@11
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

//** push THAT 5
// D = *(5 + *THAT)
@5
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

//** push THIS 6
// D = *(6 + *THIS)
@6
D=A
@THIS
A=D+M
D=M
// push D
@SP
AM=M+1
A=A-1
M=D

//** push THIS 6
// D = *(6 + *THIS)
@6
D=A
@THIS
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

//** sub
// pop D
@SP
AM=M-1
D=M
// *(SP-1) = *(SP-1) - D
A=A-1
M=M-D

//** push R11
// D = *R11
@11
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


//** push constant 0
// D=0
@0
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
(LOOP)

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

//** add
// pop D
@SP
AM=M-1
D=M
// *(SP-1) = D + *(SP-1)
A=A-1
M=D+M

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

//** push constant 1
// D=1
@1
D=A
// *SP = D
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

//** pop ARG 0
// R13 = 0 + *ARG
@0
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

//** if LOOP
// pop d
@SP
AM=M-1
D=M
// if D==true then GOTO LOOP
@LOOP
D;JNE

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

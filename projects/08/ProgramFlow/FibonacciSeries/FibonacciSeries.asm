
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

//** pop R4
// pop D
@SP
AM=M-1
D=M
// *R4 = D
@4
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

//** pop THAT 0
// R13 = 0 + *THAT
@0
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

//** push constant 1
// D=1
@1
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop THAT 1
// R13 = 1 + *THAT
@1
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

//** push constant 2
// D=2
@2
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

//** if COMPUTE_ELEMENT
// pop d
@SP
AM=M-1
D=M
// if D==true then GOTO COMPUTE_ELEMENT
@COMPUTE_ELEMENT
D;JNE
@END
0;JMP
(COMPUTE_ELEMENT)

//** push THAT 0
// D = *(0 + *THAT)
@0
D=A
@THAT
A=D+M
D=M
// push D
@SP
AM=M+1
A=A-1
M=D

//** push THAT 1
// D = *(1 + *THAT)
@1
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

//** push R4
// D = *R4
@4
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

//** add
// pop D
@SP
AM=M-1
D=M
// *(SP-1) = D + *(SP-1)
A=A-1
M=D+M

//** pop R4
// pop D
@SP
AM=M-1
D=M
// *R4 = D
@4
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
@LOOP
0;JMP
(END)

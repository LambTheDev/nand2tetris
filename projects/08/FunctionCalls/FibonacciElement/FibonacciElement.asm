
//** bootstrap
// SP = 256
@256
D=A
@SP
M=D
//** call Sys.init
// *SP = D
@SP
AM=M+1
A=A-1
M=D
// push LCL
@LCL
D=M
@SP
AM=M+1
A=A-1
M=D
// push ARG
@ARG
D=M
@SP
AM=M+1
A=A-1
M=D
// push THIS
@THIS
D=M
@SP
AM=M+1
A=A-1
M=D
// push THAT
@THAT
D=M
@SP
AM=M+1
A=A-1
M=D
// ARG = SP - 5
@5
D=A
@SP
D=M-D
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto functionName
@Sys.init
0;JMP

//** function Main.fibonacci
(Main.fibonacci)

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

//** lt
// pop D
@SP
AM=M-1
D=M
// if D > *(SP-1) then *(SP-1)=-1 else *(SP-1)=0
A=A-1
D=D-M
M=-1
@END$lt.0
D;JGT
@SP
A=M-1
M=0
(END$lt.0)

//** if N_LT_2
// pop d
@SP
AM=M-1
D=M
// if D==true then GOTO N_LT_2
@N_LT_2
D;JNE
@N_GE_2
0;JMP
(N_LT_2)

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
(N_GE_2)

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

//** call Main.fibonacci:functionName 6:(5 + nArgs) $retn.0:retAddrLabel
// push retAddrLabel
@$retn.0
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D
// push LCL
@LCL
D=M
@SP
AM=M+1
A=A-1
M=D
// push ARG
@ARG
D=M
@SP
AM=M+1
A=A-1
M=D
// push THIS
@THIS
D=M
@SP
AM=M+1
A=A-1
M=D
// push THAT
@THAT
D=M
@SP
AM=M+1
A=A-1
M=D
// ARG = SP - 5 - nArgs
@6
D=A
@SP
D=M-D
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto functionName
@Main.fibonacci
0;JMP
($retn.0)

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

//** call Main.fibonacci:functionName 6:(5 + nArgs) $retn.1:retAddrLabel
// push retAddrLabel
@$retn.1
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D
// push LCL
@LCL
D=M
@SP
AM=M+1
A=A-1
M=D
// push ARG
@ARG
D=M
@SP
AM=M+1
A=A-1
M=D
// push THIS
@THIS
D=M
@SP
AM=M+1
A=A-1
M=D
// push THAT
@THAT
D=M
@SP
AM=M+1
A=A-1
M=D
// ARG = SP - 5 - nArgs
@6
D=A
@SP
D=M-D
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto functionName
@Main.fibonacci
0;JMP
($retn.1)

//** add
// pop D
@SP
AM=M-1
D=M
// *(SP-1) = D + *(SP-1)
A=A-1
M=D+M

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

//** function Sys.init
(Sys.init)

//** push constant 4
// D=4
@4
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** call Main.fibonacci:functionName 6:(5 + nArgs) $retn.2:retAddrLabel
// push retAddrLabel
@$retn.2
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D
// push LCL
@LCL
D=M
@SP
AM=M+1
A=A-1
M=D
// push ARG
@ARG
D=M
@SP
AM=M+1
A=A-1
M=D
// push THIS
@THIS
D=M
@SP
AM=M+1
A=A-1
M=D
// push THAT
@THAT
D=M
@SP
AM=M+1
A=A-1
M=D
// ARG = SP - 5 - nArgs
@6
D=A
@SP
D=M-D
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto functionName
@Main.fibonacci
0;JMP
($retn.2)
(END)
@END
0;JMP

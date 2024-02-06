
//** function Sys.init
(Sys.init)

//** push constant 4000
// D=4000
@4000
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

//** push constant 5000
// D=5000
@5000
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

//** call Sys.main:functionName 5:(5 + nArgs) $retn.0:retAddrLabel
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
@Sys.main
0;JMP
($retn.0)

//** pop R6
// pop D
@SP
AM=M-1
D=M
// *R6 = D
@6
M=D
(LOOP)
@LOOP
0;JMP

//** function Sys.main
(Sys.main)

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


//** push constant 0
// D=0
@0
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D


//** push constant 4001
// D=4001
@4001
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

//** push constant 5001
// D=5001
@5001
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

//** push constant 200
// D=200
@200
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop LCL 1
// R13 = 1 + *LCL
@1
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

//** push constant 40
// D=40
@40
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop LCL 2
// R13 = 2 + *LCL
@2
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

//** push constant 6
// D=6
@6
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** pop LCL 3
// R13 = 3 + *LCL
@3
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

//** push constant 123
// D=123
@123
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** call Sys.add12:functionName 6:(5 + nArgs) $retn.1:retAddrLabel
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
@Sys.add12
0;JMP
($retn.1)

//** pop R5
// pop D
@SP
AM=M-1
D=M
// *R5 = D
@5
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

//** push LCL 2
// D = *(2 + *LCL)
@2
D=A
@LCL
A=D+M
D=M
// push D
@SP
AM=M+1
A=A-1
M=D

//** push LCL 3
// D = *(3 + *LCL)
@3
D=A
@LCL
A=D+M
D=M
// push D
@SP
AM=M+1
A=A-1
M=D

//** push LCL 4
// D = *(4 + *LCL)
@4
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

//** add
// pop D
@SP
AM=M-1
D=M
// *(SP-1) = D + *(SP-1)
A=A-1
M=D+M

//** add
// pop D
@SP
AM=M-1
D=M
// *(SP-1) = D + *(SP-1)
A=A-1
M=D+M

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

//** function Sys.add12
(Sys.add12)

//** push constant 4002
// D=4002
@4002
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

//** push constant 5002
// D=5002
@5002
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

//** push constant 12
// D=12
@12
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

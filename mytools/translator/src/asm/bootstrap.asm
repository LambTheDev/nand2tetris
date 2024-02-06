
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

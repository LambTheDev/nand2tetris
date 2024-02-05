
//** call {0}:functionName {1}:(5 + nArgs) {2}:retAddrLabel
// push retAddrLabel
@{2}
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
@{1}
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
@{0}
0;JMP
({2})


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

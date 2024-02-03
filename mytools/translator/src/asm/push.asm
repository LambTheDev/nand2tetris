
//** push {0} {1}
// D = *({1} + *{0})
@{1}
D=A
@{0}
A=D+M
D=M
// push D
@SP
AM=M+1
A=A-1
M=D

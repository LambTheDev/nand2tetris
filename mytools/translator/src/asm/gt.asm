
//** gt
// pop D
@SP
AM=M-1
D=M
// if D < *(SP-1) then *(SP-1)=-1 else *(SP-1)=0
A=A-1
D=D-M
M=-1
@END{0}
D;JLT
@SP
A=M-1
M=0
(END{0})

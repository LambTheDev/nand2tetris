
//** push constant 17
// D=17
@17
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 17
// D=17
@17
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** eq
// pop D
@SP
AM=M-1
D=M
// if D==*(SP-1) *(SP-1)=-1 else *(SP-1)=0
A=A-1
D=D-M
M=-1
@END2
D;JEQ
@SP
A=M-1
M=0
(END2)

//** push constant 17
// D=17
@17
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 16
// D=16
@16
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** eq
// pop D
@SP
AM=M-1
D=M
// if D==*(SP-1) *(SP-1)=-1 else *(SP-1)=0
A=A-1
D=D-M
M=-1
@END5
D;JEQ
@SP
A=M-1
M=0
(END5)

//** push constant 16
// D=16
@16
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 17
// D=17
@17
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** eq
// pop D
@SP
AM=M-1
D=M
// if D==*(SP-1) *(SP-1)=-1 else *(SP-1)=0
A=A-1
D=D-M
M=-1
@END8
D;JEQ
@SP
A=M-1
M=0
(END8)

//** push constant 892
// D=892
@892
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 891
// D=891
@891
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
@END11
D;JGT
@SP
A=M-1
M=0
(END11)

//** push constant 891
// D=891
@891
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 892
// D=892
@892
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
@END14
D;JGT
@SP
A=M-1
M=0
(END14)

//** push constant 891
// D=891
@891
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 891
// D=891
@891
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
@END17
D;JGT
@SP
A=M-1
M=0
(END17)

//** push constant 32767
// D=32767
@32767
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 32766
// D=32766
@32766
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** gt
// pop D
@SP
AM=M-1
D=M
// if D < *(SP-1) then *(SP-1)=-1 else *(SP-1)=0
A=A-1
D=D-M
M=-1
@END20
D;JLT
@SP
A=M-1
M=0
(END20)

//** push constant 32766
// D=32766
@32766
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 32767
// D=32767
@32767
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** gt
// pop D
@SP
AM=M-1
D=M
// if D < *(SP-1) then *(SP-1)=-1 else *(SP-1)=0
A=A-1
D=D-M
M=-1
@END23
D;JLT
@SP
A=M-1
M=0
(END23)

//** push constant 32766
// D=32766
@32766
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 32766
// D=32766
@32766
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** gt
// pop D
@SP
AM=M-1
D=M
// if D < *(SP-1) then *(SP-1)=-1 else *(SP-1)=0
A=A-1
D=D-M
M=-1
@END26
D;JLT
@SP
A=M-1
M=0
(END26)

//** push constant 57
// D=57
@57
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 31
// D=31
@31
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** push constant 53
// D=53
@53
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

//** push constant 112
// D=112
@112
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

//** neg
@SP
A=M-1
M=-M

//** and
// pop D
@SP
AM=M-1
D=M
// *(SP-1) = D & *(SP-1)
A=A-1
M=D&M

//** push constant 82
// D=82
@82
D=A
// *SP = D
@SP
AM=M+1
A=A-1
M=D

//** or
// pop D
@SP
AM=M-1
D=M
// *(SP-1) = D | *(SP-1)
A=A-1
M=D|M

//** not
@SP
A=M-1
M=!M

// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// @SCREEN
// @KBD

(START)
    // p = &SCREEN
    @SCREEN
    D=A
    @p
    M=D
(LOOP)
    // if p == &KBD goto START
    @p
    D=M
    @KBD
    D=D-A
    @START
    D;JEQ
    // color = 0
    @color
    M=0
    // if KBD == 0 goto RENDER
    @KBD
    D=M
    @RENDER
    D;JEQ
    // color = -1
    @color
    M=-1
(RENDER)
    // *p = color
    @color
    D=M
    @p
    A=M
    M=D
    // p = p + 1
    @p
    M=M+1
    // goto LOOP
    @LOOP
    0;JMP

// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
    
    @16384
    D=A
    @R0
    M=D

    @24575
    D=A
    @R1
    M=D

    @isitset
    M=0

(KEYLOOP)
    @CHECK

    @24576
    D=M
    @SETANDGO
    D;JNE

(CHECK)
    @isitset
    D=M

    @RESET
    D;JNE
     
    @SETANDGO
    0;JMP

(SETANDGO)
    @isitset
    M=1

    @THING
    0;JMP

(THING)
    //this is pretty for a retard
    @32767
    D=A

    @R0
    A=M

    M=D

    @R0
    M=M+1
    D=M
    @R1
    D=M-D

    @THING
    D;JGT

    @RESETCOUNT
    0;JMP

(RESETCOUNT)
    @16384
    D=A
    @R0
    M=D

    @KEYLOOP
    0;JMP

(RESET)
    @isitset
    M=0

    @CLEAR
    0;JMP

(CLEAR)
    @R0
    A=M
    M=0

    @R0
    M=M+1
    D=M
    @R1
    D=M-D

    @RESETCOUNT
    D;JLE

    @CLEAR
    0;JMP

   
    





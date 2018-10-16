;
;Name:			Noah Johnson
;Course Number: 	ELE 209
;Lab/Problem Number:	Lab 7a (Pt 1)
;Due Date:		4/13/15 
;;; File: lab7a_1.asm
	
	.ORIG x3000
        
ReadString
        LEA     R0, Prompt
        PUTS                    ; Display a prompt requesting input
        LD      R1, InBuffLen   ; Set R1 to length of input buffer
        LEA     R2, InBuffPtr   ; Set R2 to address of input buffer in memory
        BRnzp   ReadCore        ; Goto the core input code

Prompt                          
        .STRINGZ "Enter a number: " ; The prompt string
InBuffLen
        .FILL 10                ; The length of the input buffer
InBuffPtr
        .BLKW 10                ; The memory reserved for the input buffer
NegEnter
	.FILL -13
CapsCheck
	.FILL -97
Capitalize
	.FILL -32
ReadCore
	ADD	R1,R1,#-1
ReadCoreBody
	GETC
	LD	R3, NegEnter
	ADD	R3, R0, R3
	BRz	ProcessInput
	LD	R4, CapsCheck
	ADD	R4, R0, R4
	BRzp	CapsCorrect
	OUT
	STR	R0, R2, #0
	ADD	R2, R2, #1
	ADD	R1, R1, #-1
	BRz	ProcessInput
	BRnzp	ReadCoreBody

CapsCorrect
	LD	R4, Capitalize
	ADD 	R0, R0, R4
	OUT
	STR	R0, R2, #0
	ADD	R2, R2, #1
	ADD	R1, R1, #-1
	BRz	ProcessInput
	BRnzp	ReadCoreBody
	
ProcessInput
        LEA     R2, InBuffPtr   ; Put address of string in R2
        BRnzp   OutputResult    ; Output the result

OutputResult
        LEA     R0, StartOfLineStr 
        PUTS                    ; Output the preceding text before result
        ADD     R0, R2, #0      ; Copy the output buffer to R0
        PUTS                    ; Output the result
        LEA     R0, EndOfLineStr   
        PUTS                    ; Output the a newline after the result
        BRnzp   ReadString      ; Continue reading new numbers indefinitely

StartOfLineStr
        .STRINGZ "Answer: \""     ; The preceding text before result
EndOfLineStr
        .STRINGZ "\"\n"           ; A newline

        .END

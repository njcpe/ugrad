;;; File: lab7b.asm
	.ORIG x3000

ReadString
        LEA     R0, Prompt
        PUTS                    ; Display a prompt requesting input
        LD      R1, BuffLen     ; Set R1 to length of input buffer
        LEA     R2, BuffPtr     ; Set R2 to address of input buffer in memory
        BRnzp   ReadCore        ; Goto the core input code
BuffPtr .BLKW 8                 ; The memory reserved for the input buffer
Prompt  .STRINGZ "Enter a number: " ; The prompt string
BuffLen .FILL 8                 ; The length of the input buffer

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Insert your code for ReadCore from part 1 here.
;;; Hennjer Alcantara 100517056
ReadCore
	ADD R1, R1, #-1		;counter
	LD R4, Terminator	;Loads negative of counter
	LD R6, Minus
Main
	getc			;gets input
	ADD R5,R0,R4		;checks to see if enter key is pressed
	BRz ProcessInput	;If so=uppercase
	ADD R5,R0,R6
	BRn Loop
	ADD R0,R0,#-16
	ADD R0,R0,#-16
Loop
	OUT			;output character
	STR R0,R2,#0		;stores character
	ADD R2,R2,#1		;Increment Counter
	ADD R1,R1,#-1
	BRp Main		;Restarts if not done
	BRz ProcessInput
Terminator
.FILL -13
Minus
.FILL -96
        

;;; Your code from part 1 here ends here.
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ProcessInput
        LEA     R2, BuffPtr     ; Set R2 to address of buffer in memory
        BRnzp   ProcessInputCore
        
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Insert your code for ProcessInputCore from part 2 here.
ProcessInputCore
	LD R3, Negative
	LD R4, Decimal
	NOT R3, R3
	ADD R3, R3, #1
	NOT R4, R4
	ADD R4, R4, #1
	LDR R6, R2, #0	; Load R2 into R6
	AND R1, R1, #0	; Initialize R1
	ADD R5, R6, R3	; Check if first character is -
	BRnp Next	; If not -then branch
	ADD R1, R1, #-1	; Decrement R1
	ADD R2, R2, #1	; increment R2
	LDR R6, R2, #0	; Load the value of R2 into R6
Next
	ADD R5, R6, R4	;Check if character is #
	BRnp Then	;If not, Branch
	ADD R2, R2, #1	;Increment R2
	LDR R6, R2, #0	; Load the value of R2 into R6
	BRnzp ParseDecimal
Then
	BRnzp ParseHex
Negative
	.fill x002D
Decimal
	.fill x0023

;;; Your code from part 2 here ends here.
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        
ParseDecimal
        LD      R5, NegZERO        
        LD      R6, NegNINE        
        AND     R3, R3, #0      ; Set R3 to 0
DecimalLoop
        LDR     R4, R2, #0      ; Put next digit into R4
        BRz     DoneParsingDecimal  ; If it is the null terminator, done parsing

        ;; Confirm that it is a valid digit
        ADD     R0, R4, R5      ; Compare to "0"
        BRn     ParseError      ; If less than "0", not a digit
        ADD     R0, R4, R6      ; Compare to "9"
        BRp     ParseError      ; If greater than "9", not a digit

        ;; Multiply R3 by 10
        ADD     R7, R3, R3      ; R7 = 2*R3
        ADD     R3, R7, R7      ; R3 = 4*R3
        ADD     R3, R3, R3      ; R3 = 8*R3
        ADD     R3, R3, R7      ; R3 = 8*R3 + 2*R3 = 10*R3

        ;; Add new digit to R3
        ADD     R4, R4, R5      ; Make binary
        ADD     R3, R3, R4      ; Add new digit
        ADD     R2, R2, #1      ; Increment memory pointer
        BRnzp   DecimalLoop

DoneParsingDecimal
        ;; Check if we need to negate the result for the minus sign
        ADD     R1, R1, #0       ; If R1 is not -1, skip negation of R3
        BRzp    NotNegativeDecimal 
        NOT     R3, R3
        ADD     R3, R3, #1      ; Negate R3
NotNegativeDecimal
        BRnzp   PrintResult

NegZero .FILL   -48             ; Negative ASCII "0"
NegNine .FILL   -57             ; Negative ASCII "9"
        
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Write your code for part 4 here.
       
ParseHex
        LD R5,NEGA
	LD R6,NegNine
	AND R3,R3,#0
HexLoop
	LDR R4,R2,#0
	BRz DoneHex
	
	ADD R7,R3,R3
	ADD R3,R7,R7
	ADD R3,R3,R3
	ADD R3,R3,R3

	ADD R0,R4,R6
	BRp HEXLETTER
	BRnz DECII
DECII
	LD R5, NegZero
	ADD R4,R4,R5
	LD R5, NEGA
	BRnzp SURE
	
HEXLETTER
	
	ADD R4,R4,R5
SURE
	ADD R3,R3,R4
	ADD R2,R2,#1
	BRnzp HexLoop
	
DoneHex
	ADD R1,R1,#0
	BRzp NNHex
	NOT R3,R3
	ADD R3,R3,#1
NNHex
	BRnzp PrintResult
NEGA
	.FILL -55       
;;; Your code for part 4 here ends here.
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ParseError
        LEA     R0, ErrorStr
        PUTS                    ; Output the error string
        BRnzp   ReadString
ErrorStr
        .STRINGZ "Invalid number format.\n"

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Write your code for part 3 here.
PrintResult
	LEA R2,ARRAY
	ADD R2,R2,#7
	AND R1,R1,#0
	ADD R1,R1,#8
	ADD R1,R1,#8
	LEA R0, ARRAY
	PUTS
LOOP2
	AND R0,R0,#0
	LD R5,Zero
	ADD R3,R3,#0
	BRn Neg 
	ADD R0,R5,R0
	OUT
	BRnzp NEXT2
Neg
	ADD R0,R5,#1
	OUT
NEXT2
	ADD R2,R2,#1
	ADD R3,R3,R3
	ADD R1,R1,#-1
	BRp LOOP2
	BRnzp Readstring
	HALT
ARRAY
	.fill x0041
	.fill x006E
	.fill x0073
	.fill x0077
	.fill x0065
	.fill x0072
	.fill x003A
	.fill x0000 
Zero
	.fill x0030
BRnzp Readstring       


;;; Your code for part 3 here ends here.
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        .END

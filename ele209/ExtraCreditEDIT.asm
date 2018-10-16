;;; 
;;; Nathan Ankomah-Mensah and Hennjer Alcantara
;;; Extra Credit 
;;;
	.ORIG x3000
ReadString
	AND R0,R0,#0		;This line of code will cause the enter key to be pressed for the next user input
	ADD R0,R0,#13
	Out
	
        LEA     R0, Prompt
        PUTS                    ; Display a prompt requesting input
        LD      R1, BuffLen     ; Set R1 to length of input buffer
        LEA     R2, BuffPtr     ; Set R2 to address of input buffer in memory
        BRnzp   ReadCore        ; Goto the core input code


BuffPtr .BLKW 8                 ; The memory reserved for the input buffer
Prompt  .STRINGZ "Enter a Instruction in Hex: " ; The prompt string
BuffLen .FILL 8                 ; The length of the input buffer

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Insert your code for ReadCore from part 1 here.
ReadCore	
	LD R6, Enter1
INPUT	getc

	add R4, R0,R6		;Once character inpputed if 13 jump to Zero
	BRz Zero
	

	
	STR R0, R2, #0
	OUT
	

	
				;Will display the value of r0
	ADD R2,R2,#1		;
	ADD R1,R1,#-1		;CHECK HOW MANY STORED ALREADY in memory
	BRp INPUT
	AND R4,R4,#0		;If too many charcaters are in memory
	STR R4,R2,#0		;
Zero	AND R7,R7,#0		;Clears registry to 0
	STR R7,R2,#0		;If zero store the value in R2
	BRnzp ProcessInput
	

	
	
        
        
Enter1 .fill #-13
        

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
	
	AND R1,R1, #0	  ;Clears register in case a number is already in R1
	LDR R0, R2, #0		;Loads value of R2
	ADD R0,R0,#-15		;Subtracts the ascii value of the minus sign
	ADD R0,R0,#-15
	ADD R0,R0,#-15
	
	BRnp deci
			;This makes a case for the negative numbers
	ADD R1,R1, #-1
	ADD R2,R2,#1
	
deci	Ldr r0,r2,#0
	add R2,r2,#1
	Ld r4, decimal
	ADD R0,r0, R4
	BRz ParseDecimal	
	
ifx     Add R2,R2,#-1		;At this point we check if the number is hex
	LDR R0,R2,#0		;Load the ascii value for x and add to check if		
	LD  R3, x		;It is hex jump to parsehex
	ADD R0,R0,R3 		;If it is is x point to next address
	
	BRnp ParseHex	;If it is x go to parsehex
	ADD R2,R2,#1	;If not x go to next character
	BRnzp ParseHex

	
minus	.fill #-45
x	.fill #-120
decimal	.fill #-35
Enters .fill #-13	


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


	;; My code only works for uppercase Hex Values
ParseHex
	AND R4,R4,#0
	LD R4,eight
	AND R7,R7,#0
	
	AND R3,R3,#0
	
nexthex LD R7,four
	AND R0,R0,#0
	LDR r0,r2,#0
	Brz Checkneg
	And R5,R5,#0
	Add R5,R5,#5		;sets counter for shifts
	ADD R4,R4,#-1		;counter for characters and shift
	BRn Checkneg		;this will ensure only 4 characters are taken
	AND R6,R6,#0
	LD R6,if0
	
	add r0,r0,R6		;CHECKING IF NUMBERS 0-9 ARE INPUTED
	brz ADD0		;IF LESS THAN 3 CHARACTERS INPUTTED
	add r0,r0,#-1		;FILL REST WITH 0
	brz ADD1
	add r0,r0,#-1
	brz ADD2
	add r0,r0,#-1
	brz ADD3
	add r0,r0,#-1
	brz ADD4
	add r0,r0,#-1
	brz ADD5
	add r0,r0,#-1
	brz ADD6
	add r0,r0,#-1
	brz ADD7
	add r0,r0,#-1
	brz ADD8
	add r0,r0,#-1
	brz ADD9		;End checking numbers 1-9
	Brn ParseError		;If the number is negative then it is not 0-9
	AND R6,R6,#0
	LD  R6,ifa
	ADD R0,R0,R6		;NOW CHECKING IF VALUES ARE A-F
	BRz ADDa
	Brn ParseError		;If the number is negative then it is not A-F
	add r0,r0,#-1
	brz ADDb
	add r0,r0,#-1
	brz ADDc
	add r0,r0,#-1
	brz ADDd
	add r0,r0,#-1
	brz ADDe
	add r0,r0,#-1
	brz ADDf
	BRp ParseError		;if the character is postive still we know it is not A-F

ADD0			;this segment of code stores the value of 0  
				;in R7 and shifts the value 4 times
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shift0	ADD R3,R3,R3		;shifts numbers 4  places to the left		
	ADD R7,R7,#-1		;;this section of code will display the value of
	BRp Shift0
	ADD R3,R3,#0
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADD1			;this segment of code stores the value of 1  
			;in R7 and shifts the value 4 times
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shift1	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shift1
	ADD R3,R3,#1
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADD2			;this segment of code stores the value of 2
				;in R7 and shifts the value 4 times
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shift2	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shift2
	ADD R3,R3,#2
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADD3			;this segment of code stores the value of 3
	ADD R0,R0,#3		;in R7 and shifts the value 4 times
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shift3	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shift3
	ADD R3,R3,#3
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADD4			;this segment of code stores the value of 4
	ADD R0,R0,#4		;in R7 and shifts the value 4 times
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shift4	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shift4
	ADD R3,R3,#4
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADD5			;this segment of code stores the value of 5
	ADD R0,R0,#5		;in R7 and shifts the value 4 times
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shift5	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shift5
	ADD R3,R3,#5
	ADD R2,R2,#1			
	BRnzp nexthex
Checkneg And R1,R1,R1		;sets condition codes
	BRz Evaluate		;this segment of code checks if 
	Not R3,R3		;the first character is negative
	ADD R3,R3,#1		;if it is then flip bits and add 1
	BRnzp Evaluate	
ADD6			;this segment of code stores the value of 6
	ADD R0,R0,#6		;in R7 and shifts the value 4 times
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shift6	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shift6
	ADD R3,R3,#6
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADD7			;this segment of code stores the value of 7
	ADD R0,R0,#7		;in R7 and shifts the value 4 times
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shift7	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shift7
	ADD R3,R3,#7
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADD8			;this segment of code stores the value of 8
			;in R7 and shifts the value 4 times
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shift8	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shift8
	ADD R3,R3,#8
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADD9			;this segment of code stores the value of 9
			;in R7 and shifts the value 4 times
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shift9	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shift9
	ADD R3,R3,#9
	ADD R2,R2,#1			
	BRnzp nexthex	
	
ADDa			;this segment of code stores the value of a
			;in R7 and shifts the value 4 times
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shifta	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shifta
	ADD R3,R3,#10
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADDb			;this segment of code stores the value of b
			;in R7 and shifts the value 4 places left
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shiftb	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shiftb
	ADD R3,R3,#11
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADDc			;this segment of code stores the value of c
			;in R7 and shifts the value 4 places left
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shiftc	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shiftc
	ADD R3,R3,#12
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADDd			;this segment of code stores the value of d
			;in R7 and shifts the value 4 places left
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shiftd	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shiftd
	ADD R3,R3,#13
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADDe				;this segment of code stores the value of e
				;in R7 and shifts the value 4 places left
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shifte	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shifte
	ADD R3,R3,#14
	ADD R2,R2,#1			
	BRnzp nexthex
	
ADDf				;this segment of code stores the value of f
				;in R7 and shifts the value 4 places left
	ADD R4,R4,#-1		; only 3 times because a 4th shift will shift
	BRn Checkneg		;the first character and output a wrong value
shiftf	ADD R3,R3,R3		;shifts numbers 4  places to the left
	ADD R7,R7,#-1		;this section of code will display the value of
	Brp shiftf
	ADD R3,R3,#15
	ADD R2,R2,#1			
	BRnzp nexthex
	BRnzp   Evaluate

dispanswer  .STRINGZ "Answer:"	
if0	.fill #-48
zero1	.fill x30
ifa	.fill #-8	
eight	.fill #8	
four	.fill #4        
	
        
;;; Your code for part 4 here ends here.
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ParseError
        LEA     R0, ErrorStr
        PUTS                    ; Output the error string
        AND R6,R6,#0
	LD R6,ReadStrPtr	;readstring too far away
	JMP R6
ErrorStr
        .STRINGZ "Invalid number format.\n"

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Write your code for part 3 here.	
	PrintResult
	AND R2,R2,#0
	AND R0,R0,#0		;This line of code will cause the enter key to be pressed for the next user input
	ADD R0,R0,#13
	Out
	AND R0,R0,#0
	Lea R0, Answer
	PUTS
	AND R4,R4,#0
	LD R4,Counter		;R4 is our counter
	LD R5, notone		;
	LD R1, One
	And R6,R6,#0
	AND R7,R7,#0
	LD R7,Enter		; enter key checker
Next	AND R3,R3,R3		;shifts numbers to places to the left
	
	BRzp Output		;if the value is positive branch to output so 0 because we know the value is 0
	And r0,r0,#0		;can be displayed for the number
	Add r0,r0,R1		;otherwise continue to next instruction so that1 will be displayed
	Out
	add r3,r3,r3	

	Add R4,R4, #-1
	Brp Next
 	BRnzp showAnswer	;This ensures 0 is not added after the counter is done
Output	And r0,r0,#0		;and that 
	Add r0,r0,R5
	
	Add R3,r3,r3		;this line of code will display
	Out			; 0 then shift for the next value
	

	Add R4,R4, #-1		;this will be done with a 16 counter
	BRp Next		;because we need 16 bits displayed
	
showAnswer AND R0,R0,#0		;This line of code will cause the enter key to be pressed for the next user input
	ADD R0,R0,#13
	Out
	
	ST R6, Opcode	

	AND R6,R6,#0
	LD R6,ReadStrPtr	;Readstring too far away
	JMP R6

	
Enter   .fill #-13	
notone	.fill #48
One	.fill #49
Counter .fill #16
Answer  .STRINGZ "Answer:"
ReadstrPtr	.fill x3000	
end
qAcsii	.fill x-71
halt4	HALT
	Evaluate
	LD R0,Hex
	AND R7,R7,#0
	AND R5,R5,#0
	AND r2,r2,#0
	ST R3, R3value		
	LD R2, R3value		;stores value of R3 in R2
	LD R4,R3value
	
	
	AND R4,R4,R0		;R4 contains opcode
	Brz dispBranch		;checks for branch CHECK
	
	LD R6,itsADD		;twos complements of add into r6
	ADD R7,R4,r6		;adds input to r6 to see if zero
	BRz dispADD		;if zero, then go to add
	
	AND r6,r6,#0
	LD r6,itsAND
	AND R7,R7,#0
	ADD R7,R4,r6
	Brz dispAND
	BRnp ParseError
	
dispBranch
	LEA R0, Branch
	PUTS
	LD R6,clearvalues
	AND R7,R3,R6
	AND R6,R6,#0

	LD R6, negative
	AND R5,R5,#0
	ADD R5,R7,R6 ;R7 has the input
	BRz BRnegative
	
	AND R5, R5,#0
	AND R6, R6,#0
	LD R6, zeroo
	ADD R5,R7,R6; checks to see if zero 
	BRz BRzero
	
	AND R5, R5,#0
	AND R6, R6,#0
	LD R6,positive
	ADD R5,R7,R6
	BRz BRpositive
	
	AND R5, R5,#0
	AND R6, R6,#0
	LD R6, allnzp
	ADD R5,R7,R6
	BRz BRnzpFunction
	
	AND R5, R5,#0
	AND R6, R6,#0
	LD R6, zp
	ADD R5,R7,R6
	BRz BRzpFunction
	
	AND R5, R5,#0
	AND R6, R6,#0
	LD R6, np
	ADD R5,R7,R6
	BRz BRnpFunction
	
	HALT

	

	clearvalues .fill x0e00
	negative .fill #-2048 ;check
	zeroo 	 .fill #-1024 ;check
	positive  .fill #-512  ;check
	allnzp   .fill #-3584 ;check
	zp	 .fill #-1536 ;check
	np	 .fill #-2560 ;check
	
finishBranch	
	AND R0, R0,#0 ;clear r1
	LD  R0,numbersign
	OUT
	AND R0,R0,#0
	
	ADD R0,R3,R0  ;puts orginal input into r1
	AND R2,R2,#0
	LD  R2,Pcoffset9
	AND R0,R0,R2
	LD R5,display
	ADD R0,R0,R5
	OUT
	AND R6,R6,#0
	LD R6,ReadStrPtr2	;Readstring too far away
	JMP R6
	HALT
Pcoffset9 .fill x01ff
display   .fill x30
numbersign.fill x23


BRnegative
	LEA R0,n
	PUTS
	BRnzp finishBranch
	
BRzero
	LEA R0,z
	PUTS
	BRnzp finishBranch
BRpositive
	LEA R0,p
	PUTS
	BRnzp finishBranch
BRnzpFunction
	LEA R0,n
	PUTS
	AND R0,R0,#0
	LEA R0,p
	PUTS
	AND R0,R0,#0
	LEA R0,z
	PUTS
	BRnzp finishBranch
BRnpFunction
	LEA R0,n
	PUTS
	AND R0,R0,#0
	LEA R0,p
	PUTS
	BRnzp finishBranch
BRzpFunction
	LEA R0,z
	PUTS
	AND R0,R0,#0
	LEA R0,p
	PUTS
	BRnzp finishBranch
Nextreg	AND R2,R2,#0
	ADD R2,R2,R3
	ADD R2,R2,R2
	ADD R2,R2,R2
	ADD R2,R2,R2
	Brnzp Startreg
checkimm And r2,r2,#0
	Add r2,r2,r3
	LD R1,imm
	AND R2,R2,R1
	Brz Source
	And r2,r2,#0
	Add r2,r2,r3
	LD R1,ones
	AND R2,R2,R1
	AND R5,R5,#0
	LD R5,display
	AND R0,R0,#0
	ADD R0,R2,R5
	OUT
	AND R6,R6,#0
	LD R6,ReadStrPtr2	;Readstring too far away
	JMP R6
	HALT

seven   .fill x0007
dispADD	LEA R0, ADDS
	PUTS
AND1	AND R1,R1,#0
	ADD R1,R1,#3
StartReg	LD R6,isolate
	ADD R1,R1,#-1
	BRz checkimm
	AND R2,R2,R6
	BRz DispR0
	AND R5,R5,#0
	LD R5,ifR1
	ADD R6,R2,R5
	BRz DispR1
	LD R5,ifR2
	ADD R6,R2,R5
	BRz DispR2
	LD R5,ifR3
	ADD R6,R2,R5
	BRz DispR3
	LD R5,ifR4
	ADD R6,R2,R5
	BRz DispR4
	LD R5,ifR5
	ADD R6,R2,R5
	BRz DispR5
	LD R5,ifR6
	ADD R6,R2,R5
	BRz DispR6
	LD R5,ifR7
	ADD R6,R2,R5
	BRz DispR7
dispR1	LEA R0,R1z
	PUTS
	BRnzp nextReg
dispR2	LEA R0,R2z
	PUTS
	BRnzp nextReg
dispR3	LEA R0,R3z
	PUTS
	BRnzp nextReg
dispR4	LEA R0,R4z
	PUTS
	BRnzp nextReg	
dispR5	LEA R0,R5z
	PUTS
	BRnzp nextReg
dispR6	LEA R0,R6z
	PUTS
	BRnzp nextReg
dispR7	LEA R0,R7z
	PUTS
	BRnzp nextReg
	
halts	HALT

isolate .fill x0E00
dispR0	LEA R0,R0z
	PUTS
	BRnzp nextReg
	
dispAND	LEA R0, ANDS
	PUTS
	Brnzp AND1
 	HALT
ReadstrPtr2	.fill x3000	
ones	.fill x001F	
imm	.fill x0020
Opcode	.blkw 1
Shift12	.fill #12
Hex	.fill xf000
ifR1	.fill x-0200
ifR2	.fill x-0400
ifR3	.fill x-0600
ifR4	.fill x-0800
ifR5	.fill x-0a00
ifR6	.fill x-0c00
ifR7	.fill x-0e00	
R3value	.blkw 1	
itsADD	.fill #-4096
itsAND	.fill x-5000
R0z	.stringz "R0 "
R1z	.stringz "R1 "
R2z	.stringz "R2 "
R3z	.stringz "R3 "
R4z	.stringz "R4 "
R5z	.stringz "R5 "
R6z	.stringz "R6 "	
R7z	.stringz "R7 "
Branch	.stringz "\n BR "
n	.stringz "n "
z	.stringz "z "
p	.stringz "p "
ADDS	.stringz "\n ADD "
ANDS	.stringz "\n AND "


Source	And r2,r2,#0
	Add r2,r2,r3
	LD  r4,seven
	AND R7,R7,#0
	ADD R7,R7,#9
	AND R2,R2,R4
				;r2 has the source 2
again13	ADD R2,R2,R2
	ADD R7,R7,#-1
	Brp again13
	AND R6,R6,#0
	LD R6,isolate
	AND R2,R2,R6	
	BRz DispR0z
	AND R5,R5,#0
	LD R5,ifR1
	ADD R6,R2,R5
	BRz DispR1z
	LD R5,ifR2
	ADD R6,R2,R5
	BRz DispR2z
	LD R5,ifR3
	ADD R6,R2,R5
	BRz DispR3z
	LD R5,ifR4
	ADD R6,R2,R5
	BRz DispR4z
	LD R5,ifR5
	ADD R6,R2,R5
	BRz DispR5z
	LD R5,ifR6
	ADD R6,R2,R5
	BRz DispR6z
	LD R5,ifR7
	ADD R6,R2,R5
	BRz DispR7z
dispR1z	LEA R0,R1z
	PUTS
	BRnzp halt3
dispR2z	LEA R0,R2z
	PUTS
	BRnzp halt3
dispR3z	LEA R0,R3z
	PUTS
	BRnzp halt3
dispR4z	LEA R0,R4z
	PUTS
	BRnzp halt3	
dispR5z	LEA R0,R5z
	PUTS
	BRnzp halt3
dispR6z	LEA R0,R6z
	PUTS
	BRnzp halt3
dispR7z	LEA R0,R7z
	PUTS
	BRnzp halt3
	
	HALT

dispR0z	LEA R0,R0z
	PUTS
	
halt3	AND R6,R6,#0
	LD R6,ReadStrPtr2	;Readstring too far away
	JMP R6

	
	HALT		      ;
;;; Your code for part 3 here ends here.
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        .END

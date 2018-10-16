.define tascii	0x0903	;text video ASCII code
.define cursor	0x0904	;ASCII for text cursor
.define prompt	0x0905	;prompt length for BS left limit
.define tnum	0x0906	;text video number to be printed
.define format	0x0907	;number output format
.define gx	0x0908	;graphic video X (0 - 799)
.define gy	0x0909	;graphic video Y (0 - 479)
.define gaddr	0x090A	;graphic video address
.define color	0x090B	;color for graphic
.define x1	0x090C	;x1 for line/circle
.define y1	0x090D	;y1
.define x2	0x090E	;x2 for line
.define y2	0x090F	;y2
.define rad	0x0910	;radius for circle
.define string	0x0911	;pointer to string
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			
.define matrix_C 0x0800	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ACC:	sys	clear		;clear text video
	sys	clearg		;clear graphics video
	ldi	r0, 0
	stm	format, r0	;force decimal output
	stm	tx, r0		;force (TX, TY) to (0, 0)
	stm	ty, r0
	stm	time0, r0	;start timer0
	and r7, zero
	ldi	r1, 100
	ldi r6, 8

DRAW1:	
	ldi	r0, 200
	add	r1, r1
	ldi	r2, 0xC0
	stm	color, r2	;set color
	stm	x1, r0		;x1 = 200
	stm	y1, r0		;y1 = 200; midpoint at (200,200)
	stm	rad, r1		;rad = 150
	sys	circle		;call system function circle


	ldm	r0, time0
	ldi	r3, 0x0D	;ASCII CR
	stm	tascii, r3
	sys	putchar
	stm	tnum, r0
	sys	printn
	ldi	r0, 0x0B	;'mu'
	stm	tascii, r0
	sys	putchar
	ldi	r0, S		;'S'
	stm	tascii, r0
	sys	putchar

DRAW2:	
	ldi	r0, 300
	ldi	r1, r1
	ldi	r2, 0xC0
	stm	color, r2	;set color
	stm	x1, r0		;x1 = 200
	stm	y1, r0		;y1 = 200; midpoint at (200,200)
	stm	rad, r1		;rad = 150
	sys	circle		;call system function circle


	ldm	r0, time0
	ldi	r4, 0x0D	;ASCII CR
	stm	tascii, r4
	sys	putchar
	stm	tnum, r0
	sys	printn
	ldi	r0, 0x0B	;'mu'
	stm	tascii, r0
	sys	putchar
	ldi	r0, S		;'S'
	stm	tascii, r0
	sys	putchar


Test: 
	addi r7 1 
	cmp r7 r8
	jz stop
	cmp r3 r4
	jz  True:
	jnz False: 
	
True: 
msg:
	byte	0x00		;ASCII space	
    byte	T		;define string= "True" 
	byte	R
	byte	U
	byte	E
	byte	0x00		;ASCII space
	stop1:	jmp	Draw1

False:
	byte	0x00		;ASCII space
	byte	F		;define string= "True" 
	byte	A
	byte	L
	byte	S
	byte	E
	stop2: 	jump Draw1
	byte	0x00		;ASCII space
	stop:	jmp	stop
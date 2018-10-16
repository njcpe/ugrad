.arch rhody		;use rhody.cfg
.outfmt hex		;output format is hex
.memsize 2048		;specify 2K words
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Memory addresses for Rhody System I/O devices
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define kcntrl	0xf0000	;keyboard control register
.define kascii	0xf0001	;keyboard ASCII code
.define vcntrl	0xf0002	;video control register
.define time0	0xf0003	;Timer 0
.define time1	0xf0004	;Timer 1
.define inport 	0xf0005	;GPIO read address
.define outport	0xf0005	;GPIO write address
.define rand	0xf0006	;random number
.define msx	0xf0007	;mouse X
.define msy	0xf0008	;mouse Y
.define msrb	0xf0009	;mouse right button
.define mslb	0xf000A	;mouse left button
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Define part to be included in user's program
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define tx	0x0900	;text video X (0 - 79)
.define ty	0x0901	;text video Y (0 - 59)
.define taddr	0x0902	;text video address
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
dPt:	jmp	rdy

rdy:	ldm	r0, Trdy
	cmpi	r0, 1
	jnz	rdy
	ldi	r3, 1

drTch:	ldm	r0, Tcnt
	sys	clearG
	sys	dump
	ldm	r1, Tcnt
	cmp	r0, r1
	jnz	drTch

drawWr:	ldi	r4, 0xF0013
lpPush:	cmpi	r0, 0
	jz	drawT
	ldr	r5, r4
	addi	r4, 10
	ldr	r6, r4
	push	r5
	push 	r6
	addi	r4, 9
	sub	r0, r3
	jmp	lpPush

drawT:	ldm	r0, Tcnt
lpPop:	cmpi	r0, 0
	jnz	drTch
	pop	r2
	pop	r1
	stm	x1, r1
	stm	y1, r2
	ldi	r7, 100
	stm	rad, r7
	stm	color, r7
	sys	circle
	sub	r0, r3
	jmp	lpPop
	
stop:	jmp	stop


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
ACC:	sys	clear		;clear text video
	sys	clearg		;clear graphics video
	ldi	r7, 0
	stm	format, r0	;force decimal output
	stm	tx, r0		;force (TX, TY) to (0, 0)
	stm	ty, r0
	
	
	ldi	r0, 200
	ldi 	r1, 200
	ldi	r2, 100
	stm	x1, r0		;x1 = 200
	stm	y1, r3		;y1 = 200; midpoint at (200,200)
	stm	rad, r1		;rad = 150	
ColorTst:
	stm	time0, r7	;start timer0
	ldi	r6, 4
	stm	color, r6	;set color
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

	stm	time0, r7	;start timer0
	ldi	r6, 10
	stm	color, r6	;set color
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
	
	stm	time0, r7	;start timer0
	ldi	r6, 30
	stm	color, r6	;set color
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
	sys	getchar

	sys	clear
	sys	clearg
	ldi	r0, 100
	ldi 	r1, 100
	ldi	r3, 30 
	stm	x1, r0		;x1 = 100
	stm	y1, r0		;y1 = 100; midpoint at (100,100)
	stm	rad, r1		;rad = 100	
	stm	color, r3	;set color
MPTst:
	stm	time0, r7	;start timer0
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

	stm	time0, r7	;start timer0
	ldi	r0, 110	
	stm	x1, r0		;x1 = 200
	stm	y1, r0		;y1 = 200; midpoint at (200,200)
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
	
	stm	time0, r7	;start timer0
	ldi	r0, 120	
	stm	x1, r0		;x1 = 300
	stm	y1, r0		;y1 = 300; midpoint at (300,300)
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
	sys	getchar
	
	sys	clear
	sys	clearg
	ldi	r0, 400
	ldi 	r1, 240
	ldi 	r2, 200
	ldi	r3, 30 
	stm	x1, r1		
	stm	y1, r0		
	stm	rad, r2		
	stm	color, r3	
RadTst:
	stm	time0, r7	;start timer0
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

	ldi 	r2, 400
	stm	rad, r2		
	stm	time0, r7	;start timer0
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
	
	ldi 	r2, 800
	stm	rad, r2		
	stm	time0, r7	;start timer0
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
	sys	getchar
	
stop:	jmp 	stop

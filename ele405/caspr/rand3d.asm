.arch rhody		;use rhody.cfg
.outfmt hex		;output format is hex
.memsize 2048		;specify 2K words
;I/O Address;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
.define trdy	0xf0010	;touch ready
.define tcnt	0xf0011	;touch count
.define gesture	0xf0012	;touch gesture
.define tx1	0xf0013	;touch X1
.define ty1	0xf0014	;touch Y1
.define tx2	0xf0015	;touch X2
.define ty2	0xf0016	;touch Y2
.define tx3	0xf0017	;touch X3
.define ty3	0xf0018	;touch Y3
.define tx4	0xf0019	;touch X4
.define ty4	0xf001A	;touch Y4
.define tx5	0xf001B	;touch X5
.define ty5	0xf001C	;touch Y5
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
.define	string	0x0911	;string pointer
;Program variables;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define	x3d1	0x0800	;for 3d line subroutine
.define y3d1	0x0801
.define	z3d1	0x0802
.define	x3d2	0x0803
.define	y3d2	0x0804
.define	z3d2	0x0805	
.define PRNG	0x0806	;LFSR random number
.define b3dx	0x0807	;base X for 3d plots
.define pmt	0x080D	;ASCII for prompt
.define tmpx	0x080E	;variable to hold TX
.define tmpc	0x080F	;variable to hold cursor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define m512	0x0810	;16 words M 0x810-0x81F
.define buffer	0x0820	;64 words W 0x820-0x85F
.define lend	0x0860	;end of line screen address
.define wva	0x0861	;working variable a
.define wvb	0x0862	;working variable b
.define wvc	0x0863	;working variable c
.define wvd	0x0864	;working variable d
.define wve	0x0865	;working variable e
.define wvf	0x0866	;working variable f
.define wvg	0x0867	;working variable g
.define wvh	0x0868	;working variable h
.define h0	0x0869	;hash value 0
.define h1	0x086A	;hash value 1
.define h2	0x086B	;hash value 2
.define h3	0x086C	;hash value 3
.define h4	0x086D	;hash value 4
.define h5	0x086E	;hash value 5
.define h6	0x086F	;hash value 6
.define h7	0x0870	;hash value 7
.define t1	0x0871	;temporary value 1
.define t2	0x0872	;temporary value 2
;Program constants;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define vmode	4	;text only video mode
.define gmode	6	;graphic only mode
.define svmode	7	;text XOR graphic video mode
.define up	0x10	;gesture up
.define left	0x14	;gesture left
.define down	0x18	;gesture down
.define right	0x1C	;gesture right
.define zin	0x48	;gesture zoom in
.define zout	0x49	;gesture zoom out
.define hmin	518	;frame corners
.define hmax	778
.define vmin	182
.define vmax	442
.define basey	440	;screen Y of (0,0)
.define hmin2	208	;frame corners #2
.define hmax2	468
.define b3dx1	400	;screen X of (0,0,0)
.define b3dy	440	;screen Y of (0,0,0)
.define fmin	0	;0 for frame min
.define fmax	199	;200 for frame max
.define white	0xFF	;white color
.define gray	0x92	;gray color
.define seed	0xABC	;LFSR seed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
init:	ldi	r0, svmode	;system video mode
	stm	vcntrl, r0	;video=text XOR graphic
	ldi	r0, 0
	stm	format, r0	;format=Decimal
	ldi	r0, 0x7F
	stm	cursor, r0	;cursor=0x7F
	ldi	r0, 0x3E
	stm	pmt, r0		;initial prompt='>'
	sys	clear		;clear text video
	sys	clearg		;clear graphic screen
	ldi	r1, 0		;initial screen position	
	stm	tx, r1		;TX=0
	stm	ty, r1		;TY=0
	ldi	r1, 7
	stm	prompt, r1	;prompt length=7
top:	ldi	r0, name	;r0 = *name
	stm	string, r0
	sys	prints
	ldm	r0, pmt		;
	stm	tascii, r0	;print pmt
	sys	putchar
	ldi	r0, 0x20
	stm	tascii, r0	;print space
	sys	putchar		;prompt is "> "
	sys	textp		;get next text video pointer
	ldm	r2, taddr
	ldm	r0, cursor	;put cursor on screen
	str	r2, r0		;do not use sys putchar
kbd:	sys	getln		;input a line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Strings and lookup table definitions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
name:	byte	R		;string name="Rhody"
	byte	0x68		;'h'
	byte	0x6F		;'o'
	byte	0x64		;'d'
	byte	0x79		;'y'
	byte	0x00		;null character to terminate string
quit:	byte	Q		;string "QUIT" for calculator
	byte	U
	byte	I
	byte	T
	byte	0x00
error:				;string "ERROR" for calculator
	byte	E
	byte	R
	byte	R
	byte	O
	byte	R
	byte	0x00
cmd1:	byte	P		;cmd1=PROMPT
	byte	R
	byte	O
	byte	M
	byte	P
	byte	T
	byte	0x00
cmd2:	byte	C		;cmd2=CURSOR
	byte	U
	byte	R
	byte	S
	byte	O
	byte	R
	byte	0x00
cmd3:	byte	H		;cmd3=HOME
	byte	O
	byte	M
	byte	E
	byte	0x00
cmd4:	byte	C		;cmd4=CLEAR
	byte	L
	byte	E
	byte	A
	byte	R
	byte	0x00
cmd5:	byte	C		;cmd5=COLOR
	byte	O
	byte	L
	byte	O
	byte	R
	byte	0x00
cmd6:	byte	L		;cmd6=LINE
	byte	I
	byte	N
	byte	E
	byte	0x00
cmd7:	byte	R		;cmd7=RECT
	byte	E
	byte	C
	byte	T
	byte	0x00
cmd8:	byte	S		;cmd8=SRECT
	byte	R
	byte	E
	byte	C
	byte	T
	byte	0x00
cmd9:	byte	C		;cmd9=CIRCLE
	byte	I
	byte	R
	byte	C
	byte	L
	byte	E
	byte	0x00
cmdA:	byte	S		;cmdA=SCIRCLE
	byte	C
	byte	I
	byte	R
	byte	C
	byte	L
	byte	E
	byte	0x00
cmdB:	byte	C		;cmdB=CALCULATOR
	byte	A
	byte	L
	byte	C
	byte	U
	byte	L
	byte	A
	byte	T
	byte	O
	byte	R
	byte	0x00
cmdC:	byte	H		;cmdC=HASH
	byte	A
	byte	S
	byte	H
	byte	0x00
cmdD:	byte	R		;cmdD=RAND2D
	byte	A
	byte	N
	byte	D
	byte	0x32
	byte	D
	byte	0x00
cmdE:	byte	R		;cmdE=RAND3D
	byte	A
	byte	N
	byte	D
	byte	0x33
	byte	D
	byte	0x00
cmdF:	byte	P		;cmdF=PAINT
	byte	A
	byte	I
	byte	N
	byte	T
	byte	0x00
cmd:	word	cmd1		;address of cmd1
	word	cmd2		;address of cmd2
	word	cmd3		;address of cmd3
	word	cmd4		;address of cmd4
	word	cmd5		;address of cmd5
	word	cmd6		;address of cmd6
	word	cmd7		;address of cmd7
	word	cmd8		;address of cmd8
	word	cmd9		;address of cmd9
	word	cmdA		;address of cmdA
	word	cmdB		;address of cmdB
	word	cmdC		;address of cmdC
	word	cmdD		;address of cmdD
	word	cmdE		;address of cmdE
	word	cmdF		;address of cmdF
	byte	0x00		;null character to terminate table
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
exE:	sys	clearg		;clear graphic screen
	sys	dump
	sys	getchar	
	ldi	r0, white
	stm	color, r0	;white frame
	ldi	r7, 2
frame1:	ldi	r0, fmin
	stm	x3d1, r0
	stm	y3d1, r0
	stm	z3d1, r0
	stm	y3d2, r0
	stm	z3d2, r0
	ldi	r0, fmax
	stm	x3d2, r0
	call	line3d		;(0,0,0) to (1,0,0)
	ldi	r0, fmin
	stm	x3d2, r0
	ldi	r0, fmax
	stm	y3d2, r0
	call	line3d		;(0,0,0) to (0,1,0)
	ldi	r0, fmax
	stm	x3d1, r0	
	stm	y3d1, r0
	ldi	r0, gray
	stm	color, r0
	call	line3d		;(0,1,0) to (1,1,0)
	ldi	r0, fmin
	stm	x3d1, r0
	ldi	r0, fmax
	stm	z3d1, r0
	ldi	r0, white
	stm	color, r0
	call	line3d		;(0,1,0) to (0,1,1)
	ldi	r0, fmax
	stm	x3d2, r0
	stm	z3d2, r0
	call	line3d		;(0,1,1) to (1,1,1)
	ldi	r0, fmin
	stm	z3d1, r0
	ldi	r0, fmax
	stm	x3d1, r0
	ldi	r0, gray
	stm	color, r0
	call	line3d		;(1,1,1) to (1,1,0)
	ldi	r0, fmin
	stm	y3d2, r0
	stm	z3d2, r0
	call	line3d		;(1,1,0) to (1,0,0)
	ldi	r0, fmax
	stm	z3d1, r0
	ldi	r0, fmin
	stm	y3d1, r0
	ldi	r0, white
	stm	color, r0
	call	line3d		;(1,0,0) to (1,0,1)
	ldi	r0, fmax
	stm	y3d2, r0
	stm	z3d2, r0
	call	line3d		;(1,0,1) to (1,1,1)

	adi	r7, 0xFFFF
	jz	plotw
	ldi	r0, b3dx1
	stm	b3dx, r0	;base X 1
	jmp	frame1

plotw:	ldi	r0, 31
	stm	color, r0
	ldi	r7, 30000

	ldi	r0, 0
	stm	time0, r0	;start timer0

loopw:	ldi	r2, 0xFF	;8-bit mask
	ldi	r3, 200		;scale factor
	ldm	r1, rand
	and	r1, r2		;last 8-bit only
	mul	r1, r3		;scale
	ror	r1, 8
	and	r1, r2
	stm	x3d1, r1
	ldm	r1, rand
	and	r1, r2		;last 8-bit only
	mul	r1, r3		;scale
	ror	r1, 8
	and	r1, r2
	stm	y3d1, r1
	ldm	r1, rand
	and	r1, r2		;last 8-bit only
	mul	r1, r3		;scale
	ror	r1, 8
	and	r1, r2
	stm	z3d1, r1
	call	pixel3d
	adi	r7, 0xFFFF
	jnz	loopw

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
	ldi	r0, 0x20
	stm 	tascii, r0
	sys	putchar

	jmp	done
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
line3d:
	ldm	r0, b3dx
	ldm	r1, x3d1
	ldm	r2, y3d1
	ldm	r3, z3d1
	pdx	r1, r2, r0	
	;add	r0, r1
	;sub	r0, r2		;bx = b3dx + ax - ay
	stm	x1, r1
	ldi	r0, b3dy
	;sub	r0, r3
	;add	r1, r2
	;ldi	r2, 0xFFFE
	;and 	r1, r2
	;ror	r1, 1		
	;sub	r0, r1		;by = b3dy - az - 1/2 (ax + ay)
	pdy	r1, r2, r3, r0	
	stm	y1, r1
	ldm	r0, b3dx
	ldm	r1, x3d2
	ldm	r2, y3d2
	ldm	r3, z3d2
	;add	r0, r1
	;sub	r0, r2		;bx = b3dx + ax - ay
	pdx	r1, 	
	stm	x2, r0
	ldi	r0, b3dy
	;sub	r0, r3
	;add	r1, r2
	;ldi	r2, 0xFFFE
	;and 	r1, r2
	;ror	r1, 1		
	;sub	r0, r1		;by = b3dy - az - 1/2 (ax + ay)
	stm	y2, r0
	sys	line
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
pixel3d:
	ldm	r0, b3dx
	ldm	r1, x3d1
	ldm	r2, y3d1
	ldm	r3, z3d1
	add	r0, r1
	sub	r0, r2		;bx = b3dx + ax - ay
	stm	gx, r0
	ldi	r0, b3dy
	sub	r0, r3
	add	r1, r2
	ldi	r2, 0xFFFE
	and 	r1, r2
	ror	r1, 1		
	sub	r0, r1		;by = b3dy - az - 1/2 (ax + ay)
	stm	gy, r0
	sys	pixel
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
done:	ldm	r0, tmpx
	stm	tx, r0		;restore TX
	ldi	r0, 0x0D		
	stm	tascii, r0	;CR=0x0D
	sys	putchar		;print the CR manually
	jmp	top		;TX is reset back to 0

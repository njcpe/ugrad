.arch rhody		;use rhody.cfg
.outfmt hex		;output format is hex
.memsize 2048		;specify 2K words
;I/O Address;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define kcntrl	0xf0000	;keyboard control register
.define kascii	0xf0001	;keyboard ASCII code
.define vcntrl	0xf0002	;video control register
.define time0	0xf0003	;Timer 0
.define inport 	0xf0005	;GPIO read address
.define outport	0xf0005	;GPIO write address
.define rand	0xf0006	;random number
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Define part not to be included in user's program
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define deltax	0x0912	;parameters for line
.define deltay	0x0913
.define error	0x0914
.define ystep	0x0915
.define steep	0x0916
.define cf	0x0917	;parameters for circle
.define ddfx	0x0918
.define ddfy	0x0919
.define tmp0	0x091A	;temp holders for reg0-2
.define tmp1	0x091B
.define tmp2	0x091C
.define tmpx	0x091D	;temp holder for TX
.define tmpy	0x091E	;temp holder for TY
.define tmpa	0x091F	;temp holder for TASCII
.define tmpn	0x0920	;temp holder for TNUM
.define slope	0x0921	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Bresenham: draw a line
;inputs: X1, Y1, X2, Y2, COLOR
;outputs: draw a line between (x1,y1) and (x2,y2)
;	  on graphic screen with color
;no register is affected
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
begin:	sys	clear
	sys	clearg
	ldi	r0, 0	
	ldi	r1, 400
	ldi	r2, 0xFF0
	stm	format, r0
	
prtA:	ldi	r0, 0	
	ldi	r1, 400
	ldi	r2, 0xFF0

	stm	x1, r0
	stm	y1, r0
	stm	x2, r1
	stm	y2, r1	
	stm	color, r2
	stm	time0, r0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Bresenham:
	push	r0
	push	r1
	push	r2
	push	r4
	push	r5
	push	r6
lin:	ldm	r0, y1		;r0=y1
	ldm	r2, y2		;r2=y2
	sub	r2, r0		;r2=y2-y1
	jnz	skphln
hlin:	ldm	r0, x2		;r0=x2
	ldm	r1, x1		;r1=x1
	ldm	r2, y1		;r2=Y
	stm	GY, r2		;GY=y1=y2
	cmp 	r0, r1		;test x2-x1
	jns	hlp0	
	ldm	r1, x2		;swap(x1, x2)
	ldm	r0, x1		;if x2 < x1
hlp0:	stm	GX, r1		;update GX
;sys Pixel Unwrap;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	push	r0
	push	r1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	push	r1
	push	r2
	ldm	r1, GX		;r1=GX
	ldm	r2, GY		;r2=GY
	ror	r2, 22	;rotate GY left by 10
	add	r2, r1		;r2=2**10*GY+GX
	ldi	r1, 0x0010	
	ror	r1, 16		;r3=00100000
	add	r2, r1		;add base address
	stm	gaddr, r2	;save to GADDR
	pop	r2
	pop	r1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldm	r0, color	;get COLOR
	ldm	r1, gaddr	;get GADDR		
	str	r1, r0
	pop	r1
	pop	r0
;sys Pixel Unwrap;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		;draw one pixel
	adi	r1, 0x0001	;x=x+1
	cmp 	r0, r1
	jns	hlp0		;if End point > X
	jmp	lext		;horizontal line subroutine
skphln:	mul	r2, r2		;r2=r2**2
	ldm	r0, x1		;r0=x1
	ldm	r1, x2		;r1=x2
	sub	r1, r0		;r1=x2-x1
	jnz	skpvln		;vertical line subroutine
vlin:	ldm	r0, y2		;r0=y2
	ldm	r1, x1		;r1=X
	stm	GX, r1		;GX=x1=x2
	ldm	r2, y1		;r2=y1
	cmp 	r0, r2		;test y2-y1
	jns	vlp0	
	ldm	r2, y2		;swap(y1, y2)
	ldm	r0, y1		;if y2 < y1
vlp0:	stm	GY, r2		;update GY
;sys Pixel Unwrap;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	push	r0
	push	r1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	push	r1
	push	r2
	ldm	r1, GX		;r1=GX
	ldm	r2, GY		;r2=GY
	ror	r2, 22	;rotate GY left by 10
	add	r2, r1		;r2=2**10*GY+GX
	ldi	r1, 0x0010	
	ror	r1, 16		;r3=00100000
	add	r2, r1		;add base address
	stm	gaddr, r2	;save to GADDR
	pop	r2
	pop	r1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldm	r0, color	;get COLOR
	ldm	r1, gaddr	;get GADDR		
	str	r1, r0
	pop	r1
	pop	r0
;sys Pixel Unwrap;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		;draw one pixel
	adi	r2, 0x0001	;y=y+1
	cmp 	r0, r2
	jns	vlp0		;if End point > Y
	jmp	lext
skpvln:	mul	r1, r1		;r1=r1**2
	sub	r2, r1		;r2=(y2-y1)**2-(x2-x1)**2
	jns	ck1
	ldi	r2, 0x0000
	stm	steep, r2	;steep=0
	jmp	ck2
ck1:	ldi	r2, 0x0001
	stm	steep, r2	;steep=1
	ldm	r0, x1
	ldm	r1, y1
	stm	x1, r1
	stm	y1, r0		;swap(x1, y1)
	ldm	r0, x2
	ldm	r1, y2
	stm	x2, r1
	stm	y2, r0		;swap(x2, y2)
ck2:	ldm 	r0, x1
	ldm	r1, x2
	sub 	r0, r1		;r0=x1-x2
	js	lp0
	jz	lp0
	ldm	r0, x1
	ldm	r1, x2
	stm	x1, r1
	stm	x2, r0		;swap(x1, x2)
	ldm	r0, y1
	ldm	r1, y2
	stm	y1, r1
	stm	y2, r0		;swap(y1, y2)
lp0:	ldm	r1, x1
	ldm	r2, x2
	sub	r2, r1		;r2=x2-x1
	stm	deltax, r2
	ldm	r1, y1
	ldm	r2, y2
	sub	r2, r1		;r2=y2-y1
	jns	lp1
	ldi	r0, 0x0000
	sub	r0, r2		;r0=0-r2
	mov	r2, r0		;r2=abs(y2-y1)
lp1:	stm	deltay, r2
	ldm	r0, deltax
	ldh	r1, 0x0000
	ldl	r1, 0xffff
	ror	r0, 0x01
	and	r0, r1
	stm	error, r0
	ldm	r1, y1
	ldm	r2, y2
	sub 	r1, r2		;r1=y1-y2
	js	lp2
	ldi	r0, 0xFFFF
	stm	ystep, r0	;ystep=-1
	jmp	lp3
lp2:	ldi	r0, 0x0001
	stm	ystep, r0	;ystep=1
lp3:	ldm	r6, x2
	adi	r6, 0x0001
	stm	x2, r6		;x2=x2+1 for loop checking
	ldm	r1, x1		;r1=x=x1
	ldm	r2, y1		;r2=y=y1
lp4:	ldm	r0, steep
	adi	r0, 0x0000
	jz	draw
	mov	r4, r1
	mov	r1, r2
	mov	r2, r4		;swap x, y
	stm	GX, r1
	stm	GY, r2
;sys Pixel Unwrap;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	push	r0
	push	r1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	push	r1
	push	r2
	ldm	r1, GX		;r1=GX
	ldm	r2, GY		;r2=GY
	ror	r2, 22	;rotate GY left by 10
	add	r2, r1		;r2=2**10*GY+GX
	ldi	r1, 0x0010	
	ror	r1, 16		;r3=00100000
	add	r2, r1		;add base address
	stm	gaddr, r2	;save to GADDR
	pop	r2
	pop	r1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldm	r0, color	;get COLOR
	ldm	r1, gaddr	;get GADDR		
	str	r1, r0
	pop	r1
	pop	r0
;sys Pixel Unwrap;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		;draw one pixel		
	mov	r4, r1
	mov	r1, r2
	mov	r2, r4		;swap x, y back
	jmp	lp5
draw:	stm	GX, r1
	stm	GY, r2
;sys Pixel Unwrap;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	push	r0
	push	r1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	push	r1
	push	r2
	ldm	r1, GX		;r1=GX
	ldm	r2, GY		;r2=GY
	ror	r2, 22	;rotate GY left by 10
	add	r2, r1		;r2=2**10*GY+GX
	ldi	r1, 0x0010	
	ror	r1, 16		;r3=00100000
	add	r2, r1		;add base address
	stm	gaddr, r2	;save to GADDR
	pop	r2
	pop	r1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldm	r0, color	;get COLOR
	ldm	r1, gaddr	;get GADDR		
	str	r1, r0
	pop	r1
	pop	r0
;sys Pixel Unwrap;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		;draw one pixel
lp5:	ldm	r4, error
	ldm	r5, deltay
	sub	r4, r5		;error=error-deltay
	jns	next
	ldm	r6, ystep
	add	r2, r6		;y=y+ystep if error < 0
	ldm	r5, deltax
	add	r4, r5		;error=error+deltax
next:	stm	error, r4	;save back error
	adi	r1, 0x0001	;x=x+1
	ldm	r4, x2
	sub 	r4, r1
	jnz	lp4
	jmp	donedraw

lext:	pop	r6
	pop	r5
	pop	r4
	pop	r2
	pop	r1
	pop	r0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
donedraw:
	ldm	r0, time0
	stm	tnum, r0
	ldi	r0, 0
	stm	tx, r0
	stm	ty, r0
	sys	printn
	ldi	r0, 0x0B	;'mu'
	stm	tascii, r0
	sys	putchar
	ldi	r0, S		;'S'
	stm	tascii, r0
	sys	putchar
	ldi	r0, 0x0D	;'\n'
	stm	tascii, r0
	sys	putchar
	sys	getchar

prtB:	ldi	r0, 0	
	ldi	r1, 400
	ldi	r2, 0xFF0
	stm	x1, r0
	stm	y1, r0
	stm	x2, r1
	stm	y2, r1	
	stm	color, r2
	stm	time0, r0
	call	SlopeMethod

	ldm	r0, time0
	stm	tnum, r0
	ldi	r0, 0
	stm	tx, r0
	stm	ty, r0
	sys	printn
	ldi	r0, 0x0B	;'mu'
	stm	tascii, r0
	sys	putchar
	ldi	r0, S		;'S'
	stm	tascii, r0
	sys	putchar
halt:	jmp	halt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;SlopeMethod psuedocode:
;	calc Slope (dY/dX)
;	inc x by m
;	inc y by m
;	call 	pixel
;	
;	cmp x,y w/ x2, y2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SlopeMethod:	
	push	r0
	push	r1
	push	r2

	ldm	r0, x1		;load x1
	ldm	r1, x2		;load x2
	ldm	r2, y1		;load y1
	ldm	r3, y2		;load y2
	stm	GX, r0		;init at (x1,y1)
	stm	GY, r2		

prep:	sub	r3, r2		;calc dY
	sub	r1, r0		;calc dX
	div	r3, r1		;dY/dX
	stm	slope, r3

sdraw:;sys Pixel Unwrap;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	push	r0
	push	r1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	push	r1
	push	r2
	ldm	r1, GX		;r1=GX
	ldm	r2, GY		;r2=GY
	ror	r2, 22	;rotate GY left by 10
	add	r2, r1		;r2=2**10*GY+GX
	ldi	r1, 0x0010	
	ror	r1, 16		;r3=00100000
	add	r2, r1		;add base address
	stm	gaddr, r2	;save to GADDR
	pop	r2
	pop	r1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldm	r0, color	;get COLOR
	ldm	r1, gaddr	;get GADDR		
	str	r1, r0
	pop	r1
	pop	r0
;sys Pixel Unwrap;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		;draw pixel
	ldm	r3, slope	;load slope
	ldm 	r2, GY		;load Ycurr
	ldm	r0, GX		;load Xcurr
	add	r2, r3		;Ycurr = Ycurr + M
	adi	r0, 1		;Xcurr++
	stm	GX, r0		
	stm	GY, r2
	ldm	r4, y2	
	cmp	r2, r4		;Ycurr = Y2?
	jnz	sdraw
	
	pop	r2
	pop	r1
	pop	r0
	ret



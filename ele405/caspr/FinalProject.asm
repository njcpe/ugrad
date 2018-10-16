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
;Program variables;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define gcolor	0x0800
.define ax	0x0801
.define ay	0x0802
.define az	0x0803
.define bx	0x0804
.define by	0x0805
.define bx1	0x0806
.define by1	0x0807	
.define bx2	0x0808
.define by2	0x0809
.define bx3	0x080A
.define by3	0x080B
.define bx4	0x080C
.define by4	0x080D
.define	px	0x0810	;for point X (0 - size)
.define py	0x0811	;for point Y (0 - size)
.define pz	0x0812	;for point height (0 - 255)
.define dist	0x0813	;current distance
.define maskz	0x0814	;mask for 'Z'
.define oldx	0x0815	;old TX1 for touch detect
.define form3d	0x0816	;3D format: 0=surface, 1=wire frame (mesh)\
;Program constants 3D;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define size	32	;height map size
.define shift	29	;For ROL 3 (32-3); log2(fmax/size)
.define b3dx	384	;screen X of (0,0,0)
.define b3dy	460	;screen Y of (0,0,0)
.define white	0xFF	;white color
.define gray	0x92	;gray color
.define	black	0x00	;black color
.define ivory	0xFE	;ivory color
.define tfact	3	;multiplier
.define tmask1	0xFFFE	;3/2 mask
.define tmask2	0xFFFC	;1/4 mask
.define tmask3	0xFFFF	;16-bit mask
.define randsed	0x12345678
;Program pointers;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define A	0x0817
.define B	0x0818
.define C	0x0819
.define D	0x081A
.define E	0x081B
.define F	0x081C
.define G	0x081D
.define H	0x081E
.define J	0x081F
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Zero the heightmap
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
init:	ldi	r7, 0		;r7 = 0
	ldm	r5, px		;r5 = px
	ldm	r6, py		;r6 = py
	ldi	r3, size	;r3 = y counter (0 to 32) == 32
zerox:	ldi	r2, size	;r2 = x counter (0 to 32) == 32
	mov	r0, r5		;refresh px, outer loop
	add	r0, r2		;px =+ xcount		
zeroy:	mov	r1, r6		;refresh py, inner loop
	add	r1, r3		;py =+ ycount
	mtx	r0, r0, r1, 64	;r0 = 64 * py + px
	stix	r0, r7, hmap	;Pz(r0) = 0
	adi	r2, 0xFFFF	;xcount--
	cmpi	r2, 0		;xcount = 0?
	jnz	zeroy		
	adi	r3, 0xFFFF	;ycount--
	cmpi	r3, 0		;ycount = 0?
	jnz	zerox

	ldi	r0, 16		
	stm	dist, r0	;dist = 16
	ldi	r0, 1
	stm	form3d, r0	;start with wire frame
begin:	sys	clearg		;clear graphic screen
	ldi	r0, 0
	stm	time0, r0	
	;call	setup		;generate heightmap
	;call	diamond_square
	call	grid		;plot entire grid
	ldm	r0, time0
	call	hex2dec		
	call 	wait
	ldm	r0, form3d
	cmpi	r0, 0
	jz	begin1
	ldi	r0, 0
	stm	form3d, r0
	jmp	begin
begin1:	ldi	r0, 1
	stm	form3d, r0
	jmp	begin
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;hex2dec:
;	converts runtime from hex format to 
;	decimal format for easy reading.
;Inputs:
;	r0 = hex runtime
;
;Outputs:
;	writes to outport
;
;out == zeros(16)
;
;for(i = 0; i < time0.len; i++)
;{
;	out[i] =+ time0[i]*pow(16,i);
;}
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
hex2dec:
	push	r1
	push	r2
	push	r3
	push 	r7	
	ldi	r1, 0		;r1 = 0
	ldi 	r2, 0		;r2 = 0
	ldi	r3, 8		;i = 8
	mov	r1, r0		;copy hex val to r1
lp1:	
	ldi	r7, 10		;r7 = 10
	div	r1, r7		;divide hex by 10
	xor	r2, r7		
	ror	r2, 4
	adi	r3, 0xFFFF
	cmpi	r3, 0	
	jnz	lp1

	stm	outport, r2
	pop	r7
	pop	r3
	pop	r2
	pop	r1
	ret		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Grid plot subroutine: (draw from back to front)
;For PX = (size - dist) downto 0
;   {
;   For PY = (size - dist) downto 0
;	{
;	Project3D(PX, PY, PZ)	--> 3D to 2D
;	Rect3D
;	PY = PY - dist;
;	}
;   PX = PX - dist;
;   }
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
grid:
	ldm	r0, dist
	ldi	r6, size	
	sub	r6, r0		;r6= PX = size - dist
grid0:	ldi	r7, size
	ldm	r0, dist
	sub	r7, r0		;r7= PY = size - dist
grid1:
	stm	px, r6
	stm	py, r7
	call	project3D
	call	rect3d	
	ldm	r0, dist
	sub	r7, r0		;PY = PY - dist
	jns	grid1
	sub	r6, r0		;PX = PX - dist
	jns	grid0
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;height map: PX = 0 to 32, PY = 0 to 32
;	addr = hmap + 64* Y + X
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define	hmap	0x10000		;height map in ext memory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;write height pz to height map (px, py)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
hwrite:	push	r0
	push	r1
	ldm	r0, px
	ldm	r1, py
	mtx	r0, r0, r1, 64	;r0 = 64 * py + px
	ldm	r1, pz
	stix	r0, r1, hmap
	pop	r1
	pop	r0
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;read height map (px, py) to pz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
hread:	push	r0
	push	r1
	ldm	r0, px
	ldm	r1, py
	mtx	r0, r0, r1, 64	;r0 = 64 * py + px
	ldix	r1, r0, hmap
	stm	pz, r1
	pop	r1
	pop	r0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;srfgen with diamond square Algo
;	For d (dist) = size/2 to 1
;	{
;		For x = 0 to size - d
;		{
;			For y = 0 to size - d
;			{
;				maskz = 8*y XOR x
;				Diamond_Square(x, y)
;				y = y + 2d;
;			}
;			x = x + 2d;
;		}
;		d = d/2;
;	}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
srfgen:
	;loop
	;ldi	r0, 0
	;ldi	r1, 0	
	call	diamond_square
	;endloop
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;axcalc: does avg calc and returns
;r0		x
;r1		y
;r2 to r5	surrounding vals
;r6		dist

;returns
;n/a, calls hwrite
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
axcalc:	add	r2, r3		;r2 = A+B
	add	r2, r4		;r2 = A+B+C
	add	r2, r5		;r2 = A+B+C+D
	ldi 	r3, 0xFFFC 	;r3 = .25
	and	r2, r3		;div r2	
	ldm	r3, rand	
	add	r2, r3		;r2 = avg(A,B,C,D)/4 +rand
	add	r0, r6
	add	r1, r6
	stm	px, r0
	stm	py, r1
	stm	pz, r2
	call	hwrite	
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Initialize Corners (Verified Working)
;	used
;r0	
;r1
;r2
;r3
;r4
;r5
;r6
;r7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
setup:
	ldi	r5, dist	;load dist
	ldi	r6, size	;const size reg
	ldi	r7, 0		;ZERO
	ldi	r1, 0		;px
	ldi	r2, 0		;py

cornerinit:			;(0,0)
	ldm	r4, rand	;loading rand to r4 
	ldi	r3, 0x0F	;load mask (0,0)
	and	r3, r4		
	stm	px, r1		
	stm	py, r2
	stm	pz, r3		;r3 = pz
	call 	hwrite	
	ldm	r4, rand	;loading rand to r4
	ldi	r3, 0x3F	;load mask (size,0)	
	and	r3, r4		
	stm	px, r6
	stm	pz, r3		;r3 = pz
	call	hwrite
	ldm	r4, rand	;loading rand to r4
	ldi	r3, 0x7F	;load mask (0,size)
	and	r3, r4		
	stm	px, r7
	stm	py, r6
	stm	pz, r3		;r3 = pz
	call	hwrite	
	ldm	r4, rand	;loading rand to r4
	ldi	r3, 0xFF	;load mask (size,size)
	and	r3, r4		
	stm	px, r6
	stm	pz, r3		;r3 = pz
	call	hwrite
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;A=(x, y)
;F=(x+d, y-d)=A+(d, -d)
;B=(x+2d, y)=F+(d, d)
;H=(x+3d, y+d) =B+(d, d)
;D=(x+2d, y+2d)=H+(-d, d)
;G=(x+d, y+3d)=D+(-d, d)
;C=(x, y+2d)=G+(-d, -d)
;E=(x-d, y+d)=C+(-d, -d)
;J=(x+d, y+d)=E+(2d, 0)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
diamond_square:

get_vals:			;tfw no descriptive names
				;add a,b,c,d gen
	stm	px, r0		;px = x
	stm	py, r1		;py = y
	call	hread		;read A to pz
	ldm	r2, pz		;load pz
	stm	A, r2		;Store A
	add	r0, r7
	sub	r1, r7
	stm	px, r0		;px = x
	stm	py, r1		;py = y
	call	hread		;load F
	ldm	r2, pz		;load pz
	stm	F, r2		;Store F
	add	r0, r7
	add	r1, r7
	stm	px, r0		;px = x
	stm	py, r1		;py = y
	call	hread		;load B
	ldm	r2, pz		;load pz
	stm	B, r2		;Store B
	add	r0, r7
	add	r1, r7
	stm	px, r0		;px = x
	stm	py, r1		;py = y
	call	hread		;load H
	ldm	r2, pz		;load pz	
	stm	H, r2		;Store H
	sub	r0, r7
	add	r1, r7
	stm	px, r0		;px = x
	stm	py, r1		;py = y
	call	hread		;load D
	ldm	r2, pz		;load pz
	stm	D, r2		;Store D	
	sub	r0, r7
	add	r1, r7
	stm	px, r0		;px = x
	stm	py, r1		;py = y
	call	hread		;load G
	ldm	r2, pz		;load pz	
	stm	G, r2		;Store G
	sub	r0, r7
	sub	r1, r7
	stm	px, r0		;px = x
	stm	py, r1		;py = y
	call	hread		;load C
	ldm	r2, pz		;load pz
	stm	C, r2		;Store C	
	sub	r0, r7
	sub	r1, r7
	stm	px, r0		;px = x
	stm	py, r1		;py = y
	call	hread		;load E
	ldm	r2, pz		;load pz	
	stm	E, r2		;Store E
	add	r0, r7
	add	r0, r7
	stm	px, r0		;px = x
	stm	py, r1		;py = y
	call	hread		;load J
	ldm	r2, pz		;load pz	
	stm	E, r2		;Store J

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Diamond_Square (x,y), pass: r0 = x, r1 = y
;	1) calc diamond
;	2) calc	square
;	3) access and hwrite?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Diamond:
	push	r0
	push	r1	
	ldm	r2, A		;load A
	ldm	r3, B		;load B
	ldm	r4, C		;load C
	ldm	r5, D		;load D
	ldm	r6, dist	;load Dist	
	call	axcalc
	ldm	r1, pz		;load pz
	stm	J, r1		;store as J	
	pop	r1		
	pop	r0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Square :
;part 1 : calc pz(x,y+d)
;	avg(A+C+E+J)+rand and maskz
;part 2 : calc pz(x+d,y)
;	avg(A+B+F+J)+rand and maskz
;part 3 : calc pz(x+d,y+2d)
;	avg(C+D+G+J)+rand and maskz
;part 2 : calc pz(x+2d,y+d)
;	avg(B+D+H+J)+rand and maskz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Square:	
	push	r0		;save x0
	push	r1		;save y0

	add	r1, r6		;y=y+d
	ldm	r2, A		;load A
	ldm	r3, C		;load C
	ldm	r4, E		;load E
	ldm	r5, J		;load J
	call	axcalc		;(x,y+d) = (A+C+E+J)/4 + rand

	
	add	r0, r6		;x=x+d
	sub	r1, r6		;y=y-d
	ldm	r2, A		;load A
	ldm	r3, B		;load B
	ldm	r4, F		;load F
	ldm	r5, J		;load J
	call	axcalc		;(x+d,y) = (A+B+F+J)/4 + rand

	add	r1, r6		;y=y+d
	ldm	r2, C		;load C
	ldm	r3, D		;load D
	ldm	r4, G		;load G
	ldm	r5, J		;load J
	call	axcalc		;(x+d,y+2d) = (C+D+G+J)/4 + rand		 	

	add	r0, r6		;x=x+d
	sub	r1, r6		;y=y-d
	ldm	r2, B		;load B
	ldm	r3, D		;load D
	ldm	r4, H		;load H
	ldm	r5, J		;load J
	call	axcalc		;(x+2d,y+d) = (B+D+H+J)/4 + rand
	pop	r1		;restore x
	pop	r0		;restore y
	ret			;finished with DS(x,y)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;wait for touch screen sensor
;Accept next touch only if TX1 changes!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wait:	ldl	r0, 0
	ldh	r0, 0x10
dly:	adi	r0, 0xFFFF
	jnz	dly
	ldm	r0, trdy
	cmpi	r0, 1
	jz	wait
wait0:	ldm	r0, trdy
	cmpi	r0, 0
	jz	wait0
	ldm	r0, tcnt
	cmpi	r0, 1
	jnz	wait
	ldm	r0, tx1
	ldm	r1, oldx
	cmp	r0, r1
	jz	wait		;no respond to old touch
	stm	oldx, r0	;update oldx
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Project3D:
;Translate four corners 3D to 2D
;	1. ax, ay, az(ax, ay))
;	2. ax, ay+dist, az(ax, ay_dist)
;	3. ax+dist, ay, az(ax+dist, ay)
;	4. ax+dist, ay+dist, az(ax+dist, ay+dist)
;	--> save to bx1, by1 to bx4 to by4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Project3D:
	push	r7
	ldi	r7, 0
range0:	call	hread		;read height map
	ldm	r3, pz		;PZ(PX, PY)
	ldm	r1, PX
	ror	r1, shift	;ax = 2^(32-shift)*PX	
	ldm	r2, PY
	ror	r2, shift	;ay = 2^(32-shift)*PY
	ldi	r0, b3dx
	add	r0, r1
	mov	r5, r2		;save ay to R5
	ldi	r4, tfact
	mul	r2, r4
	ldi	r4, tmask1
	and	r2, r4
	ror	r2, 1
	sub	r0, r2		;bx = b3dx + ax - 3/2 ay
	cmpi	r7, 0
	jnz	range1
	stm	bx1, r0
	jmp	range4
range1:	cmpi	r7, 1
	jnz	range2
	stm	bx2, r0
	jmp	range4
range2:	cmpi	r7, 2
	jnz	range3
	stm	bx4, r0
	jmp	range4
range3:	stm	bx3, r0
range4:	ldi	r0, b3dy
	sub	r0, r3
	and 	r1, r4
	ror	r1, 1		
	sub	r0, r1		;r0 = b3dy - az - 1/2 ax
	mov	r2, r5		;restore ay
	ldi	r4, tmask2
	and	r2, r4
	ror	r2, 2
	sub	r0, r2		;by = b3dy - az - 1/2 ax - 1/4 ay
	cmpi	r7, 0
	jnz	range5
	stm	by1, r0
	jmp	range8
range5:	cmpi	r7, 1
	jnz	range6
	stm	by2, r0
	jmp	range8
range6:	cmpi	r7, 2
	jnz	range7
	stm	by4, r0
	jmp	range8
range7:	stm	by3, r0
range8:	cmpi	r7, 0
	jnz	range9
	ldm	r0, dist
	ldm	r1, PY
	add	r1, r0		;(2)
	stm	PY, r1		;PY=PY+dist
	jmp	rangeC
range9:	cmpi	r7, 1
	jnz	rangeA
	ldm	r0, dist
	ldm	r2, PX
	add	r2, r0		;(4)
	stm	PX, r2		;PX = PX + dist
	jmp	rangeC
rangeA:	cmpi	r7, 2
	jnz	rangeB
	ldm	r2, PY
	ldm	r0, dist
	sub	r2, r0		;(3)
	stm	PY, r2		;PY=PY-dist
rangeC:	adi	r7, 1
	jmp	range0
rangeB:	pop	r7
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Rectangle 3D:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Rect3d:	push	r6
	push	r7
	ldm	r0, form3d
	cmpi	r0, 0
	jz	surface
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Wireframe (mesh) plots version
;Draw four outlines:
;	(bx1, by1) to (bx2, by2)
;	(bx1, by1) to (bx3, by3)
;	(bx4, by4) to (bx2, by2)
;	(bx4, by4) to (bx3, by3)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wframe:	ldi	r1, ivory
	stm	color, r1
	ldm	r0, bx1
	stm	x1, r0
	ldm	r0, by1
	stm	y1, r0
	ldm	r0, bx2
	stm	x2, r0
	ldm	r0, by2
	stm	y2, r0
	sys	line		;(bx1, by1) to (bx2, by2)
	ldm	r0, bx1
	stm	x1, r0
	ldm	r0, by1
	stm	y1, r0
	ldm	r0, bx3
	stm	x2, r0
	ldm	r0, by3
	stm	y2, r0
	sys	line		;(bx1, by1) to (bx3, by3)
	ldm	r0, bx4
	stm	x1, r0
	ldm	r0, by4
	stm	y1, r0
	ldm	r0, bx2
	stm	x2, r0
	ldm	r0, by2
	stm	y2, r0
	sys	line		;(bx4, by4) to (bx2, by2)
	ldm	r0, bx4
	stm	x1, r0
	ldm	r0, by4
	stm	y1, r0
	ldm	r0, bx3
	stm	x2, r0
	ldm	r0, by3
	stm	y2, r0
	sys	line		;(bx4, by4) to (bx3, by3)
	pop	r7
	pop	r6
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Surface plots version:
;Draw two solid triangles:
;1. (bx2, by2), (bx4, by4), (bx3, by3)
;2. (bx2, by2), (bx1, by1), (bx3, by3)
;Each solid triangle is formed by two smaller
;right angle solid triangles
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
surface:
	ldm	r0, bx2
	ldm	r2, by2
	ldm	r1, bx4
	ldm	r3, by4
	ror	r2, 16		;r2=by2*2^16	
	ror	r3, 16		
	mov	r4, r3		;r3=r4=by4*2^16
	sub	r4, r2		;r4=(by4-by2)*2^16		
	mov	r5, r1
	sub	r5, r0		;r5=bx4-bx2
	div	r4, r5		;r4=d42=(by4-by2)*2^16/(bx4-bx2)
	ldm	r5, by3	
	ror	r5, 16		;r5=by3*2^16		
	sub	r5, r2		;r5=(by3-by2)*2^16
	ldm	r3, bx3		
	sub	r3, r0		;r3=bx3-bx2
	div	r5, r3		;r5=d32=(by3-by2)*2^16/(bx3-bx2)
	ldh	r6, 0
	ldl	r6, tmask3
	ldi	r3, gray
	stm	color, r3
	mov	r3, r2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;First small triangle: init by2
;	for x = bx2 to bx4; x++
;		line (x, by2+d42) to (x by2+d32)
;
;r0=bx2
;r1=bx4
;r2=by2*2^16
;r3=by2*2^16
;r4=d42*2^16
;r5=d32*2^16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rd0:	stm	x1, r0
	add	r2, r4
	mov	r7, r2
	ror	r7, 16
	and	r7, r6
	stm	y1, r7
	add	r3, r5
	mov	r7, r3
	ror	r7, 16
	and	r7, r6
	stm	y2, r7
	call	vline
	adi	r0, 1
	cmp	r0, r1
	jnz	rd0
	ldm	r0, bx2
	stm	x1, r0
	ldm	r0, by2
	stm	y1, r0
	ldm	r0, bx4
	stm	x2, r0
	ldm	r0, by4
	stm	y2, r0
	ldi	r0, ivory
	stm	color, r0
	sys	line
	ldi	r0, gray
	stm	color, r0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Second small triangle: contiue with by2
;	for x = bx4 to bx3;  x++
;		line (x, by2+d34) to (x by2+d32)
;
;r0=bx4
;r1=bx3
;r2=by2*2^16
;r3=by2*2^16
;r4=d34*2^16
;r5=d32*2^16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldm	r4, by3
	ldm	r0, by4	
	ror	r4, 16		;r4=by3*2^16
	ror	r0, 16		;r0=by4*2^16		
	sub	r4, r0		;r4=(by3-by4)*2^16
	ldm	r0, bx3
	ldm	r7, bx4		
	sub	r0, r7		;r0=bx3-bx4
	div	r4, r0		;r4=d34=(by3-by4)*2^16/(bx3-bx4)
	ldm	r0, bx4
	ldm	r1, bx3
rd1:	stm	x1, r0
	add	r2, r4
	mov	r7, r2
	ror	r7, 16
	and	r7, r6
	stm	y1, r7
	add	r3, r5
	mov	r7, r3
	ror	r7, 16
	and	r7, r6
	stm	y2, r7
	call	vline
	adi	r0, 1
	cmp	r0, r1
	jnz	rd1
	ldm	r0, bx3
	stm	x1, r0
	ldm	r0, by3
	stm	y1, r0
	ldm	r0, bx4
	stm	x2, r0
	ldm	r0, by4
	stm	y2, r0
	ldi	r0, ivory
	stm	color, r0
	sys	line
	ldi	r0, gray
	stm	color, r0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Third small triangle: init by2
;	for x = bx2 to bx1;  x++
;		line (x, by2+d12) to (x by2+d32)
;
;r0=bx2
;r1=bx1
;r2=by2*2^16
;r3=by2*2^16
;r4=d12*2^16
;r5=d32*2^16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldm	r4, by1
	ldm	r0, by2	
	ror	r4, 16		;r4=by1*2^16
	ror	r0, 16		;r0=by2*2^16		
	sub	r4, r0		;r4=(by1-by2)*2^16
	ldm	r1, bx1
	ldm	r0, bx2		
	sub	r1, r0		;r1=bx1-bx2
	div	r4, r1		;r4=d12=(by1-by2)*2^16/(bx1-bx2)
	ldm	r1, bx1
	ldm	r2, by2
	ror	r2, 16
	mov	r3, r2
rd2:	stm	x1, r0
	add	r2, r4
	mov	r7, r2
	ror	r7, 16
	and	r7, r6
	stm	y1, r7
	add	r3, r5
	mov	r7, r3
	ror	r7, 16
	and	r7, r6
	stm	y2, r7
	call	vline
	adi	r0, 1
	cmp	r0, r1
	jnz	rd2
	ldm	r0, bx2
	stm	x1, r0
	ldm	r0, by2
	stm	y1, r0
	ldm	r0, bx1
	stm	x2, r0
	ldm	r0, by1
	stm	y2, r0
	ldi	r0, ivory
	stm	color, r0
	sys	line
	ldi	r0, gray
	stm	color, r0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Fourth small triangle: contiue with by2
;	for x = bx1 to bx3;  x++
;		line (x, by2+d31) to (x by2+d32)
;
;r0=bx1
;r1=bx3
;r2=by2*2^16
;r3=by2*2^16
;r4=d31*2^16
;r5=d32*2^16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldm	r4, by3
	ldm	r0, by1	
	ror	r4, 16		;r4=by3*2^16
	ror	r0, 16		;r0=by1*2^16		
	sub	r4, r0		;r4=(by3-by1)*2^16
	ldm	r0, bx3
	ldm	r7, bx1		
	sub	r0, r7		;r0=bx3-bx1
	div	r4, r0		;r4=d31=(by3-by1)*2^16/(bx3-bx1)
	ldm	r0, bx1
	ldm	r1, bx3
rd3:	stm	x1, r0
	add	r2, r4
	mov	r7, r2
	ror	r7, 16
	and	r7, r6
	stm	y1, r7
	add	r3, r5
	mov	r7, r3
	ror	r7, 16
	and	r7, r6
	stm	y2, r7
	call	vline
	adi	r0, 1
	cmp	r0, r1
	jnz	rd3
	ldm	r0, bx1
	stm	x1, r0
	ldm	r0, by1
	stm	y1, r0
	ldm	r0, bx3
	stm	x2, r0
	ldm	r0, by3
	stm	y2, r0
	ldi	r0, ivory
	stm	color, r0
	sys	line
	ldm	r0, bx2
	stm	x1, r0
	ldm	r0, by2
	stm	y1, r0
	ldm	r0, bx3
	stm	x2, r0
	ldm	r0, by3
	stm	y2, r0
	sys	line
	pop	r7
	pop	r6
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;draws a vertical line between (x1,y1) and (x1,y2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
vline:	push	r0
	push	r1
	push	r2
	ldm	r0, y2		;r0=y2
	ldm	r1, x1		;r1=X
	stm	GX, r1		;GX=x1=x2
	ldm	r2, y1		;r2=y1
	cmp 	r0, r2		;test y2-y1
	jns	vlp0	
	ldm	r2, y2		;swap(y1, y2)
	ldm	r0, y1		;if y2 < y1
vlp0:	stm	GY, r2		;update GY
	sys	pixel		;draw one pixel
	adi	r2, 1		;y=y+1
	cmp 	r0, r2
	jns	vlp0		;if End point > Y
	pop	r2
	pop	r1
	pop	r0
	ret

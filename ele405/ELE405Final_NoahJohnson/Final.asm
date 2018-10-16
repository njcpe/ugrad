.arch	rhody_mod.cfg
.outfmt hex  ;output format is hex
.memsize 2048  ;specify 2K words
;I/O Address;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define kcntrl 0xf0000 ;keyboard control register
.define kascii 0xf0001 ;keyboard ASCII code
.define vcntrl 0xf0002 ;video control register
.define time0 0xf0003 ;Timer 0
.define inport  0xf0005 ;GPIO read address
.define outport 0xf0005 ;GPIO write address
.define rand 0xf0006 ;random number
.define trdy 0xf0010 ;touch ready
.define tcnt 0xf0011 ;touch count
.define gesture 0xf0012 ;touch gesture
.define tx1 0xf0013 ;touch X1
.define ty1 0xf0014 ;touch Y1
.define tx2 0xf0015 ;touch X2
.define ty2 0xf0016 ;touch Y2
.define tx3 0xf0017 ;touch X3
.define ty3 0xf0018 ;touch Y3
.define tx4 0xf0019 ;touch X4
.define ty4 0xf001A ;touch Y4
.define tx5 0xf001B ;touch X5
.define ty5 0xf001C ;touch Y5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Define part to be included in user's program
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define tx 0x0900 ;text video X (0 - 79)
.define ty 0x0901 ;text video Y (0 - 59)
.define taddr 0x0902 ;text video address
.define tascii 0x0903 ;text video ASCII code
.define cursor 0x0904 ;ASCII for text cursor
.define prompt 0x0905 ;prompt length for BS left limit
.define tnum 0x0906 ;text video number to be printed
.define format 0x0907 ;number output format
.define gx 0x0908 ;graphic video X (0 - 799)
.define gy 0x0909 ;graphic video Y (0 - 479)
.define gaddr 0x090A ;graphic video address
.define color 0x090B ;color for graphic
.define x1 0x090C ;x1 for line/circle
.define y1 0x090D ;y1
.define x2 0x090E ;x2 for line
.define y2 0x090F ;y2
.define rad 0x0910 ;radius for circle
.define string 0x0911 ;string pointer
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
;Program variables;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define gcolor 0x0800
.define ax 0x0801
.define ay 0x0802
.define az 0x0803
.define bx 0x0804
.define by 0x0805
.define bx1 0x0806
.define by1 0x0807
.define bx2 0x0808
.define by2 0x0809
.define bx3 0x080A
.define by3 0x080B
.define bx4 0x080C
.define by4 0x080D
.define px 0x0810 ;for point X (0 - size)
.define py 0x0811 ;for point Y (0 - size)
.define pz 0x0812 ;for point height (0 - 255)
.define dist 0x0813 ;current distance
.define maskz 0x0814 ;mask for 'Z'
.define oldx 0x0815 ;old TX1 for touch detect
.define form3d 0x0816 ;3D format: 0=surface, 1=wire frame (mesh)
;Program constants 3D;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define size 32 ;height map size
.define shift 29 ;For ROL 3 (32-3); log2(fmax/size)
.define b3dx 384 ;screen X of (0,0,0)
.define b3dy 460 ;screen Y of (0,0,0)
.define white 0xFF ;white color
.define gray 0x92 ;gray color
.define black 0x00 ;black color
.define ivory 0xFE ;ivory color
.define tfact 3 ;multiplier
.define tmask1 0xFFFE ;3/2 mask
.define tmask2 0xFFFC ;1/4 mask
.define tmask3 0xFFFF ;16-bit mask
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
				ldi	r0, 16 ; map size
				stm	dist, r0 ;dist = 16
				ldi	r0, 0  ;clear r0
				stm	form3d, r0 ;do surface plot

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
begin:	call	cg	  	;clear graphic screen
init: 	ldi r6, size
empty0: ldi r7, size
empty1: stm px, r6
				stm py, r7
				ldi r1, 0
				stm pz, r1

				;hwrt
				push	r0
				push 	r1
				ldm 	r0, px
				ldm 	r1, py
				mtx 	r0, r0, r1, 64 ;r0 = 64 * py + px
				ldm 	r1, pz
				stix 	r0, r1, hmap
				pop 	r1
				pop 	r0

				adi r7, 0xFFFF
				jns empty1
				adi r6, 0xFFFF
				jns empty0
				ldh	r1, 0x1234 	;load higher bits
				ldl	r1, 0x5678 	;load lower bits  ;x12345678
				stm	rand, r1 	;set rand seed = 0x12345678
				stm 	time0, r0 	;start timer

;;; initilize our corners of the map
				ldi 	r4, 0  		;clear r4
				ldi 	r0, size  	;r0 = size
				ldm 	r1, rand  	;r1 = random size
				ldi 	r3, 0x0f  	; r3 = 00001111? mask?


				and 	r3, r1 		;masking
				stm 	pz, r3 		;height mask!

				;hwrt
				push	r0
				;mov 	r0, r4
				;mov 	r1, r4
				;mtx 	r0, r0, r1, 64 ;r0 = 64 * py + px
				ldm 	r1, pz
				smtx	r4, r4, r1
				;stix 	r0, r1, hmap
				pop 	r0

				ldm 	r1, rand  	;don't need this
				ldi 	r3, 0x3f  	;another mask
				and 	r3, r1    	;masking masking
				stm 	px, r0  	;size, 0


				;hwrt
				mov 	r1, r4
				mtx 	r0, r0, r1, 64 ;r0 = 64 * py + px
				mov 	r1, r3
				stix 	r0, r1, hmap

				ldm 	r1, rand   	;don't need this
				ldi 	r3, 0x7f

				stm 	py, r0  	;size, size
				and 	r3, r1
				stm 	pz, r3

				;hwrt
				push	r0
				ldm 	r0, px
				ldm 	r1, py
				mtx 	r0, r0, r1, 64 ;r0 = 64 * py + px
				ldm 	r1, pz
				stix 	r0, r1, hmap
				pop 	r0


				ldm 	r1, rand   	;don't need this?
				ldi 	r3, 0xff
				stm 	px, r4  	;0, size
				and 	r3, r1
				stm 	pz, r3

				;hwrt
				push	r0
				ldm 	r0, px
				ldm 	r1, py
				mtx 	r0, r0, r1, 64 ;r0 = 64 * py + px
				ldm 	r1, pz
				stix 	r0, r1, hmap
				pop 	r0
				ldi	r0,0
				stm 	time0, r0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;main subroutine:
;For dist = size/2  downto 1
;   {
;   For PX = dist  downto (size-dist)
; {
;   For PY = dist downto (size-dist)
;   {
;   maskz = 8*PY XOR PX
;   Diamond_square(PX, PY)
;   PY = PY + 2*dist;
;  }
;    PX = PX + 2*dist;
; }
; dist = dist/2
;}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

main:
main0: 	ldi 	r1, 0  		;x = 0				good
main4: 	ldi 	r2, 0  		;y = 0				good


main3:
				mov	r3, r2  	;temp = y
				ldi	r4, 8
				mul	r3, r4  	;temp = 8y
				xor	r3, r1  	;temp = 8y xor x
				mov	r4, r3
				stm 	px, r1
				stm 	py, r2

DiamSq:
				ldm 	r0, dist ;r0 = d

				;hrd
				lmtx r5, r1, r2


				add 	r1, r0  ;x = x+2d, y=y
				add 	r1, r0  ;x = x+2d, y=y

				;hrd
				lmtx r7, r1, r2
				add 	r5, r7   ;r5 = A + B

				sub  	r1, r0
				sub  	r1, r0

				add 	r2, r0  ;x=x, y=y+2d
				add 	r2, r0  ;x=x, y=y+2d

				;hrd
				lmtx r7, r1, r2
				add 	r5, r7  ;r5 = A+B+C


				add 	r1, r0  ;x=x+2d, y=y+2d
				add 	r1, r0  ;x=x+2d, y=y+2d

				;hrd

				lmtx r7, r1, r2
				add 	r5, r7  ;r5 = A+B+C+D

				ldm	r6, rand
				push	r6
				ldi 	r3, 0xFFFC 	;r3 = .25
				and	r5, r3
				ror	r5, 2		;div r5
				add	r5, r6		;r5 = avg(A,B,C,D) + rand
				and	r5, r4		;r5 = avg(A,B,C,D) + rand AND Maskz
				pop	r6

				sub 	r1, r0
				sub 	r2, r0

				;hwrt
				smtx r5, r1, r2

				mov 	r6, r5   ;r6 = J
				add 	r5, r7  ;r5 = A+J


				sub 	r1, r0  ;x = x
				add 	r2, r0  ;y = y+2d

				;hrd
				lmtx r7, r1, r2
				add 	r5, r7   ;r5 = A+J+C


				sub 	r1, r0
				sub 	r2, r0  ;X=X-D, Y= Y+D

				;hrd
				lmtx r7, r1, r2
				add 	r5, r7   ;r5 = A+J+C+E

				ldm 	r7, rand
				ldi 	r3, 0xFFFC 	;r3 = .25
				and	r5, r3
				ror	r5, 2		;div r5
				add	r5, r7		;r5 = avg(A,B,C,D) + rand
				and	r5, r4		;r5 = avg(A,B,C,D) + rand AND Maskz
				add 	r1, r0  ;x=x, y=y+d

				;hwrt
				smtx	r5, r1, r2
				mov 	r5, r6  ;r5 = J


				SUB	R2, R0   ;X=X, Y=Y

				;hrd
				lmtx r7, r1, r2
				ADD 	R5, R7   ;R5 = A + J




				ADD 	r1, r0  ;x=x+2d, y=y
				ADD 	r1, r0  ;x=x+2d, y=y

				;hrd
				lmtx r7, r1, r2
				add 	r5, r7   ;A+B+J


				sub 	r1, r0
				sub 	r2, r0  ;x=x+d, y=y-d

				;hrd
				lmtx r7, r1, r2
				add 	r5, r7  ;A+B+F+J


				ldm 	r7, rand
				ldi 	r3, 0xFFFC 	;r3 = .25
				and	r5, r3
				ror	r5, 2		;div r5
				add	r5, r7		;r5 = avg(A,B,C,D) + rand
				and	r5, r4		;r5 = avg(A,B,C,D) + rand AND Maskz

				add 	r2, r0

				smtx r5, r1, r2

				mov 	r5, r6   ;r5 = J

				sub 	r1, r0
				add 	r2, r0
				add 	r2, r0

				;hrd
				lmtx r7, r1, r2
				add 	r5, r7  ;r5 = C+J


				add 	r1, r0  ;x=x+2d, y=y+2d
				add 	r1, r0  ;x=x+2d, y=y+2d

				;hrd
				lmtx r7, r1, r2
				add 	r5, r7   ;r5 = C+J+D


				sub 	r1, r0  ;x = x+d
				add 	r2, r0  ;y = y+3d

				;hrd
				lmtx r7, r1, r2
				add 	r5, r7   ;r5 = C+J+D+G


				ldm 	r7, rand
				ldi 	r3, 0xFFFC 	;r3 = .25
				and	r5, r3
				ror	r5, 2		;div r5
				add	r5, r7		;r5 = avg(A,B,C,D) + rand
				and	r5, r4		;r5 = avg(A,B,C,D) + rand AND Maskz


				sub 	r2, r0  ;y = y+2d
				;hwrt
				smtx	r5, r1, r2


				add 	r1, r0  ;x = x+2d, y = y + 2d

				;hrd
				lmtx r7, r1, r2
				add  	r6, r7  ;r6 = d+j


				sub 	r2, r0  ;x=x+2d, y=y
				sub 	r2, r0  ;x=x+2d, y=y

				;hrd
				lmtx r7, r1, r2
				add 	r6, r7  ;r6 = D+J+B


				add 	r1, r0
				add 	r2, r0   ;x=x+3d, y = y+d

				;hrd
				lmtx r7, r1, r2
				add 	r6, r7  ;r6 = D+J+B+H


				ldm 	r7, rand
				ldi 	r3, 0xFFFC 	;r3 = .25
				and	r6, r3
				ror	r6, 2		;div r5
				add	r6, r7		;r5 = avg(A,B,C,D) + rand
				and	r6, r4		;r5 = avg(A,B,C,D) + rand AND Maskz

				sub 	r1, r0

				;hwrt
				lmtx r7, r1, r2

				sub 	r1, r0  ;x=x
				sub 	r1, r0  ;x=x
				sub 	r2, r0  ;y=y

				ldi 	r6, size
				ldi 	r5, 2
				mul 	r5, r0   	;r5 = 2d
				add 	r2, r5  	;y = y+2d
				sub 	r6, r0  	;r6 = size - d


				cmp 	r6, r2		;size-d - y
				jns 	main3


main2:
				add 	r1, r5  	;x = x+2d
				cmp 	r6, r1
				jns 	main4


main1:
				ldi 	r5, 2
				div 	r0, r5
				stm 	dist, r0 	;d = d/2
				cmpi 	r0, 0
				jnz 	main0
				ldi 	r1, 1
				stm 	dist, r1
grid:
				ldm r0, dist
				ldi r6, size
				sub r6, r0  ;r6= PX = size - dist


grid0: 	ldi r7, size
				ldm r0, dist
				sub r7, r0  ;r7= PY = size - dist
grid1:
				stm px, r6
				stm py, r7

Project3D:
				push	r7
				ldi	r7, 0
range0:

				;hrd
				ldm 	r1, px
				ldm 	r2, py
				lmtx	r3, r1, r2

				ror	r1, shift	;ax = 2^(32-shift)*PX
				ror	r2, shift	;ay = 2^(32-shift)*PY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PDX
				ldi	r0, b3dx	;r0 = b3dx
				add	r0, r1		;r0 = b3dx + ax
				mov	r5, r2		;save ay to R5
				ldi	r4, tfact
				mul	r2, r4
				ldi	r4, tmask1
				and	r2, r4
				ror	r2, 1		;r2 = 3/2 ay
				sub	r0, r2		;bx = b3dx + ax - 3/2 ay
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;/PDX
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
range4:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PDY
				ldi	r0, b3dy
				sub	r0, r3		;r0 = b3dy - az
				and 	r1, r4
				ror	r1, 1		;r1 = 1/2 ax
				sub	r0, r1		;r0 = b3dy - az - 1/2 ax
				mov	r2, r5		;restore ay
				ldi	r4, tmask2
				and	r2, r4
				ror	r2, 2		;r2 = 1/4 ay
				sub	r0, r2		;by = b3dy - az - 1/2 ax - 1/4 ay
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PDY?
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

surfacePlot:
				push r6
				push r7
				ldm r0, bx2
				ldm r2, by2
				ldm r1, bx4
				ldm r3, by4


				ror r2, 16  ;r2=by2*2^16
				ror r3, 16  ;r2=by4*2^16


				mov r4, r3  ;r3=r4=by4*2^16
				sub r4, r2  ;r4=(by4-by2)*2^16
				mov r5, r1
				sub r5, r0  ;r5=bx4-bx2
				div r4, r5  ;r4=d42=(by4-by2)*2^16/(bx4-bx2)
				ldm r5, by3
				ror r5, 16  ;r5=by3*2^16
				sub r5, r2  ;r5=(by3-by2)*2^16
				ldm r3, bx3
				sub r3, r0  ;r3=bx3-bx2
				div r5, r3  ;r5=d32=(by3-by2)*2^16/(bx3-bx2)
				ldh r6, 0
				ldl r6, tmask3
				mov r3, r2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;First small triangle: init by2
; for x = bx2 to bx4; x++
;  line (x, by2+d42) to (x by2+d32)
;
;r0=bx2
;r1=bx4
;r2=by2*2^16
;r3=by2*2^16
;r4=d42*2^16
;r5=d32*2^16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rd0: 	stm x1, r0
			add r2, r4
			mov r7, r2
			ror r7, 16
			and r7, r6
			stm y1, r7
			add r3, r5
			mov r7, r3
			ror r7, 16
			and r7, r6
			stm y2, r7
			push r2
			ldm r2, y1  ;r2=y1
			cmp  r7, r2  ;test y2-y1
			jns vlp0					;VLPMark
			pixi	r0, r7, gray
			jmp	vlp0sk
vlp0:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r0, r2, gray
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
vlp0sk:
			adi r2, 1  ;y=y+1
			cmp  r7, r2
			jns vlp0  ;if End point > Y			;VLPMark
			pop r2
			adi r0, 1
			cmp r0, r1
			jnz rd0
			ldm r0, bx2
			stm x1, r0
			ldm r0, by2
			stm y1, r0
			ldm r0, bx4
			stm x2, r0
			ldm r0, by4
			stm y2, r0
dLn0:
			push	r2

lin0:	ldm	r0, y1		;r0=y1
			ldm	r2, y2		;r2=y2
			sub	r2, r0		;r2=y2-y1
			mul	r2, r2		;r2=r2**2
			ldm	r0, x1		;r0=x1
			ldm	r1, x2		;r1=x2
			sub	r1, r0		;r1=x2-x1
			mul	r1, r1		;r1=r1**2
			sub	r2, r1		;r2=(y2-y1)**2-(x2-x1)**2
			jns	ck10
			ldi	r2, 0x0000
			stm	steep, r2	;steep=0
			jmp	ck20

ck10:	ldi	r2, 0x0001
			stm	steep, r2	;steep=1
			ldm	r1, y1
			stm	x1, r1
			stm	y1, r0		;swap(x1, y1)
			ldm	r0, x2
			ldm	r1, y2
			stm	x2, r1
			stm	y2, r0		;swap(x2, y2)

ck20:	ldm 	r0, x1
			ldm	r1, x2
			sub 	r0, r1		;r0=x1-x2
			js	lp00
			jz	lp00
			ldm	r0, x1
			stm	x1, r1
			stm	x2, r0		;swap(x1, x2)
			ldm	r0, y1
			ldm	r1, y2
			stm	y1, r1
			stm	y2, r0		;swap(y1, y2)

lp00:	ldm	r1, x1
			ldm	r2, x2
			sub	r2, r1		;r2=x2-x1
			stm	deltax, r2
			ldm	r1, y1
			ldm	r2, y2
			sub	r2, r1		;r2=y2-y1
			jns	lp10
			ldi	r0, 0x0000
			sub	r0, r2		;r0=0-r2
			mov	r2, r0		;r2=abs(y2-y1)

lp10:	stm	deltay, r2
			ldm	r0, deltax
			ldh	r1, 0x0000
			ldl	r1, 0xffff
			ror	r0, 0x01
			and	r0, r1
			stm	error, r0
			mov	r4, r0
			ldm	r1, y1
			ldm	r2, y2
			sub 	r1, r2		;r1=y1-y2
			js	lp20
			ldi	r0, 0xFFFF
			stm	ystep, r0	;ystep=-1
			jmp	lp30

lp20:	ldi	r0, 0x0001
			stm	ystep, r0	;ystep=1

lp30:	ldm	r1, x2
			adi	r1, 0x0001
			stm	x2, r1		;x2=x2+1 for loop checking
			ldm	r1, x1		;r1=x=x1
			ldm	r2, y1		;r2=y=y1

lp40:	ldm	r0, steep
			adi	r0, 0x0000
			jz	draw0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r2, r1, ivory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			jmp	lp50
draw0:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r1, r2, ivory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lp50:	ldm	r4, error
			ldm	r0, deltay
			sub	r4, r0		;error=error-deltay
			jns	next0
			ldm	r0, ystep
			add	r2, r0		;y=y+ystep if error < 0
			ldm	r0, deltax
			add	r4, r0		;error=error+deltax
next0:
			stm	error, r4	;save back error
			adi	r1, 0x0001	;x=x+1
			ldm	r4, x2
			sub 	r4, r1
			jnz	lp40
lext:
			pop	r2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Second small triangle: contiue with by2
; for x = bx4 to bx3;  x++
;  line (x, by2+d34) to (x by2+d32)
;
;r0=bx4
;r1=bx3
;r2=by2*2^16
;r3=by2*2^16
;r4=d34*2^16
;r5=d32*2^16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
scnd:	ldm r4, by3
			ldm r0, by4
			ror r4, 16  ;r4=by3*2^16
			ror r0, 16  ;r0=by4*2^16
			sub r4, r0  ;r4=(by3-by4)*2^16
			ldm r0, bx3
			ldm r7, bx4
			sub r0, r7  ;r0=bx3-bx4
			div r4, r0  ;r4=d34=(by3-by4)*2^16/(bx3-bx4)
			ldm r0, bx4
			ldm r1, bx3
rd1:
			add r2, r4
			mov r7, r2
			ror r7, 16
			and r7, r6
			stm y1, r7

			add r3, r5
			mov r7, r3
			ror r7, 16
			and r7, r6
			stm y2, r7

			push r2
			ldm r2, y1  ;r2=y1
			cmp  r7, r2  ;test y2-y1
			jns vlp1
			pixi	r0, r7, gray
			jmp	vlp1sk
vlp1:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r0, r2, gray
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
vlp1sk:
			adi r2, 1  ;y=y+1
			cmp  r7, r2
			jns vlp1  ;if End point > Y
			pop r2
			adi r0, 1
			cmp r0, r1
			jnz rd1
			ldm r0, bx3
			stm x1, r0
			ldm r0, by3
			stm y1, r0
			ldm r0, bx4
			stm x2, r0
			ldm r0, by4
			stm y2, r0
dLn1:

lin1:	ldm	r0, y1		;r0=y1
			ldm	r2, y2		;r2=y2
			sub	r2, r0		;r2=y2-y1
			mul	r2, r2		;r2=r2**2
			ldm	r0, x1		;r0=x1
			ldm	r1, x2		;r1=x2
			sub	r1, r0		;r1=x2-x1
			mul	r1, r1		;r1=r1**2
			sub	r2, r1		;r2=(y2-y1)**2-(x2-x1)**2
			jns	ck11
			ldi	r2, 0x0000
			stm	steep, r2	;steep=0
			jmp	ck21

ck11:	ldi	r2, 0x0001
			stm	steep, r2	;steep=1
			ldm	r1, y1
			stm	x1, r1
			stm	y1, r0		;swap(x1, y1)
			ldm	r0, x2
			ldm	r1, y2
			stm	x2, r1
			stm	y2, r0		;swap(x2, y2)

ck21:	ldm 	r0, x1
			ldm	r1, x2
			sub 	r0, r1		;r0=x1-x2
			js	lp01
			jz	lp01
			ldm	r0, x1
			stm	x1, r1
			stm	x2, r0		;swap(x1, x2)
			ldm	r0, y1
			ldm	r1, y2
			stm	y1, r1
			stm	y2, r0		;swap(y1, y2)

lp01:	ldm	r1, x1
			ldm	r2, x2
			sub	r2, r1		;r2=x2-x1
			stm	deltax, r2
			ldm	r1, y1
			ldm	r2, y2
			sub	r2, r1		;r2=y2-y1
			jns	lp11
			ldi	r0, 0x0000
			sub	r0, r2		;r0=0-r2
			mov	r2, r0		;r2=abs(y2-y1)

lp11:	stm	deltay, r2
			ldm	r0, deltax
			ldh	r1, 0x0000
			ldl	r1, 0xffff
			ror	r0, 0x01
			and	r0, r1
			stm	error, r0
			mov	r4, r0
			ldm	r1, y1
			ldm	r2, y2
			sub 	r1, r2		;r1=y1-y2
			js	lp21
			ldi	r0, 0xFFFF
			stm	ystep, r0	;ystep=-1
			jmp	lp31

lp21:	ldi	r0, 0x0001
			stm	ystep, r0	;ystep=1

lp31:	ldm	r1, x2
			adi	r1, 0x0001
			stm	x2, r1		;x2=x2+1 for loop checking
			ldm	r1, x1		;r1=x=x1
			ldm	r2, y1		;r2=y=y1

lp41:	ldm	r0, steep
			adi	r0, 0x0000
			jz	draw1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r2, r1, ivory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			jmp	lp51
draw1:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r1, r2, ivory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lp51:	ldm	r4, error
			ldm	r0, deltay
			sub	r4, r0		;error=error-deltay
			jns	next1
			ldm	r0, ystep
			add	r2, r0		;y=y+ystep if error < 0
			ldm	r0, deltax
			add	r4, r0		;error=error+deltax
next1:
			stm	error, r4	;save back error
			adi	r1, 0x0001	;x=x+1
			ldm	r4, x2
			sub 	r4, r1
			jnz	lp41

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Third small triangle: init by2
; for x = bx2 to bx1;  x++
;  line (x, by2+d12) to (x by2+d32)
;
;r0=bx2
;r1=bx1
;r2=by2*2^16
;r3=by2*2^16
;r4=d12*2^16
;r5=d32*2^16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			ldm r4, by1
			ldm r0, by2
			ror r4, 16  ;r4=by1*2^16
			ror r0, 16  ;r0=by2*2^16
			sub r4, r0  ;r4=(by1-by2)*2^16
			ldm r1, bx1
			ldm r0, bx2
			sub r1, r0  ;r1=bx1-bx2
			div r4, r1  ;r4=d12=(by1-by2)*2^16/(bx1-bx2)
			ldm r1, bx1
			ldm r2, by2
			ror r2, 16
			mov r3, r2
rd2:	stm x1, r0
			add r2, r4
			mov r7, r2
			ror r7, 16
			and r7, r6
			stm y1, r7
			add r3, r5
			mov r7, r3
			ror r7, 16
			and r7, r6
			stm y2, r7




			push r2
			ldm r2, y1  ;r2=y1
			cmp  r7, r2  ;test y2-y1
			jns vlp2
			mov r2, r7  ;swap(y1, y2)
			ldm r7, y1  ;if y2 < y1
vlp2:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r0, r2, gray
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			adi r2, 1  ;y=y+1
			cmp  r7, r2
			jns vlp2  ;if End point > Y
			pop r2


			adi r0, 1
			cmp r0, r1
			jnz rd2
			ldm r0, bx2
			stm x1, r0
			ldm r0, by2
			stm y1, r0
			ldm r0, bx1
			stm x2, r0
			ldm r0, by1
			stm y2, r0
dLn2:
			push	r2

lin2:	ldm	r0, y1		;r0=y1
			ldm	r2, y2		;r2=y2
			sub	r2, r0		;r2=y2-y1
			mul	r2, r2		;r2=r2**2
			ldm	r0, x1		;r0=x1
			ldm	r1, x2		;r1=x2
			sub	r1, r0		;r1=x2-x1
			mul	r1, r1		;r1=r1**2
			sub	r2, r1		;r2=(y2-y1)**2-(x2-x1)**2
			jns	ck12
			ldi	r2, 0x0000
			stm	steep, r2	;steep=0
			jmp	ck22

ck12:	ldi	r2, 0x0001
			stm	steep, r2	;steep=1
			ldm	r1, y1
			stm	x1, r1
			stm	y1, r0		;swap(x1, y1)
			ldm	r0, x2
			ldm	r1, y2
			stm	x2, r1
			stm	y2, r0		;swap(x2, y2)

ck22:	ldm 	r0, x1
			ldm	r1, x2
			sub 	r0, r1		;r0=x1-x2
			js	lp02
			jz	lp02
			ldm	r0, x1
			stm	x1, r1
			stm	x2, r0		;swap(x1, x2)
			ldm	r0, y1
			ldm	r1, y2
			stm	y1, r1
			stm	y2, r0		;swap(y1, y2)

lp02:	ldm	r1, x1
			ldm	r2, x2
			sub	r2, r1		;r2=x2-x1
			stm	deltax, r2
			ldm	r1, y1
			ldm	r2, y2
			sub	r2, r1		;r2=y2-y1
			jns	lp12
			ldi	r0, 0x0000
			sub	r0, r2		;r0=0-r2
			mov	r2, r0		;r2=abs(y2-y1)

lp12:	stm	deltay, r2
			ldm	r0, deltax
			ldh	r1, 0x0000
			ldl	r1, 0xffff
			ror	r0, 0x01
			and	r0, r1
			stm	error, r0
			mov	r4, r0
			ldm	r1, y1
			ldm	r2, y2
			sub 	r1, r2		;r1=y1-y2
			js	lp22
			ldi	r0, 0xFFFF
			stm	ystep, r0	;ystep=-1
			jmp	lp32

lp22:	ldi	r0, 0x0001
			stm	ystep, r0	;ystep=1

lp32:	ldm	r1, x2
			adi	r1, 0x0001
			stm	x2, r1		;x2=x2+1 for loop checking
			ldm	r1, x1		;r1=x=x1
			ldm	r2, y1		;r2=y=y1

lp42:	ldm	r0, steep
			adi	r0, 0x0000
			jz	draw2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r2, r1, ivory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			jmp	lp52
draw2:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r1, r2, ivory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lp52:	ldm	r4, error
			ldm	r0, deltay
			sub	r4, r0		;error=error-deltay
			jns	next2
			ldm	r0, ystep
			add	r2, r0		;y=y+ystep if error < 0
			ldm	r0, deltax
			add	r4, r0		;error=error+deltax
next2:
			stm	error, r4	;save back error
			adi	r1, 0x0001	;x=x+1
			ldm	r4, x2
			sub 	r4, r1
			jnz	lp42
lext:
			pop	r2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Fourth small triangle: contiue with by2
; for x = bx1 to bx3;  x++
;  line (x, by2+d31) to (x by2+d32)
;
;r0=bx1
;r1=bx3
;r2=by2*2^16
;r3=by2*2^16
;r4=d31*2^16
;r5=d32*2^16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			ldm r4, by3
			ldm r0, by1
			ror r4, 16  ;r4=by3*2^16
			ror r0, 16  ;r0=by1*2^16
			sub r4, r0  ;r4=(by3-by1)*2^16
			ldm r0, bx3
			ldm r7, bx1
			sub r0, r7  ;r0=bx3-bx1
			div r4, r0  ;r4=d31=(by3-by1)*2^16/(bx3-bx1)
			ldm r0, bx1
			ldm r1, bx3
rd3: 	stm x1, r0
			add r2, r4
			mov r7, r2
			ror r7, 16
			and r7, r6
			stm y1, r7

			add r3, r5
			mov r7, r3
			ror r7, 16
			and r7, r6
			stm y2, r7

			push r2
			ldm r2, y1  ;r2=y1
			cmp  r7, r2  ;test y2-y1
			jns vlp3
			mov r2, r7  ;swap(y1, y2)
			ldm r7, y1  ;if y2 < y1
vlp3:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r0, r2, gray
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			adi r2, 1  ;y=y+1
			cmp  r7, r2
			jns vlp3  ;if End point > Y
			pop r2

			adi r0, 1
			cmp r0, r1
			jnz rd3

			ldm r0, bx1
			stm x1, r0
			ldm r0, by1
			stm y1, r0
			ldm r0, bx3
			stm x2, r0
			ldm r0, by3
			stm y2, r0
dLn3:
			push	r2

lin3:	ldm	r0, y1		;r0=y1
			ldm	r2, y2		;r2=y2
			sub	r2, r0		;r2=y2-y1
			mul	r2, r2		;r2=r2**2
			ldm	r0, x1		;r0=x1
			ldm	r1, x2		;r1=x2
			sub	r1, r0		;r1=x2-x1
			mul	r1, r1		;r1=r1**2
			sub	r2, r1		;r2=(y2-y1)**2-(x2-x1)**2
			jns	ck13
			ldi	r2, 0x0000
			stm	steep, r2	;steep=0
			jmp	ck23

ck13:	ldi	r2, 0x0001
			stm	steep, r2	;steep=1
			ldm	r1, y1
			stm	x1, r1
			stm	y1, r0		;swap(x1, y1)
			ldm	r0, x2
			ldm	r1, y2
			stm	x2, r1
			stm	y2, r0		;swap(x2, y2)

ck23:	ldm 	r0, x1
			ldm	r1, x2
			sub 	r0, r1		;r0=x1-x2
			js	lp03
			jz	lp03
			ldm	r0, x1
			stm	x1, r1
			stm	x2, r0		;swap(x1, x2)
			ldm	r0, y1
			ldm	r1, y2
			stm	y1, r1
			stm	y2, r0		;swap(y1, y2)

lp03:	ldm	r1, x1
			ldm	r2, x2
			sub	r2, r1		;r2=x2-x1
			stm	deltax, r2
			ldm	r1, y1
			ldm	r2, y2
			sub	r2, r1		;r2=y2-y1
			jns	lp13
			ldi	r0, 0x0000
			sub	r0, r2		;r0=0-r2
			mov	r2, r0		;r2=abs(y2-y1)

lp13:	stm	deltay, r2
			ldm	r0, deltax
			ldh	r1, 0x0000
			ldl	r1, 0xffff
			ror	r0, 0x01
			and	r0, r1
			stm	error, r0
			mov	r4, r0
			ldm	r1, y1
			ldm	r2, y2
			sub 	r1, r2		;r1=y1-y2
			js	lp23
			ldi	r0, 0xFFFF
			stm	ystep, r0	;ystep=-1
			jmp	lp33

lp23:	ldi	r0, 0x0001
			stm	ystep, r0	;ystep=1

lp33:	ldm	r1, x2
			adi	r1, 0x0001
			stm	x2, r1		;x2=x2+1 for loop checking
			ldm	r1, x1		;r1=x=x1
			ldm	r2, y1		;r2=y=y1

lp43:	ldm	r0, steep
			adi	r0, 0x0000
			jz	draw3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r2, r1, ivory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			jmp	lp53
draw3:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r1, r2, ivory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lp53:	ldm	r4, error
			ldm	r0, deltay
			sub	r4, r0		;error=error-deltay
			jns	next3
			ldm	r0, ystep
			add	r2, r0		;y=y+ystep if error < 0
			ldm	r0, deltax
			add	r4, r0		;error=error+deltax
next3:
			stm	error, r4	;save back error
			adi	r1, 0x0001	;x=x+1
			ldm	r4, x2
			sub 	r4, r1
			jnz	lp43
lext:
			pop	r2

			ldm r0, bx2
			stm x1, r0
			ldm r0, by2
			stm y1, r0
			ldm r0, bx3
			stm x2, r0
			ldm r0, by3
			stm y2, r0
dLn4:
			push	r2

lin4:	ldm	r0, y1		;r0=y1
			ldm	r2, y2		;r2=y2
			sub	r2, r0		;r2=y2-y1
			mul	r2, r2		;r2=r2**2
			ldm	r0, x1		;r0=x1
			ldm	r1, x2		;r1=x2
			sub	r1, r0		;r1=x2-x1
			mul	r1, r1		;r1=r1**2
			sub	r2, r1		;r2=(y2-y1)**2-(x2-x1)**2
			jns	ck14
			ldi	r2, 0x0000
			stm	steep, r2	;steep=0
			jmp	ck24

ck14:	ldi	r2, 0x0001
			stm	steep, r2	;steep=1
			ldm	r1, y1
			stm	x1, r1
			stm	y1, r0		;swap(x1, y1)
			ldm	r0, x2
			ldm	r1, y2
			stm	x2, r1
			stm	y2, r0		;swap(x2, y2)

ck24:	ldm 	r0, x1
			ldm	r1, x2
			sub 	r0, r1		;r0=x1-x2
			js	lp04
			jz	lp04
			ldm	r0, x1
			stm	x1, r1
			stm	x2, r0		;swap(x1, x2)
			ldm	r0, y1
			ldm	r1, y2
			stm	y1, r1
			stm	y2, r0		;swap(y1, y2)

lp04:	ldm	r1, x1
			ldm	r2, x2
			sub	r2, r1		;r2=x2-x1
			stm	deltax, r2
			ldm	r1, y1
			ldm	r2, y2
			sub	r2, r1		;r2=y2-y1
			jns	lp14
			ldi	r0, 0x0000
			sub	r0, r2		;r0=0-r2
			mov	r2, r0		;r2=abs(y2-y1)

lp14:	stm	deltay, r2
			ldm	r0, deltax
			ldh	r1, 0x0000
			ldl	r1, 0xffff
			ror	r0, 0x01
			and	r0, r1
			stm	error, r0
			mov	r4, r0
			ldm	r1, y1
			ldm	r2, y2
			sub 	r1, r2		;r1=y1-y2
			js	lp24
			ldi	r0, 0xFFFF
			stm	ystep, r0	;ystep=-1
			jmp	lp34

lp24:	ldi	r0, 0x0001
			stm	ystep, r0	;ystep=1

lp34:	ldm	r1, x2
			adi	r1, 0x0001
			stm	x2, r1		;x2=x2+1 for loop checking
			ldm	r1, x1		;r1=x=x1
			ldm	r2, y1		;r2=y=y1

lp44:	ldm	r0, steep
			adi	r0, 0x0000
			jz	draw4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r2, r1, ivory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			jmp	lp54
draw4:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			pixi	r1, r2, ivory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lp54:	ldm	r4, error
			ldm	r0, deltay
			sub	r4, r0		;error=error-deltay
			jns	next4
			ldm	r0, ystep
			add	r2, r0		;y=y+ystep if error < 0
			ldm	r0, deltax
			add	r4, r0		;error=error+deltax
next4:
			stm	error, r4	;save back error
			adi	r1, 0x0001	;x=x+1
			ldm	r4, x2
			sub 	r4, r1
			jnz	lp44
lext:
			pop	r2

			pop r7
			pop r6
			ldm r0, dist;

			sub r7, r0  ;PY = PY - dist
			jns grid1
			sub r6, r0  ;PX = PX - dist
			jns grid0

			ldm r5, time0
			call 	SevenSegRun
done: jmp 	done
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;height map: PX = 0 to 32, PY = 0 to 32
; addr = hmap + 64* Y + X
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define hmap 0x10000  ;height map in ext memory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;zero out the grid
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SevenSegRun:
	push r5  ;print decimal numbers
	push r6
	push r7


	ldi r0, 0
	ldi r7, 16
	ldm r5, time0


pn0:
	ldh r6, 0x0098 ;r6=current divisor=10000000
	ldl r6, 0x9680 ;10^7 digit
	call pns
	ldh r6, 0x000F ;r6=current divisor=1000000
	ldl r6, 0x4240 ;10^6 digit
	call pns
	ldh r6, 0x0001 ;r6=current divisor=100000
	ldl r6, 0x86A0 ;10^5 digit
	call pns
	ldi r6, 0x2710 ;r6=current divisor=10000, 10^4 digit
	call pns
	ldi r6, 0x03E8 ;r6=current divisor=1000, 10^3 digit
	call pns
	ldi r6, 0x0064 ;r6=current divisor=100, 10^2 digit
	call pns

	ldi r6, 0x000A ;r6=current divisor=10, 10^1 digit
	call pns
	add r0, r5  ;print the ones digit
	stm outport, r0

	pop r7
	pop r6
	pop r5
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;subroutine examines and prints one digit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
pns: 	div r5, r6
	add r0, r5
	mul r0, r7
pns4:	mov  r5, r6
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Lib below

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;cg: clear the graphic video screen
;address: 0x100000 -- 0x17FFFF
;no input or output
;no register is affected
;support 800x480 (1024x512=512K) resolution
;Hardware 6-bit c0lor emulating software 8-bit c0lor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cg:		push	r0		;save affected regs
			push	r1
			push 	r2
			push	r3
			ldi	r1, 0		;r1=black c0lor
			ldh	r0, 0x0010	;
			ldl	r0, 0x0000	;r0=00100000
			ldi	r3, 480		;Y count
gc0:	ldi	r2, 800		;X count
gc1:	str	r0, r1		;write blank to graphic video
			adi	r0, 1		;inc address
			adi	r2, 0xFFFF	;dec X count
			jnz	gc1
			adi	r0, 224		;advance to next line (1024-800)
			adi	r3, 0xFFFF	;dec Y count
			jnz	gc0
			pop	r3		;restore registers
			pop	r2
			pop	r1
			pop	r0
			ret

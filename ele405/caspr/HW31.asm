.arch rhody		;use rhody.cfg
.outfmt hex		;output format is hex
.memsize 2048		;specify 2K words
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Memory addresses for Rhody System I/O devices
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define kcntrl	0xf0000	;keyboard control register
.define kascii	0xf0001	;keyboard ASCII code
.define time0	0xf0003	;Timer 0
.define inport 	0xf0005	;GPIO read address
.define outport	0xf0005	;GPIO write address
.define rand	0xf0006	;random number
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
.define gx	0x0908	;graphic video X (0 - 639)
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
;SHA256 Program variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.define count	0x0800	;hash count
.define m512	0x0810	;16 words M 0x810-0x81F
.define buffer	0x0820	;64 words W 0x820-0x85F
.define wva	0x0860	;working variable a
.define wvb	0x0861	;working variable b
.define wvc	0x0862	;working variable c
.define wvd	0x0863	;working variable d
.define wve	0x0864	;working variable e
.define wvf	0x0865	;working variable f
.define wvg	0x0866	;working variable g
.define wvh	0x0867	;working variable h
.define h0	0x0868	;hash value 0
.define h1	0x0869	;hash value 1
.define h2	0x086A	;hash value 2
.define h3	0x086B	;hash value 3
.define h4	0x086C	;hash value 4
.define h5	0x086D	;hash value 5
.define h6	0x086E	;hash value 6
.define h7	0x086F	;hash value 7
.define t1	0x0870	;temporary value 1
.define t2	0x0871	;temporary value 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;SHA256_verification
;Use randomly generated message for SHA-256
;count how many hashes per seconds
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Prepare the random inputs;;;;;;;;;;;;;;;;;;;;;;;;
SHA256_verification:
	sys	clear
	ldi	r5, m512	;pointer to message buffer
	ldi	r2, 16
	ldi	r0, 0x1	
	stm	rand, r0
sha2:	ldm	r0, rand	;get random number
	str	r5, r0	
	adi	r5, 1
	adi	r2, 0xFFFF
	jnz	sha2
	ldi	r0, 0
	stm	time0, r0	;start timer	
	call	HASH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldi	r0, 0
	stm	tx, r0
	stm	ty, r0
	ldm	r0, time0
	stm	tnum, r0
	sys	printn
	ldi	r0, 0xD
	stm	tascii, r0
	sys	putchar
	
	ldi	r0, buffer
	adi	r0, 0x10
	ldr	r1, r0	
	stm 	tnum, r1
	sys	printn
	ldi	r0, 0xD
	stm	tascii, r0
	sys	putchar	

	adi	r0, 0x10
	ldr	r1, r0	
	stm 	tnum, r1
	sys	printn
	ldi	r0, 0xD
	stm	tascii, r0
	sys	putchar

	adi	r0, 0xF
	ldr	r1, r0	
	stm 	tnum, r1
	sys	printn
	
halt:	jmp	halt		;print count and stop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;HASH subroutine to generate the 256-bit message digest from 
;M = m512 is the 16-words input buffer
;W = buffer is the 64-word message schedule 
;h0 to h7 = hash values
;wva, wvb, ..., wvh = working variables a to h
;K = K256 the 64-words constant
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HASH:	ldi	r5, m512	;copy M to W(0..15)
	ldi	r7, buffer
	ldi	r2, 16
sch1:	ldr	r0, r5
	str	r7, r0		
	adi	r5, 1
	adi	r7, 1
	adi	r2, 0xFFFF
	jnz	sch1
;Process the next 48 entrances
;R7 is currently the pointer to buffer (W)
	ldi	r2, 48		;loop count
sch2:	mov	r1, r7
	adi	r1, 0xFFFE	;t-2
	ldr	r0, r1		;r0=W(t-2)
	call	sig1		;r0=sig1(W(t-2))
	mov	r1, r7
	adi	r1, 0xFFF9	;t-7
	ldr	r3, r1		;r3=W(t-7)
	add	r3, r0		;r3=sig1(W(t-2))+W(t-7)
	mov	r1, r7
	adi	r1, 0xFFF1	;t-15
	ldr	r0, r1		;r0=W(t-15)
	call	sig0		;r0=sig0(W(t-15))
	mov	r1, r7
	adi	r1, 0xFFF0	;t-16
	ldr	r4, r1		;r4=W(t-16)
	add	r4, r0		;r4=sig1(W(t-15))+W(t-16)
	add	r3, r4		
;;;;;;;;;r3=sig1(W(t-2))+W(t-7)+sig1(W(t-15))+W(t-16)
	str	r7, r3
	adi	r7, 1
	adi	r2, 0xFFFF
	jnz	sch2
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Function sig0(x)
;input: r0=x
;output: r0=sig0(x)
;affects: r4, r5, r6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sig0:	mov	r5, r0
	mov	r6, r0
	ror	r0, 7		;r0=ROTR^7(x)
	ror	r5, 18		;r5=ROTR^18(x)
	ror	r6, 3		;r6=ROTR^3(x)
	ldh	r4, 0x1FFF	
	ldl	r4, 0xFFFF	;mask out 3 MSB
	and	r6, r4		;r6=SHR^3(x)
	xor	r0, r5
	xor	r0, r6
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Function sig1(x)
;input: r0=x
;output: r0=sig1(x)
;affects: r4, r5, r6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sig1:	mov	r5, r0
	mov	r6, r0
	ror	r0, 17		;r0=ROTR^17(x)
	ror	r5, 19		;r5=ROTR^19(x)
	ror	r6, 10		;r6=ROTR^10(x)
	ldh	r4, 0x003F	
	ldl	r4, 0xFFFF	;mask out 10 MSB
	and	r6, r4		;r6=SHR^10(x)
	xor	r0, r5
	xor	r0, r6
	ret

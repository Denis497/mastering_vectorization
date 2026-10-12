	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 26, 0	sdk_version 26, 0
	.globl	_transpose_naive                ; -- Begin function transpose_naive
	.p2align	2
_transpose_naive:                       ; @transpose_naive
	.cfi_startproc
; %bb.0:
	cbz	x2, LBB0_35
; %bb.1:
	cmp	x2, #7
	b.hi	LBB0_29
; %bb.2:
	ldr	d0, [x0]
	str	d0, [x1]
	cmp	x2, #1
	b.eq	LBB0_35
; %bb.3:
	ldr	d0, [x0, #8]
	str	d0, [x1, x3, lsl #3]
	cmp	x2, #2
	b.eq	LBB0_9
; %bb.4:
	ldr	d0, [x0, #16]
	lsl	x8, x3, #4
	str	d0, [x1, x8]
	cmp	x2, #3
	b.eq	LBB0_9
; %bb.5:
	ldr	d0, [x0, #24]
	mov	w8, #24                         ; =0x18
	mul	x8, x3, x8
	str	d0, [x1, x8]
	cmp	x2, #4
	b.eq	LBB0_9
; %bb.6:
	ldr	d0, [x0, #32]
	lsl	x8, x3, #5
	str	d0, [x1, x8]
	cmp	x2, #5
	b.eq	LBB0_9
; %bb.7:
	ldr	d0, [x0, #40]
	mov	w8, #40                         ; =0x28
	mul	x8, x3, x8
	str	d0, [x1, x8]
	cmp	x2, #6
	b.eq	LBB0_9
; %bb.8:
	ldr	d0, [x0, #48]
	mov	w8, #48                         ; =0x30
	mul	x8, x3, x8
	str	d0, [x1, x8]
	cmp	x2, #1
	b.eq	LBB0_35
LBB0_9:
	lsl	x8, x3, #3
	add	x10, x0, x8
	ldr	d0, [x10]
	mov	x9, x1
	str	d0, [x9, #8]!
	ldr	d0, [x10, #8]
	str	d0, [x9, x8]
	cmp	x2, #2
	b.eq	LBB0_35
; %bb.10:
	ldr	d0, [x10, #16]
	lsl	x8, x3, #4
	str	d0, [x9, x8]
	cmp	x2, #3
	b.eq	LBB0_15
; %bb.11:
	ldr	d0, [x10, #24]
	mov	w11, #24                        ; =0x18
	mul	x11, x3, x11
	str	d0, [x9, x11]
	cmp	x2, #4
	b.eq	LBB0_15
; %bb.12:
	ldr	d0, [x10, #32]
	lsl	x11, x3, #5
	str	d0, [x9, x11]
	cmp	x2, #5
	b.eq	LBB0_15
; %bb.13:
	ldr	d0, [x10, #40]
	mov	w11, #40                        ; =0x28
	mul	x11, x3, x11
	str	d0, [x9, x11]
	cmp	x2, #6
	b.eq	LBB0_15
; %bb.14:
	ldr	d0, [x10, #48]
	mov	w10, #48                        ; =0x30
	mul	x10, x3, x10
	str	d0, [x9, x10]
	cmp	x2, #2
	b.eq	LBB0_35
LBB0_15:
	add	x10, x0, x8
	ldr	d0, [x10]
	mov	x9, x1
	str	d0, [x9, #16]!
	ldr	d0, [x10, #8]
	str	d0, [x9, x3, lsl #3]
	ldr	d0, [x10, #16]
	str	d0, [x9, x8]
	cmp	x2, #3
	b.eq	LBB0_35
; %bb.16:
	ldr	d0, [x10, #24]
	mov	w11, #24                        ; =0x18
	mul	x11, x3, x11
	str	d0, [x9, x11]
	cmp	x2, #4
	b.eq	LBB0_20
; %bb.17:
	ldr	d0, [x10, #32]
	lsl	x11, x3, #5
	str	d0, [x9, x11]
	cmp	x2, #5
	b.eq	LBB0_20
; %bb.18:
	ldr	d0, [x10, #40]
	mov	w11, #40                        ; =0x28
	mul	x11, x3, x11
	str	d0, [x9, x11]
	cmp	x2, #6
	b.eq	LBB0_20
; %bb.19:
	ldr	d0, [x10, #48]
	mov	w10, #48                        ; =0x30
	mul	x10, x3, x10
	str	d0, [x9, x10]
	cmp	x2, #3
	b.eq	LBB0_35
LBB0_20:
	add	x9, x3, x3, lsl #1
	lsl	x10, x9, #3
	add	x12, x0, x10
	ldr	d0, [x12]
	mov	x11, x1
	str	d0, [x11, #24]!
	ldr	d0, [x12, #8]
	str	d0, [x11, x3, lsl #3]
	ldr	d0, [x12, #16]
	str	d0, [x11, x8]
	ldr	d0, [x12, #24]
	str	d0, [x11, x10]
	cmp	x2, #4
	b.eq	LBB0_35
; %bb.21:
	ldr	d0, [x12, #32]
	lsl	x10, x3, #5
	str	d0, [x11, x10]
	cmp	x2, #5
	b.eq	LBB0_24
; %bb.22:
	ldr	d0, [x12, #40]
	mov	w13, #40                        ; =0x28
	mul	x13, x3, x13
	str	d0, [x11, x13]
	cmp	x2, #6
	b.eq	LBB0_24
; %bb.23:
	ldr	d0, [x12, #48]
	mov	w12, #48                        ; =0x30
	mul	x12, x3, x12
	str	d0, [x11, x12]
	cmp	x2, #4
	b.eq	LBB0_35
LBB0_24:
	add	x12, x0, x10
	ldr	d0, [x12]
	mov	x11, x1
	str	d0, [x11, #32]!
	ldr	d0, [x12, #8]
	str	d0, [x11, x3, lsl #3]
	ldr	d0, [x12, #16]
	str	d0, [x11, x8]
	ldr	d0, [x12, #24]
	mov	w13, #24                        ; =0x18
	mul	x13, x3, x13
	str	d0, [x11, x13]
	ldr	d0, [x12, #32]
	str	d0, [x11, x10]
	cmp	x2, #5
	b.eq	LBB0_35
; %bb.25:
	ldr	d0, [x12, #40]
	mov	w13, #40                        ; =0x28
	mul	x13, x3, x13
	str	d0, [x11, x13]
	cmp	x2, #6
	b.eq	LBB0_27
; %bb.26:
	ldr	d0, [x12, #48]
	mov	w12, #48                        ; =0x30
	mul	x12, x3, x12
	str	d0, [x11, x12]
	cmp	x2, #5
	b.eq	LBB0_35
LBB0_27:
	add	x11, x3, x3, lsl #2
	lsl	x13, x11, #3
	add	x11, x0, x13
	ldr	d0, [x11]
	mov	x12, x1
	str	d0, [x12, #40]!
	ldr	d0, [x11, #8]
	str	d0, [x12, x3, lsl #3]
	ldr	d0, [x11, #16]
	str	d0, [x12, x8]
	ldr	d0, [x11, #24]
	mov	w14, #24                        ; =0x18
	mul	x14, x3, x14
	str	d0, [x12, x14]
	ldr	d0, [x11, #32]
	str	d0, [x12, x10]
	ldr	d0, [x11, #40]
	str	d0, [x12, x13]
	cmp	x2, #6
	b.eq	LBB0_35
; %bb.28:
	ldr	d0, [x11, #48]
	lsl	x9, x9, #4
	str	d0, [x12, x9]
	add	x11, x0, x9
	ldr	d0, [x11]
	str	d0, [x1, #48]!
	ldr	d0, [x11, #8]
	str	d0, [x1, x3, lsl #3]
	ldr	d0, [x11, #16]
	str	d0, [x1, x8]
	ldr	d0, [x11, #24]
	mov	w8, #24                         ; =0x18
	mul	x8, x3, x8
	str	d0, [x1, x8]
	ldr	d0, [x11, #32]
	str	d0, [x1, x10]
	ldr	d0, [x11, #40]
	mov	w8, #40                         ; =0x28
	mul	x8, x3, x8
	str	d0, [x1, x8]
	ldr	d0, [x11, #48]
	str	d0, [x1, x9]
	ret
LBB0_29:
	cmp	x3, #1
	b.ne	LBB0_36
; %bb.30:
	sub	x8, x1, x0
	cmp	x8, #63
	b.hi	LBB0_40
; %bb.31:
	mov	x8, #0                          ; =0x0
	lsl	x9, x3, #3
LBB0_32:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_33 Depth 2
	mov	x10, #0                         ; =0x0
	mov	x11, x1
LBB0_33:                                ;   Parent Loop BB0_32 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x0, x10, lsl #3]
	str	d0, [x11]
	add	x10, x10, #1
	add	x11, x11, x9
	cmp	x2, x10
	b.ne	LBB0_33
; %bb.34:                               ;   in Loop: Header=BB0_32 Depth=1
	add	x8, x8, #1
	add	x1, x1, #8
	add	x0, x0, x9
	cmp	x8, x2
	b.ne	LBB0_32
LBB0_35:
	ret
LBB0_36:
	mov	x8, #0                          ; =0x0
	lsl	x9, x3, #3
LBB0_37:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_38 Depth 2
	mov	x10, #0                         ; =0x0
	mov	x11, x1
LBB0_38:                                ;   Parent Loop BB0_37 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x0, x10, lsl #3]
	str	d0, [x11]
	add	x10, x10, #1
	add	x11, x11, x9
	cmp	x2, x10
	b.ne	LBB0_38
; %bb.39:                               ;   in Loop: Header=BB0_37 Depth=1
	add	x8, x8, #1
	add	x1, x1, #8
	add	x0, x0, x9
	cmp	x8, x2
	b.ne	LBB0_37
	b	LBB0_35
LBB0_40:
	and	x8, x2, #0xfffffffffffffff8
	cmp	x8, x2
	b.ne	LBB0_45
; %bb.41:
	mov	x9, #0                          ; =0x0
	add	x10, x0, #32
	lsl	x11, x3, #3
	add	x12, x1, #32
LBB0_42:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_43 Depth 2
	mov	x13, x12
	mov	x14, x10
	mov	x15, x8
LBB0_43:                                ;   Parent Loop BB0_42 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x14, #-32]
	ldp	q2, q3, [x14], #64
	stp	q0, q1, [x13, #-32]
	stp	q2, q3, [x13], #64
	subs	x15, x15, #8
	b.ne	LBB0_43
; %bb.44:                               ;   in Loop: Header=BB0_42 Depth=1
	add	x9, x9, #1
	add	x10, x10, x11
	add	x12, x12, #8
	cmp	x9, x2
	b.ne	LBB0_42
	b	LBB0_35
LBB0_45:
	mov	x9, #0                          ; =0x0
	add	x10, x0, #32
	lsl	x11, x3, #3
	add	x12, x1, #32
	lsr	x13, x2, #3
	mul	x13, x3, x13
	add	x13, x1, x13, lsl #6
LBB0_46:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_47 Depth 2
                                        ;     Child Loop BB0_49 Depth 2
	mov	x14, x12
	mov	x15, x10
	mov	x16, x8
LBB0_47:                                ;   Parent Loop BB0_46 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x15, #-32]
	ldp	q2, q3, [x15], #64
	stp	q0, q1, [x14, #-32]
	stp	q2, q3, [x14], #64
	subs	x16, x16, #8
	b.ne	LBB0_47
; %bb.48:                               ;   in Loop: Header=BB0_46 Depth=1
	mov	x14, x13
	mov	x15, x8
LBB0_49:                                ;   Parent Loop BB0_46 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x0, x15, lsl #3]
	str	d0, [x14]
	add	x15, x15, #1
	add	x14, x14, x11
	cmp	x2, x15
	b.ne	LBB0_49
; %bb.50:                               ;   in Loop: Header=BB0_46 Depth=1
	add	x9, x9, #1
	add	x10, x10, x11
	add	x12, x12, #8
	add	x13, x13, #8
	add	x0, x0, x11
	cmp	x9, x2
	b.ne	LBB0_46
	b	LBB0_35
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function main
lCPI1_0:
	.quad	0                               ; 0x0
	.quad	1                               ; 0x1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #224
	stp	d11, d10, [sp, #96]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #112]              ; 16-byte Folded Spill
	stp	x28, x27, [sp, #128]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #144]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #160]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #176]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #192]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #208]            ; 16-byte Folded Spill
	add	x29, sp, #208
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	cmp	w0, #2
	b.lt	LBB1_3
; %bb.1:
	mov	x21, x1
	mov	x22, x0
	ldr	x0, [x1, #8]
	mov	x1, #0                          ; =0x0
	mov	w2, #10                         ; =0xa
	bl	_strtoull
	mov	x19, x0
	cmp	w22, #2
	b.ne	LBB1_52
; %bb.2:
	mov	x0, #0                          ; =0x0
	mov	w8, #5                          ; =0x5
	str	w8, [sp, #68]                   ; 4-byte Folded Spill
	b	LBB1_4
LBB1_3:
	mov	x0, #0                          ; =0x0
	mov	w8, #5                          ; =0x5
	str	w8, [sp, #68]                   ; 4-byte Folded Spill
	mov	w19, #8192                      ; =0x2000
LBB1_4:
	add	x8, x0, x19
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
	mul	x8, x19, x8
	lsl	x23, x8, #3
	add	x8, x23, #127
	and	x24, x8, #0xffffffffffffff80
	mov	w0, #128                        ; =0x80
	mov	x1, x24
	bl	_aligned_alloc
	cbz	x0, LBB1_80
; %bb.5:
	mov	x25, x0
	mov	w0, #128                        ; =0x80
	mov	x1, x24
	bl	_aligned_alloc
	str	x0, [sp, #72]                   ; 8-byte Folded Spill
	cbz	x0, LBB1_80
; %bb.6:
	cbz	x19, LBB1_35
; %bb.7:
	cmp	x19, #8
	b.hs	LBB1_46
; %bb.8:
	str	xzr, [x25]
	cmp	x19, #1
	b.eq	LBB1_35
; %bb.9:
	mov	x8, #4607182418800017408        ; =0x3ff0000000000000
	str	x8, [x25, #8]
	cmp	x19, #2
	b.eq	LBB1_15
; %bb.10:
	mov	x8, #4611686018427387904        ; =0x4000000000000000
	str	x8, [x25, #16]
	cmp	x19, #3
	b.eq	LBB1_15
; %bb.11:
	mov	x8, #4613937818241073152        ; =0x4008000000000000
	str	x8, [x25, #24]
	cmp	x19, #4
	b.eq	LBB1_15
; %bb.12:
	mov	x8, #4616189618054758400        ; =0x4010000000000000
	str	x8, [x25, #32]
	cmp	x19, #5
	b.eq	LBB1_15
; %bb.13:
	mov	x8, #4617315517961601024        ; =0x4014000000000000
	str	x8, [x25, #40]
	cmp	x19, #6
	b.eq	LBB1_15
; %bb.14:
	mov	x8, #4618441417868443648        ; =0x4018000000000000
	str	x8, [x25, #48]
	cmp	x19, #1
	b.eq	LBB1_35
LBB1_15:
	ucvtf	d0, x19
	add	x8, x19, #1
	ucvtf	d1, x8
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	add	x8, x25, x8, lsl #3
	stp	d0, d1, [x8]
	cmp	x19, #2
	b.eq	LBB1_35
; %bb.16:
	add	x9, x19, #2
	ucvtf	d0, x9
	str	d0, [x8, #16]
	cmp	x19, #3
	b.eq	LBB1_21
; %bb.17:
	add	x9, x19, #3
	ucvtf	d0, x9
	str	d0, [x8, #24]
	cmp	x19, #4
	b.eq	LBB1_21
; %bb.18:
	add	x9, x19, #4
	ucvtf	d0, x9
	str	d0, [x8, #32]
	cmp	x19, #5
	b.eq	LBB1_21
; %bb.19:
	add	x9, x19, #5
	ucvtf	d0, x9
	str	d0, [x8, #40]
	cmp	x19, #6
	b.eq	LBB1_21
; %bb.20:
	add	x9, x19, #6
	ucvtf	d0, x9
	str	d0, [x8, #48]
	cmp	x19, #2
	b.eq	LBB1_35
LBB1_21:
	lsl	x8, x19, #1
	ucvtf	d0, x8
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	add	x9, x25, x9, lsl #4
	mov	w10, #1                         ; =0x1
	bfi	x10, x19, #1, #62
	ucvtf	d1, x10
	stp	d0, d1, [x9]
	add	x10, x8, #2
	ucvtf	d0, x10
	str	d0, [x9, #16]
	cmp	x19, #3
	b.eq	LBB1_35
; %bb.22:
	add	x10, x8, #3
	ucvtf	d0, x10
	str	d0, [x9, #24]
	cmp	x19, #4
	b.eq	LBB1_26
; %bb.23:
	add	x10, x8, #4
	ucvtf	d0, x10
	str	d0, [x9, #32]
	cmp	x19, #5
	b.eq	LBB1_26
; %bb.24:
	add	x10, x8, #5
	ucvtf	d0, x10
	str	d0, [x9, #40]
	cmp	x19, #6
	b.eq	LBB1_26
; %bb.25:
	add	x8, x8, #6
	ucvtf	d0, x8
	str	d0, [x9, #48]
	cmp	x19, #3
	b.eq	LBB1_35
LBB1_26:
	add	x8, x19, x19, lsl #1
	mov	w9, #24                         ; =0x18
	ucvtf	d0, x8
	add	x10, x8, #1
	ucvtf	d1, x10
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	madd	x9, x10, x9, x25
	stp	d0, d1, [x9]
	add	x10, x8, #2
	ucvtf	d0, x10
	add	x10, x8, #3
	ucvtf	d1, x10
	stp	d0, d1, [x9, #16]
	cmp	x19, #4
	b.eq	LBB1_35
; %bb.27:
	add	x10, x8, #4
	ucvtf	d0, x10
	str	d0, [x9, #32]
	cmp	x19, #5
	b.eq	LBB1_30
; %bb.28:
	add	x10, x8, #5
	ucvtf	d0, x10
	str	d0, [x9, #40]
	cmp	x19, #6
	b.eq	LBB1_30
; %bb.29:
	add	x10, x8, #6
	ucvtf	d0, x10
	str	d0, [x9, #48]
	cmp	x19, #4
	b.eq	LBB1_35
LBB1_30:
	lsl	x9, x19, #2
	ucvtf	d0, x9
	mov	w10, #1                         ; =0x1
	bfi	x10, x19, #2, #61
	ucvtf	d1, x10
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	add	x10, x25, x10, lsl #5
	mov	w11, #2                         ; =0x2
	bfi	x11, x19, #2, #61
	ucvtf	d2, x11
	stp	d0, d1, [x10]
	mov	w11, #3                         ; =0x3
	bfi	x11, x19, #2, #61
	ucvtf	d0, x11
	stp	d2, d0, [x10, #16]
	add	x11, x9, #4
	ucvtf	d0, x11
	str	d0, [x10, #32]
	cmp	x19, #5
	b.eq	LBB1_35
; %bb.31:
	add	x11, x9, #5
	ucvtf	d0, x11
	str	d0, [x10, #40]
	cmp	x19, #6
	b.eq	LBB1_33
; %bb.32:
	add	x9, x9, #6
	ucvtf	d0, x9
	str	d0, [x10, #48]
	cmp	x19, #5
	b.eq	LBB1_35
LBB1_33:
	add	x9, x19, x19, lsl #2
	mov	w10, #40                        ; =0x28
	ldr	x11, [sp, #56]                  ; 8-byte Folded Reload
	madd	x10, x11, x10, x25
	ucvtf	d0, x9
	add	x11, x9, #1
	ucvtf	d1, x11
	add	x11, x9, #2
	ucvtf	d2, x11
	add	x11, x9, #3
	ucvtf	d3, x11
	stp	d0, d1, [x10]
	stp	d2, d3, [x10, #16]
	add	x11, x9, #4
	ucvtf	d0, x11
	add	x11, x9, #5
	ucvtf	d1, x11
	stp	d0, d1, [x10, #32]
	cmp	x19, #6
	b.eq	LBB1_35
; %bb.34:
	add	x9, x9, #6
	ucvtf	d0, x9
	str	d0, [x10, #48]
	lsl	x9, x8, #1
	mov	w10, #48                        ; =0x30
	ldr	x11, [sp, #56]                  ; 8-byte Folded Reload
	madd	x10, x11, x10, x25
	ucvtf	d0, x9
	mov	w11, #1                         ; =0x1
	bfi	x11, x8, #1, #63
	ucvtf	d1, x11
	add	x8, x9, #2
	ucvtf	d2, x8
	stp	d0, d1, [x10]
	add	x8, x9, #3
	ucvtf	d0, x8
	stp	d2, d0, [x10, #16]
	add	x8, x9, #4
	ucvtf	d0, x8
	add	x8, x9, #5
	ucvtf	d1, x8
	stp	d0, d1, [x10, #32]
	add	x8, x9, #6
	ucvtf	d0, x8
	str	d0, [x10, #48]
LBB1_35:
	mul	x8, x19, x19
	ucvtf	d0, x8
	fmov	d1, #8.00000000
	fmul	d0, d0, d1
	mov	x8, #4517110426252607488        ; =0x3eb0000000000000
	fmov	d1, x8
	fmul	d0, d0, d1
	str	x19, [sp]
	str	d0, [sp, #8]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	mov	x1, x23
	bl	_bzero
	ldr	w8, [sp, #68]                   ; 4-byte Folded Reload
	cmp	w8, #1
	str	x25, [sp, #48]                  ; 8-byte Folded Spill
	b.lt	LBB1_45
; %bb.36:
	cbz	x19, LBB1_54
; %bb.37:
	cmp	x19, #4
	b.hs	LBB1_71
; %bb.38:
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	lsl	x20, x9, #4
	ldr	x8, [sp, #72]                   ; 8-byte Folded Reload
	add	x21, x8, #8
	add	x22, x25, x20
	add	x23, x8, #16
	movi	d9, #0000000000000000
	mov	x8, #36074                      ; =0x8cea
	movk	x8, #14752, lsl #16
	movk	x8, #15961, lsl #32
	movk	x8, #17961, lsl #48
	fmov	d8, x8
	mov	x8, #54933                      ; =0xd695
	movk	x8, #59430, lsl #16
	movk	x8, #11787, lsl #32
	movk	x8, #15889, lsl #48
	fmov	d10, x8
	ldr	w24, [sp, #68]                  ; 4-byte Folded Reload
	add	x25, x25, x9, lsl #3
	b	LBB1_40
LBB1_39:                                ;   in Loop: Header=BB1_40 Depth=1
	scvtf	d0, x9
	scvtf	d1, x8
	fmadd	d11, d0, d10, d1
	add	x1, sp, #80
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	d0, d1, [sp, #80]
	scvtf	d0, d0
	scvtf	d1, d1
	fmadd	d0, d1, d10, d0
	fsub	d0, d0, d11
	fcmp	d0, d8
	fcsel	d8, d0, d8, mi
	fadd	d9, d9, d0
	subs	w24, w24, #1
	b.eq	LBB1_57
LBB1_40:                                ; =>This Inner Loop Header: Depth=1
	add	x1, sp, #80
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	x8, x9, [sp, #80]
	ldr	x10, [sp, #48]                  ; 8-byte Folded Reload
	ldr	d0, [x10]
	ldr	x11, [sp, #72]                  ; 8-byte Folded Reload
	str	d0, [x11]
	cmp	x19, #1
	b.eq	LBB1_39
; %bb.41:                               ;   in Loop: Header=BB1_40 Depth=1
	ldr	d0, [x10, #8]
	ldr	x11, [sp, #72]                  ; 8-byte Folded Reload
	ldr	x12, [sp, #56]                  ; 8-byte Folded Reload
	str	d0, [x11, x12, lsl #3]
	cmp	x19, #2
	b.eq	LBB1_43
; %bb.42:                               ;   in Loop: Header=BB1_40 Depth=1
	ldr	d0, [x10, #16]
	ldr	x10, [sp, #72]                  ; 8-byte Folded Reload
	str	d0, [x10, x20]
	cmp	x19, #1
	b.eq	LBB1_39
LBB1_43:                                ;   in Loop: Header=BB1_40 Depth=1
	ldp	d0, d1, [x25]
	str	d0, [x21]
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	str	d1, [x21, x10, lsl #3]
	cmp	x19, #2
	b.eq	LBB1_39
; %bb.44:                               ;   in Loop: Header=BB1_40 Depth=1
	ldr	d0, [x25, #16]
	str	d0, [x21, x20]
	ldp	d0, d1, [x22]
	str	d0, [x23]
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	str	d1, [x23, x10, lsl #3]
	ldr	d0, [x22, #16]
	str	d0, [x23, x20]
	b	LBB1_39
LBB1_45:
	movi	d9, #0000000000000000
	mov	x8, #36074                      ; =0x8cea
	movk	x8, #14752, lsl #16
	movk	x8, #15961, lsl #32
	movk	x8, #17961, lsl #48
	fmov	d8, x8
	b	LBB1_56
LBB1_46:
	mov	x8, #0                          ; =0x0
	and	x9, x19, #0xfffffffffffffff8
	add	x10, x25, #32
	ldr	x11, [sp, #56]                  ; 8-byte Folded Reload
	lsl	x11, x11, #3
	sub	x12, x19, x9
	lsr	x13, x19, #3
	mov	w14, #2                         ; =0x2
	dup.2d	v0, x14
	mov	w14, #4                         ; =0x4
	dup.2d	v1, x14
	mov	w14, #6                         ; =0x6
	dup.2d	v2, x14
Lloh2:
	adrp	x14, lCPI1_0@PAGE
Lloh3:
	ldr	q3, [x14, lCPI1_0@PAGEOFF]
	mov	w14, #8                         ; =0x8
	add	x13, x25, x13, lsl #6
	dup.2d	v4, x14
	mov	x14, x9
	b	LBB1_48
LBB1_47:                                ;   in Loop: Header=BB1_48 Depth=1
	add	x8, x8, #1
	add	x10, x10, x11
	add	x13, x13, x11
	add	x14, x14, x19
	cmp	x8, x19
	b.eq	LBB1_35
LBB1_48:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_49 Depth 2
                                        ;     Child Loop BB1_51 Depth 2
	mul	x15, x8, x19
	dup.2d	v5, x15
	mov	x15, x9
	mov	x16, x10
	mov.16b	v6, v3
LBB1_49:                                ;   Parent Loop BB1_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add.2d	v7, v6, v5
	add.2d	v16, v7, v0
	add.2d	v17, v7, v1
	add.2d	v18, v7, v2
	ucvtf.2d	v7, v7
	ucvtf.2d	v16, v16
	ucvtf.2d	v17, v17
	ucvtf.2d	v18, v18
	stp	q7, q16, [x16, #-32]
	stp	q17, q18, [x16], #64
	add.2d	v6, v6, v4
	subs	x15, x15, #8
	b.ne	LBB1_49
; %bb.50:                               ;   in Loop: Header=BB1_48 Depth=1
	mov	x15, x14
	mov	x16, x13
	mov	x17, x12
	cmp	x19, x9
	b.eq	LBB1_47
LBB1_51:                                ;   Parent Loop BB1_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ucvtf	d5, x15
	str	d5, [x16], #8
	add	x15, x15, #1
	subs	x17, x17, #1
	b.ne	LBB1_51
	b	LBB1_47
LBB1_52:
	ldr	x0, [x21, #16]
	bl	_atoi
	str	w0, [sp, #68]                   ; 4-byte Folded Spill
	cmp	w22, #4
	b.lo	LBB1_79
; %bb.53:
	ldr	x0, [x21, #24]
	mov	x1, #0                          ; =0x0
	mov	w2, #10                         ; =0xa
	bl	_strtoull
	b	LBB1_4
LBB1_54:
	movi	d9, #0000000000000000
	mov	x8, #36074                      ; =0x8cea
	movk	x8, #14752, lsl #16
	movk	x8, #15961, lsl #32
	movk	x8, #17961, lsl #48
	fmov	d8, x8
	mov	x8, #54933                      ; =0xd695
	movk	x8, #59430, lsl #16
	movk	x8, #11787, lsl #32
	movk	x8, #15889, lsl #48
	fmov	d10, x8
	ldr	w20, [sp, #68]                  ; 4-byte Folded Reload
LBB1_55:                                ; =>This Inner Loop Header: Depth=1
	add	x1, sp, #80
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	d0, d1, [sp, #80]
	scvtf	d0, d0
	scvtf	d1, d1
	fmadd	d11, d1, d10, d0
	add	x1, sp, #80
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	d0, d1, [sp, #80]
	scvtf	d0, d0
	scvtf	d1, d1
	fmadd	d0, d1, d10, d0
	fsub	d0, d0, d11
	fcmp	d0, d8
	fcsel	d8, d0, d8, mi
	fadd	d9, d9, d0
	subs	w20, w20, #1
	b.ne	LBB1_55
LBB1_56:
	cbz	x19, LBB1_69
LBB1_57:
	cmp	x19, #2
	b.hs	LBB1_63
; %bb.58:
	mov	x9, #0                          ; =0x0
	mov	x8, #0                          ; =0x0
	ldp	x20, x10, [sp, #48]             ; 16-byte Folded Reload
	lsl	x10, x10, #3
	ldr	x11, [sp, #72]                  ; 8-byte Folded Reload
	mov	x12, x20
LBB1_59:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_60 Depth 2
	mov	x13, #0                         ; =0x0
	mov	x14, x11
LBB1_60:                                ;   Parent Loop BB1_59 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x12, x13, lsl #3]
	ldr	d1, [x14]
	fcmp	d1, d0
	cinc	x8, x8, ne
	add	x13, x13, #1
	add	x14, x14, x10
	cmp	x19, x13
	b.ne	LBB1_60
; %bb.61:                               ;   in Loop: Header=BB1_59 Depth=1
	add	x9, x9, #1
	add	x12, x12, x10
	add	x11, x11, #8
	cmp	x9, x19
	b.ne	LBB1_59
LBB1_62:
Lloh4:
	adrp	x9, l_.str.4@PAGE
Lloh5:
	add	x9, x9, l_.str.4@PAGEOFF
Lloh6:
	adrp	x10, l_.str.5@PAGE
Lloh7:
	add	x10, x10, l_.str.5@PAGEOFF
	cmp	x8, #0
	csel	x8, x10, x9, eq
	b	LBB1_70
LBB1_63:
	mov	x9, #0                          ; =0x0
	mov	x8, #0                          ; =0x0
	and	x10, x19, #0xfffffffffffffffe
	ldp	x20, x17, [sp, #48]             ; 16-byte Folded Reload
	lsl	x11, x17, #3
	lsl	x12, x17, #4
	add	x13, x20, #8
	sub	x14, x19, x10
	lsr	x16, x19, #1
	add	x15, x20, x16, lsl #4
	mul	x16, x16, x17
	lsl	x16, x16, #4
	ldr	x17, [sp, #72]                  ; 8-byte Folded Reload
	b	LBB1_65
LBB1_64:                                ;   in Loop: Header=BB1_65 Depth=1
	add	x9, x9, #1
	add	x17, x17, #8
	add	x13, x13, x11
	add	x15, x15, x11
	cmp	x9, x19
	b.eq	LBB1_62
LBB1_65:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_66 Depth 2
                                        ;     Child Loop BB1_68 Depth 2
	mov	x0, #0                          ; =0x0
	mov	x1, x10
	mov	x2, x13
	mov	x3, x17
LBB1_66:                                ;   Parent Loop BB1_65 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x3]
	ldr	d1, [x3, x11]
	ldp	d2, d3, [x2, #-8]
	fcmp	d0, d2
	cinc	x8, x8, ne
	fcmp	d1, d3
	cinc	x0, x0, ne
	add	x3, x3, x12
	add	x2, x2, #16
	subs	x1, x1, #2
	b.ne	LBB1_66
; %bb.67:                               ;   in Loop: Header=BB1_65 Depth=1
	add	x8, x0, x8
	mov	x0, x16
	mov	x1, x15
	mov	x2, x14
	cmp	x19, x10
	b.eq	LBB1_64
LBB1_68:                                ;   Parent Loop BB1_65 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x17, x0]
	ldr	d1, [x1], #8
	fcmp	d0, d1
	cinc	x8, x8, ne
	add	x0, x0, x11
	subs	x2, x2, #1
	b.ne	LBB1_68
	b	LBB1_64
LBB1_69:
Lloh8:
	adrp	x8, l_.str.5@PAGE
Lloh9:
	add	x8, x8, l_.str.5@PAGEOFF
	ldr	x20, [sp, #48]                  ; 8-byte Folded Reload
LBB1_70:
	ucvtf	d0, x19
	fadd	d1, d0, d0
	fmul	d0, d1, d0
	fmov	d1, #8.00000000
	fmul	d0, d0, d1
	fdiv	d0, d0, d8
	mov	x9, #225833675390976            ; =0xcd6500000000
	movk	x9, #16845, lsl #48
	fmov	d1, x9
	fdiv	d0, d0, d1
	ldr	w9, [sp, #68]                   ; 4-byte Folded Reload
	scvtf	d1, w9
	fdiv	d1, d9, d1
	str	x8, [sp, #32]
Lloh10:
	adrp	x8, l_.str.1@PAGE
Lloh11:
	add	x8, x8, l_.str.1@PAGEOFF
	str	x8, [sp]
	stp	d8, d1, [sp, #8]
	str	d0, [sp, #24]
Lloh12:
	adrp	x0, l_.str.3@PAGE
Lloh13:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
Lloh14:
	adrp	x8, ___stdoutp@GOTPAGE
Lloh15:
	ldr	x8, [x8, ___stdoutp@GOTPAGEOFF]
Lloh16:
	ldr	x0, [x8]
	bl	_fflush
	mov	x0, x20
	bl	_free
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	bl	_free
	mov	w0, #0                          ; =0x0
	ldp	x29, x30, [sp, #208]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #192]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #176]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #160]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #144]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #128]            ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #112]              ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #224
	ret
LBB1_71:
	mov	w23, #0                         ; =0x0
	and	x24, x19, #0xfffffffffffffffc
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	add	x8, x10, x10, lsl #1
	lsl	x26, x8, #3
	lsl	x27, x10, #5
	lsl	x28, x10, #4
	lsl	x20, x10, #3
	add	x8, x25, #16
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	sub	x21, x19, x24
	lsr	x8, x19, #2
	mov	x9, #36074                      ; =0x8cea
	movk	x9, #14752, lsl #16
	movk	x9, #15961, lsl #32
	movk	x9, #17961, lsl #48
	fmov	d8, x9
	mov	x9, #54933                      ; =0xd695
	movk	x9, #59430, lsl #16
	movk	x9, #11787, lsl #32
	movk	x9, #15889, lsl #48
	fmov	d10, x9
	mul	x9, x8, x10
	lsl	x22, x9, #5
	add	x25, x25, x8, lsl #5
	movi	d9, #0000000000000000
	b	LBB1_73
LBB1_72:                                ;   in Loop: Header=BB1_73 Depth=1
	scvtf	d0, x10
	scvtf	d1, x8
	fmadd	d11, d0, d10, d1
	add	x1, sp, #80
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	d0, d1, [sp, #80]
	scvtf	d0, d0
	scvtf	d1, d1
	fmadd	d0, d1, d10, d0
	fsub	d0, d0, d11
	fcmp	d0, d8
	fcsel	d8, d0, d8, mi
	fadd	d9, d9, d0
	add	w23, w23, #1
	ldr	w8, [sp, #68]                   ; 4-byte Folded Reload
	cmp	w23, w8
	b.eq	LBB1_57
LBB1_73:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_75 Depth 2
                                        ;       Child Loop BB1_76 Depth 3
                                        ;       Child Loop BB1_78 Depth 3
	add	x1, sp, #80
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	mov	x9, #0                          ; =0x0
	ldp	x8, x10, [sp, #80]
	mov	x11, x25
	ldr	x12, [sp, #40]                  ; 8-byte Folded Reload
	ldr	x13, [sp, #72]                  ; 8-byte Folded Reload
	b	LBB1_75
LBB1_74:                                ;   in Loop: Header=BB1_75 Depth=2
	add	x9, x9, #1
	add	x13, x13, #8
	add	x12, x12, x20
	add	x11, x11, x20
	cmp	x9, x19
	b.eq	LBB1_72
LBB1_75:                                ;   Parent Loop BB1_73 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_76 Depth 3
                                        ;       Child Loop BB1_78 Depth 3
	mov	x14, x12
	mov	x15, x24
	mov	x16, x13
LBB1_76:                                ;   Parent Loop BB1_73 Depth=1
                                        ;     Parent Loop BB1_75 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldp	d0, d1, [x14, #-16]
	ldp	d2, d3, [x14], #32
	str	d0, [x16]
	str	d1, [x16, x20]
	str	d2, [x16, x28]
	str	d3, [x16, x26]
	add	x16, x16, x27
	subs	x15, x15, #4
	b.ne	LBB1_76
; %bb.77:                               ;   in Loop: Header=BB1_75 Depth=2
	mov	x14, x11
	mov	x15, x22
	mov	x16, x21
	cmp	x19, x24
	b.eq	LBB1_74
LBB1_78:                                ;   Parent Loop BB1_73 Depth=1
                                        ;     Parent Loop BB1_75 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x14], #8
	str	d0, [x13, x15]
	add	x15, x15, x20
	subs	x16, x16, #1
	b.ne	LBB1_78
	b	LBB1_74
LBB1_79:
	mov	x0, #0                          ; =0x0
	b	LBB1_4
LBB1_80:
Lloh17:
	adrp	x8, ___stderrp@GOTPAGE
Lloh18:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh19:
	ldr	x0, [x8]
	str	x24, [sp]
Lloh20:
	adrp	x1, l_.str.2@PAGE
Lloh21:
	add	x1, x1, l_.str.2@PAGEOFF
	bl	_fprintf
	mov	w0, #1                          ; =0x1
	bl	_exit
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpLdrGotLdr	Lloh14, Lloh15, Lloh16
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpLdrGotLdr	Lloh17, Lloh18, Lloh19
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"N = %zu, \320\274\320\260\321\202\321\200\320\270\321\206\320\260 %.0f \320\234\320\221\n"

l_.str.1:                               ; @.str.1
	.asciz	"naive"

l_.str.2:                               ; @.str.2
	.asciz	"\320\275\320\265 \321\203\320\264\320\260\320\273\320\276\321\201\321\214 \320\262\321\213\320\264\320\265\320\273\320\270\321\202\321\214 %zu \320\261\320\260\320\271\321\202\n"

l_.str.3:                               ; @.str.3
	.asciz	"%-28s  min %8.4f s  avg %8.4f s  %6.2f GB/s  %s\n"

l_.str.4:                               ; @.str.4
	.asciz	"\320\236\320\250\320\230\320\221\320\232\320\220"

l_.str.5:                               ; @.str.5
	.asciz	"ok"

.subsections_via_symbols

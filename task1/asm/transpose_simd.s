	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 26, 0	sdk_version 26, 0
	.globl	_transpose_simd_rows            ; -- Begin function transpose_simd_rows
	.p2align	2
_transpose_simd_rows:                   ; @transpose_simd_rows
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
	ldr	d0, [x0, x3, lsl #3]
	str	d0, [x1, #8]
	cmp	x2, #2
	b.eq	LBB0_9
; %bb.4:
	lsl	x8, x3, #4
	ldr	d0, [x0, x8]
	str	d0, [x1, #16]
	cmp	x2, #3
	b.eq	LBB0_9
; %bb.5:
	mov	w8, #24                         ; =0x18
	mul	x8, x3, x8
	ldr	d0, [x0, x8]
	str	d0, [x1, #24]
	cmp	x2, #4
	b.eq	LBB0_9
; %bb.6:
	lsl	x8, x3, #5
	ldr	d0, [x0, x8]
	str	d0, [x1, #32]
	cmp	x2, #5
	b.eq	LBB0_9
; %bb.7:
	mov	w8, #40                         ; =0x28
	mul	x8, x3, x8
	ldr	d0, [x0, x8]
	str	d0, [x1, #40]
	cmp	x2, #6
	b.eq	LBB0_9
; %bb.8:
	mov	w8, #48                         ; =0x30
	mul	x8, x3, x8
	ldr	d0, [x0, x8]
	str	d0, [x1, #48]
	cmp	x2, #1
	b.eq	LBB0_35
LBB0_9:
	mov	x9, x0
	ldr	d0, [x9, #8]!
	lsl	x8, x3, #3
	ldr	d1, [x9, x8]
	add	x10, x1, x8
	stp	d0, d1, [x10]
	cmp	x2, #2
	b.eq	LBB0_35
; %bb.10:
	lsl	x8, x3, #4
	ldr	d0, [x9, x8]
	str	d0, [x10, #16]
	cmp	x2, #3
	b.eq	LBB0_15
; %bb.11:
	mov	w11, #24                        ; =0x18
	mul	x11, x3, x11
	ldr	d0, [x9, x11]
	str	d0, [x10, #24]
	cmp	x2, #4
	b.eq	LBB0_15
; %bb.12:
	lsl	x11, x3, #5
	ldr	d0, [x9, x11]
	str	d0, [x10, #32]
	cmp	x2, #5
	b.eq	LBB0_15
; %bb.13:
	mov	w11, #40                        ; =0x28
	mul	x11, x3, x11
	ldr	d0, [x9, x11]
	str	d0, [x10, #40]
	cmp	x2, #6
	b.eq	LBB0_15
; %bb.14:
	mov	w11, #48                        ; =0x30
	mul	x11, x3, x11
	ldr	d0, [x9, x11]
	str	d0, [x10, #48]
	cmp	x2, #2
	b.eq	LBB0_35
LBB0_15:
	mov	x9, x0
	ldr	d0, [x9, #16]!
	add	x10, x1, x8
	ldr	d1, [x9, x3, lsl #3]
	stp	d0, d1, [x10]
	ldr	d0, [x9, x8]
	str	d0, [x10, #16]
	cmp	x2, #3
	b.eq	LBB0_35
; %bb.16:
	mov	w11, #24                        ; =0x18
	mul	x11, x3, x11
	ldr	d0, [x9, x11]
	str	d0, [x10, #24]
	cmp	x2, #4
	b.eq	LBB0_20
; %bb.17:
	lsl	x11, x3, #5
	ldr	d0, [x9, x11]
	str	d0, [x10, #32]
	cmp	x2, #5
	b.eq	LBB0_20
; %bb.18:
	mov	w11, #40                        ; =0x28
	mul	x11, x3, x11
	ldr	d0, [x9, x11]
	str	d0, [x10, #40]
	cmp	x2, #6
	b.eq	LBB0_20
; %bb.19:
	mov	w11, #48                        ; =0x30
	mul	x11, x3, x11
	ldr	d0, [x9, x11]
	str	d0, [x10, #48]
	cmp	x2, #3
	b.eq	LBB0_35
LBB0_20:
	mov	x11, x0
	ldr	d0, [x11, #24]!
	add	x9, x3, x3, lsl #1
	lsl	x10, x9, #3
	add	x12, x1, x10
	ldr	d1, [x11, x3, lsl #3]
	ldr	d2, [x11, x8]
	stp	d0, d1, [x12]
	ldr	d0, [x11, x10]
	stp	d2, d0, [x12, #16]
	cmp	x2, #4
	b.eq	LBB0_35
; %bb.21:
	lsl	x10, x3, #5
	ldr	d0, [x11, x10]
	str	d0, [x12, #32]
	cmp	x2, #5
	b.eq	LBB0_24
; %bb.22:
	mov	w13, #40                        ; =0x28
	mul	x13, x3, x13
	ldr	d0, [x11, x13]
	str	d0, [x12, #40]
	cmp	x2, #6
	b.eq	LBB0_24
; %bb.23:
	mov	w13, #48                        ; =0x30
	mul	x13, x3, x13
	ldr	d0, [x11, x13]
	str	d0, [x12, #48]
	cmp	x2, #4
	b.eq	LBB0_35
LBB0_24:
	mov	x11, x0
	ldr	d0, [x11, #32]!
	add	x12, x1, x10
	ldr	d1, [x11, x3, lsl #3]
	stp	d0, d1, [x12]
	ldr	d0, [x11, x8]
	mov	w13, #24                        ; =0x18
	mul	x13, x3, x13
	ldr	d1, [x11, x13]
	stp	d0, d1, [x12, #16]
	ldr	d0, [x11, x10]
	str	d0, [x12, #32]
	cmp	x2, #5
	b.eq	LBB0_35
; %bb.25:
	mov	w13, #40                        ; =0x28
	mul	x13, x3, x13
	ldr	d0, [x11, x13]
	str	d0, [x12, #40]
	cmp	x2, #6
	b.eq	LBB0_27
; %bb.26:
	mov	w13, #48                        ; =0x30
	mul	x13, x3, x13
	ldr	d0, [x11, x13]
	str	d0, [x12, #48]
	cmp	x2, #5
	b.eq	LBB0_35
LBB0_27:
	mov	x11, x0
	ldr	d0, [x11, #40]!
	add	x12, x3, x3, lsl #2
	lsl	x13, x12, #3
	ldr	d1, [x11, x3, lsl #3]
	add	x12, x1, x13
	stp	d0, d1, [x12]
	ldr	d0, [x11, x8]
	mov	w14, #24                        ; =0x18
	mul	x14, x3, x14
	ldr	d1, [x11, x14]
	ldr	d2, [x11, x10]
	stp	d0, d1, [x12, #16]
	ldr	d0, [x11, x13]
	stp	d2, d0, [x12, #32]
	cmp	x2, #6
	b.eq	LBB0_35
; %bb.28:
	lsl	x9, x9, #4
	ldr	d0, [x11, x9]
	str	d0, [x12, #48]
	ldr	d0, [x0, #48]!
	add	x11, x1, x9
	ldr	d1, [x0, x3, lsl #3]
	ldr	d2, [x0, x8]
	mov	w8, #24                         ; =0x18
	mul	x8, x3, x8
	ldr	d3, [x0, x8]
	ldr	d4, [x0, x10]
	stp	d0, d1, [x11]
	mov	w8, #40                         ; =0x28
	mul	x8, x3, x8
	ldr	d0, [x0, x8]
	stp	d2, d3, [x11, #16]
	stp	d4, d0, [x11, #32]
	ldr	d0, [x0, x9]
	str	d0, [x11, #48]
	ret
LBB0_29:
	cmp	x3, #1
	b.ne	LBB0_36
; %bb.30:
	and	x8, x2, #0xfffffffffffffff8
	cmp	x8, x2
	b.ne	LBB0_40
; %bb.31:
	mov	x9, #0                          ; =0x0
	add	x10, x0, #32
	add	x11, x1, #32
	lsl	x12, x3, #3
LBB0_32:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_33 Depth 2
	mov	x13, x11
	mov	x14, x10
	mov	x15, x8
LBB0_33:                                ;   Parent Loop BB0_32 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x14, #-32]
	ldp	q2, q3, [x14], #64
	stp	q0, q1, [x13, #-32]
	stp	q2, q3, [x13], #64
	subs	x15, x15, #8
	b.ne	LBB0_33
; %bb.34:                               ;   in Loop: Header=BB0_32 Depth=1
	add	x9, x9, #1
	add	x10, x10, #8
	add	x11, x11, x12
	cmp	x9, x2
	b.ne	LBB0_32
LBB0_35:
	ret
LBB0_36:
	mov	x8, #0                          ; =0x0
	lsl	x9, x3, #3
LBB0_37:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_38 Depth 2
	mov	x10, #0                         ; =0x0
	mov	x11, x0
LBB0_38:                                ;   Parent Loop BB0_37 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x11]
	str	d0, [x1, x10, lsl #3]
	add	x10, x10, #1
	add	x11, x11, x9
	cmp	x2, x10
	b.ne	LBB0_38
; %bb.39:                               ;   in Loop: Header=BB0_37 Depth=1
	add	x8, x8, #1
	add	x0, x0, #8
	add	x1, x1, x9
	cmp	x8, x2
	b.ne	LBB0_37
	b	LBB0_35
LBB0_40:
	mov	x9, #0                          ; =0x0
	add	x10, x0, #32
	add	x11, x1, #32
	lsl	x12, x3, #3
	lsr	x13, x2, #3
	mul	x13, x3, x13
	add	x13, x0, x13, lsl #6
LBB0_41:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_42 Depth 2
                                        ;     Child Loop BB0_44 Depth 2
	mov	x14, x11
	mov	x15, x10
	mov	x16, x8
LBB0_42:                                ;   Parent Loop BB0_41 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x15, #-32]
	ldp	q2, q3, [x15], #64
	stp	q0, q1, [x14, #-32]
	stp	q2, q3, [x14], #64
	subs	x16, x16, #8
	b.ne	LBB0_42
; %bb.43:                               ;   in Loop: Header=BB0_41 Depth=1
	mov	x14, x13
	mov	x15, x8
LBB0_44:                                ;   Parent Loop BB0_41 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x14]
	str	d0, [x1, x15, lsl #3]
	add	x15, x15, #1
	add	x14, x14, x12
	cmp	x2, x15
	b.ne	LBB0_44
; %bb.45:                               ;   in Loop: Header=BB0_41 Depth=1
	add	x9, x9, #1
	add	x10, x10, #8
	add	x11, x11, x12
	add	x1, x1, x12
	add	x13, x13, #8
	cmp	x9, x2
	b.ne	LBB0_41
	b	LBB0_35
	.cfi_endproc
                                        ; -- End function
	.globl	_transpose_blocked              ; -- Begin function transpose_blocked
	.p2align	2
_transpose_blocked:                     ; @transpose_blocked
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #144
	stp	x28, x27, [sp, #48]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #64]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #80]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #96]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 144
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
	str	x0, [sp, #40]                   ; 8-byte Folded Spill
	cbz	x2, LBB1_55
; %bb.1:
	lsl	x8, x3, #11
	lsl	x9, x3, #3
	ldr	x7, [sp, #40]                   ; 8-byte Folded Reload
	add	x10, x7, x3, lsl #4
	add	x11, x7, x3, lsl #5
	cmp	x3, #1
	b.ne	LBB1_33
; %bb.2:
	mov	x13, #0                         ; =0x0
	add	x12, x7, #32
	stp	x12, xzr, [sp, #24]             ; 16-byte Folded Spill
	add	x14, x1, #32
	add	x12, x7, x9
	stp	x12, x14, [sp, #8]              ; 16-byte Folded Spill
	mov	w12, #24                        ; =0x18
	madd	x12, x3, x12, x7
	str	x12, [sp]                       ; 8-byte Folded Spill
	mov	w12, #40                        ; =0x28
	madd	x4, x3, x12, x7
	add	x16, x1, #24
	mov	w12, #48                        ; =0x30
	madd	x3, x3, x12, x7
	mov	w6, #256                        ; =0x100
	b	LBB1_4
LBB1_3:                                 ;   in Loop: Header=BB1_4 Depth=1
	add	x13, x13, #256
	add	x6, x6, #256
	ldp	x12, x15, [sp, #24]             ; 16-byte Folded Reload
	sub	x14, x15, #256
	add	x12, x12, #2048
	stp	x12, x14, [sp, #24]             ; 16-byte Folded Spill
	ldp	x12, x15, [sp, #8]              ; 16-byte Folded Reload
	add	x14, x15, #2048
	add	x1, x1, #2048
	add	x7, x7, x8
	add	x12, x12, x8
	stp	x12, x14, [sp, #8]              ; 16-byte Folded Spill
	add	x10, x10, x8
	ldr	x12, [sp]                       ; 8-byte Folded Reload
	add	x12, x12, x8
	str	x12, [sp]                       ; 8-byte Folded Spill
	add	x11, x11, x8
	add	x4, x4, x8
	add	x16, x16, #2048
	add	x3, x3, x8
	cmp	x13, x2
	b.hs	LBB1_55
LBB1_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_27 Depth 2
                                        ;       Child Loop BB1_28 Depth 3
                                        ;         Child Loop BB1_29 Depth 4
                                        ;         Child Loop BB1_31 Depth 4
                                        ;     Child Loop BB1_21 Depth 2
                                        ;       Child Loop BB1_22 Depth 3
                                        ;         Child Loop BB1_23 Depth 4
                                        ;     Child Loop BB1_8 Depth 2
                                        ;       Child Loop BB1_11 Depth 3
	cmp	x2, x6
	csel	x12, x2, x6, lo
	cmp	x13, x2
	b.hs	LBB1_3
; %bb.5:                                ;   in Loop: Header=BB1_4 Depth=1
	ldr	x14, [sp, #32]                  ; 8-byte Folded Reload
	add	x20, x12, x14
	cmp	x20, #7
	b.hi	LBB1_18
; %bb.6:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x19, #0                         ; =0x0
	mov	x21, #0                         ; =0x0
	mov	x22, x3
	mov	x5, x16
	mov	x24, x4
	mov	x25, x11
	ldp	x26, x28, [sp]                  ; 16-byte Folded Reload
	mov	x27, x10
	mov	x30, x7
	mov	w14, #256                       ; =0x100
	b	LBB1_8
LBB1_7:                                 ;   in Loop: Header=BB1_8 Depth=2
	add	x21, x21, #256
	add	x14, x14, #256
	sub	x19, x19, #256
	add	x30, x30, #2048
	add	x28, x28, #2048
	add	x27, x27, #2048
	add	x26, x26, #2048
	add	x25, x25, #2048
	add	x24, x24, #2048
	add	x5, x5, x8
	add	x22, x22, #2048
	cmp	x21, x2
	b.hs	LBB1_3
LBB1_8:                                 ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_11 Depth 3
	cmp	x2, x14
	csel	x12, x2, x14, lo
	cmp	x21, x2
	b.hs	LBB1_7
; %bb.9:                                ;   in Loop: Header=BB1_8 Depth=2
	mov	x15, #0                         ; =0x0
	add	x0, x12, x19
	mov	x23, x5
	b	LBB1_11
LBB1_10:                                ;   in Loop: Header=BB1_11 Depth=3
	add	x15, x15, #1
	add	x23, x23, x9
	cmp	x0, x15
	b.eq	LBB1_7
LBB1_11:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_8 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x30, x15, lsl #3]
	stur	d0, [x23, #-24]
	cmp	x20, #2
	b.lo	LBB1_10
; %bb.12:                               ;   in Loop: Header=BB1_11 Depth=3
	ldr	d0, [x28, x15, lsl #3]
	stur	d0, [x23, #-16]
	b.eq	LBB1_10
; %bb.13:                               ;   in Loop: Header=BB1_11 Depth=3
	ldr	d0, [x27, x15, lsl #3]
	stur	d0, [x23, #-8]
	cmp	x20, #3
	b.eq	LBB1_10
; %bb.14:                               ;   in Loop: Header=BB1_11 Depth=3
	ldr	d0, [x26, x15, lsl #3]
	str	d0, [x23]
	cmp	x20, #4
	b.eq	LBB1_10
; %bb.15:                               ;   in Loop: Header=BB1_11 Depth=3
	ldr	d0, [x25, x15, lsl #3]
	str	d0, [x23, #8]
	cmp	x20, #5
	b.eq	LBB1_10
; %bb.16:                               ;   in Loop: Header=BB1_11 Depth=3
	ldr	d0, [x24, x15, lsl #3]
	str	d0, [x23, #16]
	cmp	x20, #6
	b.eq	LBB1_10
; %bb.17:                               ;   in Loop: Header=BB1_11 Depth=3
	ldr	d0, [x22, x15, lsl #3]
	str	d0, [x23, #24]
	b	LBB1_10
LBB1_18:                                ;   in Loop: Header=BB1_4 Depth=1
	and	x12, x20, #0xfffffffffffffff8
	subs	x21, x20, x12
	b.ne	LBB1_25
; %bb.19:                               ;   in Loop: Header=BB1_4 Depth=1
	mov	x14, #0                         ; =0x0
	ldp	x0, x15, [sp, #16]              ; 16-byte Folded Reload
	mov	w20, #256                       ; =0x100
	b	LBB1_21
LBB1_20:                                ;   in Loop: Header=BB1_21 Depth=2
	add	x14, x14, #256
	add	x20, x20, #256
	add	x15, x15, #2048
	add	x0, x0, x8
	cmp	x14, x2
	b.hs	LBB1_3
LBB1_21:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_22 Depth 3
                                        ;         Child Loop BB1_23 Depth 4
	cmp	x2, x20
	csel	x21, x2, x20, lo
	mov	x5, x0
	mov	x22, x15
	mov	x23, x14
	cmp	x14, x2
	b.hs	LBB1_20
LBB1_22:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_21 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB1_23 Depth 4
	mov	x24, x5
	mov	x25, x22
	mov	x17, x12
LBB1_23:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_21 Depth=2
                                        ;       Parent Loop BB1_22 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldp	q0, q1, [x25, #-32]
	ldp	q2, q3, [x25], #64
	stp	q0, q1, [x24, #-32]
	stp	q2, q3, [x24], #64
	subs	x17, x17, #8
	b.ne	LBB1_23
; %bb.24:                               ;   in Loop: Header=BB1_22 Depth=3
	add	x23, x23, #1
	add	x22, x22, #8
	add	x5, x5, x9
	cmp	x23, x21
	b.ne	LBB1_22
	b	LBB1_20
LBB1_25:                                ;   in Loop: Header=BB1_4 Depth=1
	mov	x15, #0                         ; =0x0
	lsr	x14, x20, #3
	add	x17, x13, x12
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	madd	x20, x9, x17, x0
	ldp	x23, x17, [sp, #16]             ; 16-byte Folded Reload
	mov	w25, #256                       ; =0x100
	add	x26, x1, x14, lsl #6
	b	LBB1_27
LBB1_26:                                ;   in Loop: Header=BB1_27 Depth=2
	add	x15, x15, #256
	add	x25, x25, #256
	add	x17, x17, #2048
	add	x23, x23, x8
	add	x26, x26, x8
	add	x20, x20, #2048
	cmp	x15, x2
	b.hs	LBB1_3
LBB1_27:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_28 Depth 3
                                        ;         Child Loop BB1_29 Depth 4
                                        ;         Child Loop BB1_31 Depth 4
	cmp	x2, x25
	csel	x14, x2, x25, lo
	mov	x27, x20
	mov	x28, x26
	mov	x30, x23
	mov	x0, x17
	mov	x22, x15
	cmp	x15, x2
	b.hs	LBB1_26
LBB1_28:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_27 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB1_29 Depth 4
                                        ;         Child Loop BB1_31 Depth 4
	mov	x5, x30
	mov	x24, x0
	mov	x19, x12
LBB1_29:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_27 Depth=2
                                        ;       Parent Loop BB1_28 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldp	q0, q1, [x24, #-32]
	ldp	q2, q3, [x24], #64
	stp	q0, q1, [x5, #-32]
	stp	q2, q3, [x5], #64
	subs	x19, x19, #8
	b.ne	LBB1_29
; %bb.30:                               ;   in Loop: Header=BB1_28 Depth=3
	mov	x5, x27
	mov	x19, x28
	mov	x24, x21
LBB1_31:                                ;   Parent Loop BB1_4 Depth=1
                                        ;     Parent Loop BB1_27 Depth=2
                                        ;       Parent Loop BB1_28 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	d0, [x5]
	str	d0, [x19], #8
	add	x5, x5, x9
	subs	x24, x24, #1
	b.ne	LBB1_31
; %bb.32:                               ;   in Loop: Header=BB1_28 Depth=3
	add	x22, x22, #1
	add	x0, x0, #8
	add	x30, x30, x9
	add	x28, x28, x9
	add	x27, x27, #8
	cmp	x22, x14
	b.ne	LBB1_28
	b	LBB1_26
LBB1_33:
	mov	x12, #0                         ; =0x0
	mov	x13, #0                         ; =0x0
	add	x14, x7, x9
	mov	w15, #24                        ; =0x18
	madd	x15, x3, x15, x7
	mov	w16, #40                        ; =0x28
	madd	x16, x3, x16, x7
	add	x17, x1, #24
	mov	w0, #48                         ; =0x30
	mov	w4, #256                        ; =0x100
	madd	x3, x3, x0, x7
	b	LBB1_35
LBB1_34:                                ;   in Loop: Header=BB1_35 Depth=1
	add	x13, x13, #256
	add	x4, x4, #256
	sub	x12, x12, #256
	add	x1, x1, #2048
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	add	x0, x0, x8
	str	x0, [sp, #40]                   ; 8-byte Folded Spill
	add	x14, x14, x8
	add	x10, x10, x8
	add	x15, x15, x8
	add	x11, x11, x8
	add	x16, x16, x8
	add	x17, x17, #2048
	add	x3, x3, x8
	cmp	x13, x2
	b.hs	LBB1_55
LBB1_35:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_51 Depth 2
                                        ;       Child Loop BB1_52 Depth 3
                                        ;         Child Loop BB1_53 Depth 4
                                        ;     Child Loop BB1_39 Depth 2
                                        ;       Child Loop BB1_42 Depth 3
	cmp	x2, x4
	csel	x0, x2, x4, lo
	add	x5, x0, x12
	cmp	x5, #1
	csinc	x0, x5, xzr, hi
	cmp	x13, x2
	b.hs	LBB1_34
; %bb.36:                               ;   in Loop: Header=BB1_35 Depth=1
	cmp	x5, #8
	b.hs	LBB1_49
; %bb.37:                               ;   in Loop: Header=BB1_35 Depth=1
	mov	x6, #0                          ; =0x0
	mov	x7, #0                          ; =0x0
	mov	x19, x3
	mov	x20, x17
	mov	x21, x16
	mov	x22, x11
	mov	x23, x15
	mov	x24, x10
	mov	x25, x14
	ldr	x26, [sp, #40]                  ; 8-byte Folded Reload
	mov	w0, #256                        ; =0x100
	b	LBB1_39
LBB1_38:                                ;   in Loop: Header=BB1_39 Depth=2
	add	x7, x7, #256
	add	x0, x0, #256
	sub	x6, x6, #256
	add	x26, x26, #2048
	add	x25, x25, #2048
	add	x24, x24, #2048
	add	x23, x23, #2048
	add	x22, x22, #2048
	add	x21, x21, #2048
	add	x20, x20, x8
	add	x19, x19, #2048
	cmp	x7, x2
	b.hs	LBB1_34
LBB1_39:                                ;   Parent Loop BB1_35 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_42 Depth 3
	cmp	x2, x0
	csel	x28, x2, x0, lo
	cmp	x7, x2
	b.hs	LBB1_38
; %bb.40:                               ;   in Loop: Header=BB1_39 Depth=2
	mov	x27, #0                         ; =0x0
	add	x28, x28, x6
	mov	x30, x20
	b	LBB1_42
LBB1_41:                                ;   in Loop: Header=BB1_42 Depth=3
	add	x27, x27, #1
	add	x30, x30, x9
	cmp	x28, x27
	b.eq	LBB1_38
LBB1_42:                                ;   Parent Loop BB1_35 Depth=1
                                        ;     Parent Loop BB1_39 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x26, x27, lsl #3]
	stur	d0, [x30, #-24]
	cmp	x5, #2
	b.lo	LBB1_41
; %bb.43:                               ;   in Loop: Header=BB1_42 Depth=3
	ldr	d0, [x25, x27, lsl #3]
	stur	d0, [x30, #-16]
	b.eq	LBB1_41
; %bb.44:                               ;   in Loop: Header=BB1_42 Depth=3
	ldr	d0, [x24, x27, lsl #3]
	stur	d0, [x30, #-8]
	cmp	x5, #3
	b.eq	LBB1_41
; %bb.45:                               ;   in Loop: Header=BB1_42 Depth=3
	ldr	d0, [x23, x27, lsl #3]
	str	d0, [x30]
	cmp	x5, #4
	b.eq	LBB1_41
; %bb.46:                               ;   in Loop: Header=BB1_42 Depth=3
	ldr	d0, [x22, x27, lsl #3]
	str	d0, [x30, #8]
	cmp	x5, #5
	b.eq	LBB1_41
; %bb.47:                               ;   in Loop: Header=BB1_42 Depth=3
	ldr	d0, [x21, x27, lsl #3]
	str	d0, [x30, #16]
	cmp	x5, #6
	b.eq	LBB1_41
; %bb.48:                               ;   in Loop: Header=BB1_42 Depth=3
	ldr	d0, [x19, x27, lsl #3]
	str	d0, [x30, #24]
	b	LBB1_41
LBB1_49:                                ;   in Loop: Header=BB1_35 Depth=1
	mov	x5, #0                          ; =0x0
	ldr	x6, [sp, #40]                   ; 8-byte Folded Reload
	mov	x7, x1
	mov	w19, #256                       ; =0x100
	b	LBB1_51
LBB1_50:                                ;   in Loop: Header=BB1_51 Depth=2
	add	x5, x5, #256
	add	x19, x19, #256
	add	x7, x7, x8
	add	x6, x6, #2048
	cmp	x5, x2
	b.hs	LBB1_34
LBB1_51:                                ;   Parent Loop BB1_35 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_52 Depth 3
                                        ;         Child Loop BB1_53 Depth 4
	cmp	x2, x19
	csel	x20, x2, x19, lo
	mov	x21, x6
	mov	x22, x7
	mov	x23, x5
	cmp	x5, x2
	b.hs	LBB1_50
LBB1_52:                                ;   Parent Loop BB1_35 Depth=1
                                        ;     Parent Loop BB1_51 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB1_53 Depth 4
	mov	x24, x21
	mov	x25, x22
	mov	x26, x0
LBB1_53:                                ;   Parent Loop BB1_35 Depth=1
                                        ;     Parent Loop BB1_51 Depth=2
                                        ;       Parent Loop BB1_52 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	d0, [x24]
	str	d0, [x25], #8
	add	x24, x24, x9
	subs	x26, x26, #1
	b.ne	LBB1_53
; %bb.54:                               ;   in Loop: Header=BB1_52 Depth=3
	add	x23, x23, #1
	add	x22, x22, x9
	add	x21, x21, #8
	cmp	x23, x20
	b.ne	LBB1_52
	b	LBB1_50
LBB1_55:
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_transpose_tiled                ; -- Begin function transpose_tiled
	.p2align	2
_transpose_tiled:                       ; @transpose_tiled
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	stp	x28, x27, [sp, #32]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #48]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 128
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
	stp	x2, x3, [sp]                    ; 16-byte Folded Spill
	ands	x8, x2, #0xfffffffffffffff8
	b.eq	LBB2_10
; %bb.1:
	mov	x14, #0                         ; =0x0
	ldr	x11, [sp, #8]                   ; 8-byte Folded Reload
	lsl	x9, x11, #11
	lsl	x10, x11, #6
	add	x12, x0, #32
	str	x12, [sp, #24]                  ; 8-byte Folded Spill
	lsl	x12, x11, #3
	mov	x13, x1
	b	LBB2_3
LBB2_2:                                 ;   in Loop: Header=BB2_3 Depth=1
	add	x13, x13, #2048
	ldr	x11, [sp, #24]                  ; 8-byte Folded Reload
	add	x11, x11, x9
	str	x11, [sp, #24]                  ; 8-byte Folded Spill
	ldr	x11, [sp, #16]                  ; 8-byte Folded Reload
	mov	x14, x11
	cmp	x11, x8
	b.hs	LBB2_10
LBB2_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_6 Depth 2
                                        ;       Child Loop BB2_7 Depth 3
                                        ;         Child Loop BB2_8 Depth 4
	add	x11, x14, #256
	cmp	x11, x8
	str	x11, [sp, #16]                  ; 8-byte Folded Spill
	csel	x16, x11, x8, lo
	cmp	x14, x16
	b.hs	LBB2_2
; %bb.4:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	x5, #0                          ; =0x0
	ldr	x17, [sp, #24]                  ; 8-byte Folded Reload
	mov	x4, x13
	b	LBB2_6
LBB2_5:                                 ;   in Loop: Header=BB2_6 Depth=2
	add	x4, x4, x9
	add	x17, x17, #2048
	mov	x5, x6
	cmp	x6, x8
	b.hs	LBB2_2
LBB2_6:                                 ;   Parent Loop BB2_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_7 Depth 3
                                        ;         Child Loop BB2_8 Depth 4
	add	x6, x5, #256
	cmp	x6, x8
	csel	x7, x6, x8, lo
	mov	x19, x17
	mov	x20, x4
	mov	x21, x14
	cmp	x5, x7
	b.hs	LBB2_5
LBB2_7:                                 ;   Parent Loop BB2_3 Depth=1
                                        ;     Parent Loop BB2_6 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB2_8 Depth 4
	mov	x22, x19
	mov	x23, x20
	mov	x24, x5
LBB2_8:                                 ;   Parent Loop BB2_3 Depth=1
                                        ;     Parent Loop BB2_6 Depth=2
                                        ;       Parent Loop BB2_7 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	mov	x15, x22
	ldr	d0, [x15, #-32]!
	add	x26, x15, x12
	add	x25, x26, x12
	ldp	d1, d2, [x26]
	stp	d0, d1, [x23]
	add	x30, x25, x12
	add	x27, x30, x12
	ldp	d0, d1, [x25]
	ldp	d3, d4, [x30]
	stp	d0, d3, [x23, #16]
	add	x15, x27, x12
	add	x28, x15, x12
	ldp	d0, d3, [x27]
	ldp	d5, d6, [x15]
	stp	d0, d5, [x23, #32]
	add	x3, x28, x12
	ldp	d0, d5, [x28]
	ldp	d7, d16, [x3]
	stp	d0, d7, [x23, #48]
	ldp	d0, d7, [x22, #-24]
	add	x2, x23, x12
	add	x11, x2, x12
	stp	d0, d2, [x2]
	stp	d1, d4, [x2, #16]
	stp	d3, d6, [x2, #32]
	stp	d5, d16, [x2, #48]
	ldp	d0, d1, [x26, #16]
	stp	d7, d0, [x11]
	ldp	d0, d2, [x25, #16]
	ldp	d3, d4, [x30, #16]
	stp	d0, d3, [x11, #16]
	ldp	d0, d3, [x27, #16]
	ldp	d5, d6, [x15, #16]
	stp	d0, d5, [x11, #32]
	ldp	d0, d5, [x28, #16]
	ldp	d7, d16, [x3, #16]
	stp	d0, d7, [x11, #48]
	ldp	d0, d7, [x22, #-8]
	add	x11, x11, x12
	add	x2, x11, x12
	stp	d0, d1, [x11]
	stp	d2, d4, [x11, #16]
	stp	d3, d6, [x11, #32]
	stp	d5, d16, [x11, #48]
	ldp	d0, d1, [x26, #32]
	stp	d7, d0, [x2]
	ldp	d0, d2, [x25, #32]
	ldp	d3, d4, [x30, #32]
	stp	d0, d3, [x2, #16]
	ldp	d0, d3, [x27, #32]
	ldp	d5, d6, [x15, #32]
	stp	d0, d5, [x2, #32]
	ldp	d0, d5, [x28, #32]
	ldp	d7, d16, [x3, #32]
	stp	d0, d7, [x2, #48]
	ldp	d0, d7, [x22, #8]
	add	x11, x2, x12
	add	x2, x11, x12
	stp	d0, d1, [x11]
	stp	d2, d4, [x11, #16]
	stp	d3, d6, [x11, #32]
	stp	d5, d16, [x11, #48]
	ldp	d0, d1, [x26, #48]
	stp	d7, d0, [x2]
	ldp	d0, d2, [x25, #48]
	ldp	d3, d4, [x30, #48]
	stp	d0, d3, [x2, #16]
	ldp	d0, d3, [x27, #48]
	ldp	d5, d6, [x15, #48]
	stp	d0, d5, [x2, #32]
	ldp	d0, d5, [x28, #48]
	ldp	d7, d16, [x3, #48]
	stp	d0, d7, [x2, #48]
	ldr	d0, [x22, #24]
	add	x11, x2, x12
	stp	d0, d1, [x11]
	stp	d2, d4, [x11, #16]
	stp	d3, d6, [x11, #32]
	add	x24, x24, #8
	add	x23, x23, x10
	add	x22, x22, #64
	stp	d5, d16, [x11, #48]
	cmp	x24, x7
	b.lo	LBB2_8
; %bb.9:                                ;   in Loop: Header=BB2_7 Depth=3
	add	x21, x21, #8
	add	x20, x20, #64
	add	x19, x19, x10
	cmp	x21, x16
	b.lo	LBB2_7
	b	LBB2_5
LBB2_10:
	ldr	x2, [sp]                        ; 8-byte Folded Reload
	cbz	x2, LBB2_34
; %bb.11:
	ldr	x12, [sp, #8]                   ; 8-byte Folded Reload
	cmp	x12, #1
	b.ne	LBB2_21
; %bb.12:
	mov	x10, #0                         ; =0x0
	and	x9, x2, #0x7
	cbz	x9, LBB2_26
; %bb.13:
	sub	x11, x9, x2
	lsl	x12, x12, #3
	b	LBB2_15
LBB2_14:                                ;   in Loop: Header=BB2_15 Depth=1
	add	x10, x10, #1
	add	x0, x0, x12
	add	x1, x1, #8
	cmp	x10, x2
	b.eq	LBB2_34
LBB2_15:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_18 Depth 2
                                        ;     Child Loop BB2_20 Depth 2
	cmp	x10, x8
	csel	x15, x8, xzr, lo
	subs	x14, x2, x15
	b.ls	LBB2_14
; %bb.16:                               ;   in Loop: Header=BB2_15 Depth=1
	mov	x13, x15
	cmp	x14, #8
	b.lo	LBB2_19
; %bb.17:                               ;   in Loop: Header=BB2_15 Depth=1
	sub	x13, x14, x9
	add	x13, x15, x13
	add	x14, x11, x15
	lsl	x15, x15, #3
	add	x16, x0, x15
LBB2_18:                                ;   Parent Loop BB2_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x16]
	ldp	q2, q3, [x16, #32]
	add	x17, x1, x15
	stp	q0, q1, [x17]
	stp	q2, q3, [x17, #32]
	add	x16, x16, #64
	add	x15, x15, #64
	adds	x14, x14, #8
	b.ne	LBB2_18
LBB2_19:                                ;   in Loop: Header=BB2_15 Depth=1
	mul	x14, x12, x13
LBB2_20:                                ;   Parent Loop BB2_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x0, x13, lsl #3]
	str	d0, [x1, x14]
	add	x13, x13, #1
	add	x14, x14, x12
	cmp	x2, x13
	b.ne	LBB2_20
	b	LBB2_14
LBB2_21:
	mov	x9, #0                          ; =0x0
	lsl	x10, x12, #3
	b	LBB2_23
LBB2_22:                                ;   in Loop: Header=BB2_23 Depth=1
	add	x9, x9, #1
	add	x1, x1, #8
	add	x0, x0, x10
	cmp	x9, x2
	b.eq	LBB2_34
LBB2_23:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_25 Depth 2
	cmp	x9, x8
	csel	x13, x8, xzr, lo
	subs	x11, x2, x13
	b.ls	LBB2_22
; %bb.24:                               ;   in Loop: Header=BB2_23 Depth=1
	madd	x12, x10, x13, x1
	add	x13, x0, x13, lsl #3
LBB2_25:                                ;   Parent Loop BB2_23 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x13], #8
	str	d0, [x12]
	add	x12, x12, x10
	subs	x11, x11, #1
	b.ne	LBB2_25
	b	LBB2_22
LBB2_26:
	sub	x9, x9, x2
	lsl	x11, x12, #3
	b	LBB2_28
LBB2_27:                                ;   in Loop: Header=BB2_28 Depth=1
	add	x10, x10, #1
	add	x0, x0, x11
	add	x1, x1, #8
	cmp	x10, x2
	b.eq	LBB2_34
LBB2_28:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_33 Depth 2
                                        ;     Child Loop BB2_31 Depth 2
	cmp	x10, x8
	csel	x13, x8, xzr, lo
	subs	x12, x2, x13
	b.ls	LBB2_27
; %bb.29:                               ;   in Loop: Header=BB2_28 Depth=1
	cmp	x12, #7
	b.hi	LBB2_32
; %bb.30:                               ;   in Loop: Header=BB2_28 Depth=1
	mul	x12, x11, x13
LBB2_31:                                ;   Parent Loop BB2_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x0, x13, lsl #3]
	str	d0, [x1, x12]
	add	x13, x13, #1
	add	x12, x12, x11
	cmp	x2, x13
	b.ne	LBB2_31
	b	LBB2_27
LBB2_32:                                ;   in Loop: Header=BB2_28 Depth=1
	add	x12, x9, x13
	lsl	x13, x13, #3
	add	x14, x0, x13
LBB2_33:                                ;   Parent Loop BB2_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x14]
	ldp	q2, q3, [x14, #32]
	add	x15, x1, x13
	stp	q0, q1, [x15]
	stp	q2, q3, [x15, #32]
	add	x14, x14, #64
	add	x13, x13, #64
	adds	x12, x12, #8
	b.ne	LBB2_33
	b	LBB2_27
LBB2_34:
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function main
lCPI3_0:
	.quad	0                               ; 0x0
	.quad	1                               ; 0x1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	cmp	w0, #2
	b.lt	LBB3_3
; %bb.1:
	mov	x21, x1
	mov	x22, x0
	ldr	x0, [x1, #8]
	mov	x1, #0                          ; =0x0
	mov	w2, #10                         ; =0xa
	bl	_strtoull
	mov	x19, x0
	cmp	w22, #2
	b.ne	LBB3_40
; %bb.2:
	mov	x0, #0                          ; =0x0
	mov	w20, #5                         ; =0x5
	b	LBB3_4
LBB3_3:
	mov	x0, #0                          ; =0x0
	mov	w20, #5                         ; =0x5
	mov	w19, #8192                      ; =0x2000
LBB3_4:
	add	x21, x0, x19
	mul	x8, x19, x21
	lsl	x8, x8, #3
	add	x8, x8, #127
	and	x24, x8, #0xffffffffffffff80
	mov	w0, #128                        ; =0x80
	mov	x1, x24
	bl	_aligned_alloc
	cbz	x0, LBB3_50
; %bb.5:
	mov	x22, x0
	mov	w0, #128                        ; =0x80
	mov	x1, x24
	bl	_aligned_alloc
	cbz	x0, LBB3_50
; %bb.6:
	mov	x23, x0
	cbz	x19, LBB3_48
; %bb.7:
	cmp	x19, #7
	b.hi	LBB3_35
; %bb.8:
	str	xzr, [x22]
	cmp	x19, #1
	b.eq	LBB3_48
; %bb.9:
	mov	x8, #4607182418800017408        ; =0x3ff0000000000000
	str	x8, [x22, #8]
	cmp	x19, #2
	b.eq	LBB3_15
; %bb.10:
	mov	x8, #4611686018427387904        ; =0x4000000000000000
	str	x8, [x22, #16]
	cmp	x19, #3
	b.eq	LBB3_15
; %bb.11:
	mov	x8, #4613937818241073152        ; =0x4008000000000000
	str	x8, [x22, #24]
	cmp	x19, #4
	b.eq	LBB3_15
; %bb.12:
	mov	x8, #4616189618054758400        ; =0x4010000000000000
	str	x8, [x22, #32]
	cmp	x19, #5
	b.eq	LBB3_15
; %bb.13:
	mov	x8, #4617315517961601024        ; =0x4014000000000000
	str	x8, [x22, #40]
	cmp	x19, #6
	b.eq	LBB3_15
; %bb.14:
	mov	x8, #4618441417868443648        ; =0x4018000000000000
	str	x8, [x22, #48]
	cmp	x19, #1
	b.eq	LBB3_48
LBB3_15:
	ucvtf	d0, x19
	add	x8, x19, #1
	ucvtf	d1, x8
	add	x8, x22, x21, lsl #3
	stp	d0, d1, [x8]
	cmp	x19, #2
	b.eq	LBB3_48
; %bb.16:
	add	x9, x19, #2
	ucvtf	d0, x9
	str	d0, [x8, #16]
	cmp	x19, #3
	b.eq	LBB3_21
; %bb.17:
	add	x9, x19, #3
	ucvtf	d0, x9
	str	d0, [x8, #24]
	cmp	x19, #4
	b.eq	LBB3_21
; %bb.18:
	add	x9, x19, #4
	ucvtf	d0, x9
	str	d0, [x8, #32]
	cmp	x19, #5
	b.eq	LBB3_21
; %bb.19:
	add	x9, x19, #5
	ucvtf	d0, x9
	str	d0, [x8, #40]
	cmp	x19, #6
	b.eq	LBB3_21
; %bb.20:
	add	x9, x19, #6
	ucvtf	d0, x9
	str	d0, [x8, #48]
	cmp	x19, #2
	b.eq	LBB3_48
LBB3_21:
	lsl	x8, x19, #1
	ucvtf	d0, x8
	add	x9, x22, x21, lsl #4
	mov	w10, #1                         ; =0x1
	bfi	x10, x19, #1, #62
	ucvtf	d1, x10
	stp	d0, d1, [x9]
	add	x10, x8, #2
	ucvtf	d0, x10
	str	d0, [x9, #16]
	cmp	x19, #3
	b.eq	LBB3_48
; %bb.22:
	add	x10, x8, #3
	ucvtf	d0, x10
	str	d0, [x9, #24]
	cmp	x19, #4
	b.eq	LBB3_26
; %bb.23:
	add	x10, x8, #4
	ucvtf	d0, x10
	str	d0, [x9, #32]
	cmp	x19, #5
	b.eq	LBB3_26
; %bb.24:
	add	x10, x8, #5
	ucvtf	d0, x10
	str	d0, [x9, #40]
	cmp	x19, #6
	b.eq	LBB3_26
; %bb.25:
	add	x8, x8, #6
	ucvtf	d0, x8
	str	d0, [x9, #48]
	cmp	x19, #3
	b.eq	LBB3_48
LBB3_26:
	add	x8, x19, x19, lsl #1
	mov	w9, #24                         ; =0x18
	ucvtf	d0, x8
	add	x10, x8, #1
	ucvtf	d1, x10
	madd	x9, x21, x9, x22
	stp	d0, d1, [x9]
	add	x10, x8, #2
	ucvtf	d0, x10
	add	x10, x8, #3
	ucvtf	d1, x10
	stp	d0, d1, [x9, #16]
	cmp	x19, #4
	b.eq	LBB3_48
; %bb.27:
	add	x10, x8, #4
	ucvtf	d0, x10
	str	d0, [x9, #32]
	cmp	x19, #5
	b.eq	LBB3_30
; %bb.28:
	add	x10, x8, #5
	ucvtf	d0, x10
	str	d0, [x9, #40]
	cmp	x19, #6
	b.eq	LBB3_30
; %bb.29:
	add	x10, x8, #6
	ucvtf	d0, x10
	str	d0, [x9, #48]
	cmp	x19, #4
	b.eq	LBB3_48
LBB3_30:
	lsl	x9, x19, #2
	ucvtf	d0, x9
	mov	w10, #1                         ; =0x1
	bfi	x10, x19, #2, #61
	ucvtf	d1, x10
	add	x10, x22, x21, lsl #5
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
	b.eq	LBB3_48
; %bb.31:
	add	x11, x9, #5
	ucvtf	d0, x11
	str	d0, [x10, #40]
	cmp	x19, #6
	b.eq	LBB3_33
; %bb.32:
	add	x9, x9, #6
	ucvtf	d0, x9
	str	d0, [x10, #48]
	cmp	x19, #5
	b.eq	LBB3_48
LBB3_33:
	add	x9, x19, x19, lsl #2
	mov	w10, #40                        ; =0x28
	madd	x10, x21, x10, x22
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
	b.eq	LBB3_48
; %bb.34:
	add	x9, x9, #6
	ucvtf	d0, x9
	str	d0, [x10, #48]
	lsl	x9, x8, #1
	mov	w10, #48                        ; =0x30
	madd	x10, x21, x10, x22
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
	b	LBB3_48
LBB3_35:
	and	x8, x19, #0xfffffffffffffff8
	subs	x9, x19, x8
	b.ne	LBB3_42
; %bb.36:
	add	x10, x22, #32
	lsl	x11, x21, #3
Lloh0:
	adrp	x12, lCPI3_0@PAGE
Lloh1:
	ldr	q0, [x12, lCPI3_0@PAGEOFF]
	mov	w12, #2                         ; =0x2
	dup.2d	v1, x12
	mov	w12, #4                         ; =0x4
	dup.2d	v2, x12
	mov	w12, #6                         ; =0x6
	dup.2d	v3, x12
	mov	w12, #8                         ; =0x8
	dup.2d	v4, x12
LBB3_37:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_38 Depth 2
	mul	x12, x9, x19
	dup.2d	v5, x12
	mov	x12, x10
	mov	x13, x8
	mov.16b	v6, v0
LBB3_38:                                ;   Parent Loop BB3_37 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add.2d	v7, v6, v5
	add.2d	v16, v7, v1
	add.2d	v17, v7, v2
	add.2d	v18, v7, v3
	ucvtf.2d	v7, v7
	ucvtf.2d	v16, v16
	ucvtf.2d	v17, v17
	ucvtf.2d	v18, v18
	stp	q7, q16, [x12, #-32]
	stp	q17, q18, [x12], #64
	add.2d	v6, v6, v4
	subs	x13, x13, #8
	b.ne	LBB3_38
; %bb.39:                               ;   in Loop: Header=BB3_37 Depth=1
	add	x9, x9, #1
	add	x10, x10, x11
	cmp	x9, x19
	b.ne	LBB3_37
	b	LBB3_48
LBB3_40:
	ldr	x0, [x21, #16]
	bl	_atoi
	mov	x20, x0
	cmp	w22, #4
	b.lo	LBB3_49
; %bb.41:
	ldr	x0, [x21, #24]
	mov	x1, #0                          ; =0x0
	mov	w2, #10                         ; =0xa
	bl	_strtoull
	b	LBB3_4
LBB3_42:
	mov	x10, #0                         ; =0x0
	add	x11, x22, #32
	lsl	x12, x21, #3
	lsr	x13, x19, #3
	mov	w14, #2                         ; =0x2
	dup.2d	v0, x14
Lloh2:
	adrp	x14, lCPI3_0@PAGE
Lloh3:
	ldr	q1, [x14, lCPI3_0@PAGEOFF]
	mov	w14, #4                         ; =0x4
	dup.2d	v2, x14
	mov	w14, #6                         ; =0x6
	add	x13, x22, x13, lsl #6
	dup.2d	v3, x14
	mov	w14, #8                         ; =0x8
	dup.2d	v4, x14
	mov	x14, x8
LBB3_43:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_44 Depth 2
                                        ;     Child Loop BB3_46 Depth 2
	mul	x15, x10, x19
	dup.2d	v5, x15
	mov	x15, x8
	mov	x16, x11
	mov.16b	v6, v1
LBB3_44:                                ;   Parent Loop BB3_43 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add.2d	v7, v6, v5
	add.2d	v16, v7, v0
	add.2d	v17, v7, v2
	add.2d	v18, v7, v3
	ucvtf.2d	v7, v7
	ucvtf.2d	v16, v16
	ucvtf.2d	v17, v17
	ucvtf.2d	v18, v18
	stp	q7, q16, [x16, #-32]
	stp	q17, q18, [x16], #64
	add.2d	v6, v6, v4
	subs	x15, x15, #8
	b.ne	LBB3_44
; %bb.45:                               ;   in Loop: Header=BB3_43 Depth=1
	mov	x15, x14
	mov	x16, x13
	mov	x17, x9
LBB3_46:                                ;   Parent Loop BB3_43 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ucvtf	d5, x15
	str	d5, [x16], #8
	add	x15, x15, #1
	subs	x17, x17, #1
	b.ne	LBB3_46
; %bb.47:                               ;   in Loop: Header=BB3_43 Depth=1
	add	x10, x10, #1
	add	x11, x11, x12
	add	x13, x13, x12
	add	x14, x14, x19
	cmp	x10, x19
	b.ne	LBB3_43
LBB3_48:
	mov	w8, #8                          ; =0x8
	str	x8, [sp, #16]
	mov	w8, #256                        ; =0x100
	stp	x19, x8, [sp]
Lloh4:
	adrp	x0, l_.str@PAGE
Lloh5:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
Lloh6:
	adrp	x0, l_.str.1@PAGE
Lloh7:
	add	x0, x0, l_.str.1@PAGEOFF
Lloh8:
	adrp	x1, _transpose_simd_rows@PAGE
Lloh9:
	add	x1, x1, _transpose_simd_rows@PAGEOFF
	mov	x2, x22
	mov	x3, x23
	mov	x4, x19
	mov	x5, x21
	mov	x6, x20
	bl	_bench
Lloh10:
	adrp	x0, l_.str.2@PAGE
Lloh11:
	add	x0, x0, l_.str.2@PAGEOFF
Lloh12:
	adrp	x1, _transpose_blocked@PAGE
Lloh13:
	add	x1, x1, _transpose_blocked@PAGEOFF
	mov	x2, x22
	mov	x3, x23
	mov	x4, x19
	mov	x5, x21
	mov	x6, x20
	bl	_bench
Lloh14:
	adrp	x0, l_.str.3@PAGE
Lloh15:
	add	x0, x0, l_.str.3@PAGEOFF
Lloh16:
	adrp	x1, _transpose_tiled@PAGE
Lloh17:
	add	x1, x1, _transpose_tiled@PAGEOFF
	mov	x2, x22
	mov	x3, x23
	mov	x4, x19
	mov	x5, x21
	mov	x6, x20
	bl	_bench
	mov	x0, x22
	bl	_free
	mov	x0, x23
	bl	_free
	mov	w0, #0                          ; =0x0
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
LBB3_49:
	mov	x0, #0                          ; =0x0
	b	LBB3_4
LBB3_50:
Lloh18:
	adrp	x8, ___stderrp@GOTPAGE
Lloh19:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh20:
	ldr	x0, [x8]
	str	x24, [sp]
Lloh21:
	adrp	x1, l_.str.4@PAGE
Lloh22:
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fprintf
	mov	w0, #1                          ; =0x1
	bl	_exit
	.loh AdrpLdr	Lloh0, Lloh1
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh21, Lloh22
	.loh AdrpLdrGotLdr	Lloh18, Lloh19, Lloh20
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function bench
_bench:                                 ; @bench
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #176
	stp	d11, d10, [sp, #64]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #80]               ; 16-byte Folded Spill
	stp	x26, x25, [sp, #96]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #112]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160
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
	.cfi_offset b8, -88
	.cfi_offset b9, -96
	.cfi_offset b10, -104
	.cfi_offset b11, -112
	mov	x20, x6
	mov	x24, x5
	mov	x21, x4
	mov	x22, x3
	mov	x23, x2
	mov	x25, x1
	mov	x19, x0
	mul	x8, x4, x5
	lsl	x1, x8, #3
	mov	x0, x3
	bl	_bzero
	movi	d9, #0000000000000000
	mov	x8, #36074                      ; =0x8cea
	movk	x8, #14752, lsl #16
	movk	x8, #15961, lsl #32
	movk	x8, #17961, lsl #48
	fmov	d8, x8
	cmp	w20, #1
	b.lt	LBB4_3
; %bb.1:
	mov	x8, #54933                      ; =0xd695
	movk	x8, #59430, lsl #16
	movk	x8, #11787, lsl #32
	movk	x8, #15889, lsl #48
	fmov	d10, x8
	mov	x26, x20
LBB4_2:                                 ; =>This Inner Loop Header: Depth=1
	add	x1, sp, #48
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	d0, d1, [sp, #48]
	scvtf	d0, d0
	scvtf	d1, d1
	fmadd	d11, d1, d10, d0
	mov	x0, x23
	mov	x1, x22
	mov	x2, x21
	mov	x3, x24
	blr	x25
	add	x1, sp, #48
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	d0, d1, [sp, #48]
	scvtf	d0, d0
	scvtf	d1, d1
	fmadd	d0, d1, d10, d0
	fsub	d0, d0, d11
	fcmp	d0, d8
	fcsel	d8, d0, d8, mi
	fadd	d9, d9, d0
	subs	w26, w26, #1
	b.ne	LBB4_2
LBB4_3:
Lloh23:
	adrp	x8, l_.str.7@PAGE
Lloh24:
	add	x8, x8, l_.str.7@PAGEOFF
	cbz	x21, LBB4_51
; %bb.4:
	cmp	x21, #7
	b.hi	LBB4_39
; %bb.5:
	ldr	d0, [x22]
	ldr	d1, [x23]
	fcmp	d0, d1
	cset	w9, ne
	cmp	x21, #1
	b.eq	LBB4_12
; %bb.6:
	ldr	d0, [x22, x24, lsl #3]
	ldr	d1, [x23, #8]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #2
	b.eq	LBB4_12
; %bb.7:
	lsl	x10, x24, #4
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #16]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #3
	b.eq	LBB4_12
; %bb.8:
	mov	w10, #24                        ; =0x18
	mul	x10, x24, x10
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #24]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #4
	b.eq	LBB4_12
; %bb.9:
	lsl	x10, x24, #5
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB4_12
; %bb.10:
	mov	w10, #40                        ; =0x28
	mul	x10, x24, x10
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB4_12
; %bb.11:
	mov	w10, #48                        ; =0x30
	mul	x10, x24, x10
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB4_12:
	cmp	x21, #1
	b.eq	LBB4_50
; %bb.13:
	mov	x10, x22
	ldr	d0, [x10, #8]!
	lsl	x12, x24, #3
	add	x11, x23, x12
	ldp	d1, d2, [x11]
	fcmp	d0, d1
	cinc	x9, x9, ne
	ldr	d0, [x10, x12]
	fcmp	d0, d2
	cinc	x9, x9, ne
	cmp	x21, #2
	b.eq	LBB4_19
; %bb.14:
	lsl	x12, x24, #4
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #16]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #3
	b.eq	LBB4_19
; %bb.15:
	mov	w12, #24                        ; =0x18
	mul	x12, x24, x12
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #24]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #4
	b.eq	LBB4_19
; %bb.16:
	lsl	x12, x24, #5
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB4_19
; %bb.17:
	mov	w12, #40                        ; =0x28
	mul	x12, x24, x12
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB4_19
; %bb.18:
	mov	w12, #48                        ; =0x30
	mul	x12, x24, x12
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB4_19:
	cmp	x21, #2
	b.eq	LBB4_50
; %bb.20:
	mov	x11, x22
	ldr	d0, [x11, #16]!
	lsl	x10, x24, #4
	add	x12, x23, x10
	ldp	d1, d2, [x12]
	fcmp	d0, d1
	cinc	x9, x9, ne
	ldr	d0, [x11, x24, lsl #3]
	fcmp	d0, d2
	cinc	x9, x9, ne
	ldr	d0, [x11, x10]
	ldr	d1, [x12, #16]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #3
	b.eq	LBB4_25
; %bb.21:
	mov	w13, #24                        ; =0x18
	mul	x13, x24, x13
	ldr	d0, [x11, x13]
	ldr	d1, [x12, #24]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #4
	b.eq	LBB4_25
; %bb.22:
	lsl	x13, x24, #5
	ldr	d0, [x11, x13]
	ldr	d1, [x12, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB4_25
; %bb.23:
	mov	w13, #40                        ; =0x28
	mul	x13, x24, x13
	ldr	d0, [x11, x13]
	ldr	d1, [x12, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB4_25
; %bb.24:
	mov	w13, #48                        ; =0x30
	mul	x13, x24, x13
	ldr	d0, [x11, x13]
	ldr	d1, [x12, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB4_25:
	cmp	x21, #3
	b.eq	LBB4_50
; %bb.26:
	mov	x12, x22
	ldr	d0, [x12, #24]!
	add	x11, x24, x24, lsl #1
	lsl	x14, x11, #3
	add	x13, x23, x14
	ldp	d1, d2, [x13]
	fcmp	d0, d1
	cinc	x9, x9, ne
	ldr	d0, [x12, x24, lsl #3]
	fcmp	d0, d2
	cinc	x9, x9, ne
	ldr	d0, [x12, x10]
	ldp	d1, d2, [x13, #16]
	fcmp	d0, d1
	cinc	x9, x9, ne
	ldr	d0, [x12, x14]
	fcmp	d0, d2
	cinc	x9, x9, ne
	cmp	x21, #4
	b.eq	LBB4_30
; %bb.27:
	lsl	x14, x24, #5
	ldr	d0, [x12, x14]
	ldr	d1, [x13, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB4_30
; %bb.28:
	mov	w14, #40                        ; =0x28
	mul	x14, x24, x14
	ldr	d0, [x12, x14]
	ldr	d1, [x13, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB4_30
; %bb.29:
	mov	w14, #48                        ; =0x30
	mul	x14, x24, x14
	ldr	d0, [x12, x14]
	ldr	d1, [x13, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB4_30:
	cmp	x21, #4
	b.eq	LBB4_50
; %bb.31:
	mov	x13, x22
	ldr	d0, [x13, #32]!
	lsl	x12, x24, #5
	add	x14, x23, x12
	ldp	d1, d2, [x14]
	fcmp	d0, d1
	cinc	x9, x9, ne
	ldr	d0, [x13, x24, lsl #3]
	fcmp	d0, d2
	cinc	x9, x9, ne
	ldr	d0, [x13, x10]
	ldp	d1, d2, [x14, #16]
	fcmp	d0, d1
	cinc	x9, x9, ne
	mov	w15, #24                        ; =0x18
	mul	x15, x24, x15
	ldr	d0, [x13, x15]
	fcmp	d0, d2
	cinc	x9, x9, ne
	ldr	d0, [x13, x12]
	ldr	d1, [x14, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB4_34
; %bb.32:
	mov	w15, #40                        ; =0x28
	mul	x15, x24, x15
	ldr	d0, [x13, x15]
	ldr	d1, [x14, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB4_34
; %bb.33:
	mov	w15, #48                        ; =0x30
	mul	x15, x24, x15
	ldr	d0, [x13, x15]
	ldr	d1, [x14, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB4_34:
	cmp	x21, #5
	b.eq	LBB4_50
; %bb.35:
	mov	x13, x22
	ldr	d0, [x13, #40]!
	add	x14, x24, x24, lsl #2
	lsl	x15, x14, #3
	add	x14, x23, x15
	ldp	d1, d2, [x14]
	fcmp	d0, d1
	cinc	x9, x9, ne
	ldr	d0, [x13, x24, lsl #3]
	fcmp	d0, d2
	cinc	x9, x9, ne
	ldr	d0, [x13, x10]
	ldp	d1, d2, [x14, #16]
	fcmp	d0, d1
	cinc	x9, x9, ne
	mov	w16, #24                        ; =0x18
	mul	x16, x24, x16
	ldr	d0, [x13, x16]
	fcmp	d0, d2
	cinc	x9, x9, ne
	ldr	d0, [x13, x12]
	ldp	d1, d2, [x14, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	ldr	d0, [x13, x15]
	fcmp	d0, d2
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB4_37
; %bb.36:
	mov	w15, #48                        ; =0x30
	mul	x15, x24, x15
	ldr	d0, [x13, x15]
	ldr	d1, [x14, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB4_37:
	cmp	x21, #6
	b.eq	LBB4_50
; %bb.38:
	lsl	x11, x11, #4
	add	x13, x23, x11
	ldr	d0, [x22, #48]!
	ldp	d1, d2, [x13]
	fcmp	d0, d1
	cinc	x9, x9, ne
	ldr	d0, [x22, x24, lsl #3]
	fcmp	d0, d2
	cinc	x9, x9, ne
	ldr	d0, [x22, x10]
	ldp	d1, d2, [x13, #16]
	fcmp	d0, d1
	cinc	x9, x9, ne
	mov	w10, #24                        ; =0x18
	mul	x10, x24, x10
	ldr	d0, [x22, x10]
	fcmp	d0, d2
	cinc	x9, x9, ne
	ldr	d0, [x22, x12]
	ldp	d1, d2, [x13, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	mov	w10, #40                        ; =0x28
	mul	x10, x24, x10
	ldr	d0, [x22, x10]
	fcmp	d0, d2
	cinc	x9, x9, ne
	ldr	d0, [x22, x11]
	ldr	d1, [x13, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
	b	LBB4_50
LBB4_39:
	cmp	x24, #1
	b.ne	LBB4_46
; %bb.40:
	mov	x10, #0                         ; =0x0
	mov	x9, #0                          ; =0x0
	and	x11, x21, #0xfffffffffffffff8
	add	x12, x22, #32
	add	x13, x23, #32
	lsl	x14, x24, #3
	sub	x15, x21, x11
	lsr	x17, x21, #3
	add	x16, x23, x17, lsl #6
	mul	x17, x24, x17
	add	x17, x22, x17, lsl #6
	b	LBB4_42
LBB4_41:                                ;   in Loop: Header=BB4_42 Depth=1
	add	x10, x10, #1
	add	x12, x12, #8
	add	x13, x13, x14
	add	x16, x16, x14
	add	x17, x17, #8
	cmp	x10, x21
	b.eq	LBB4_50
LBB4_42:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_43 Depth 2
                                        ;     Child Loop BB4_45 Depth 2
	movi.2d	v0, #0000000000000000
	mov.d	v0[0], x9
	movi.2d	v1, #0000000000000000
	mov	x9, x13
	mov	x0, x12
	mov	x1, x11
	movi.2d	v2, #0000000000000000
	movi.2d	v3, #0000000000000000
LBB4_43:                                ;   Parent Loop BB4_42 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q4, q5, [x0, #-32]
	ldp	q6, q7, [x0], #64
	ldp	q16, q17, [x9, #-32]
	ldp	q18, q19, [x9], #64
	fcmeq.2d	v4, v4, v16
	mvn.16b	v4, v4
	fcmeq.2d	v5, v5, v17
	mvn.16b	v5, v5
	fcmeq.2d	v6, v6, v18
	mvn.16b	v6, v6
	fcmeq.2d	v7, v7, v19
	mvn.16b	v7, v7
	sub.2d	v0, v0, v4
	sub.2d	v1, v1, v5
	sub.2d	v2, v2, v6
	sub.2d	v3, v3, v7
	subs	x1, x1, #8
	b.ne	LBB4_43
; %bb.44:                               ;   in Loop: Header=BB4_42 Depth=1
	add.2d	v0, v1, v0
	add.2d	v1, v3, v2
	add.2d	v0, v1, v0
	addp.2d	d0, v0
	fmov	x9, d0
	mov	x0, x17
	mov	x1, x16
	mov	x2, x15
	cmp	x21, x11
	b.eq	LBB4_41
LBB4_45:                                ;   Parent Loop BB4_42 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x0]
	ldr	d1, [x1], #8
	fcmp	d0, d1
	cinc	x9, x9, ne
	add	x0, x0, x14
	subs	x2, x2, #1
	b.ne	LBB4_45
	b	LBB4_41
LBB4_46:
	mov	x10, #0                         ; =0x0
	mov	x9, #0                          ; =0x0
	lsl	x11, x24, #3
LBB4_47:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_48 Depth 2
	mov	x12, #0                         ; =0x0
	mov	x13, x22
LBB4_48:                                ;   Parent Loop BB4_47 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x23, x12, lsl #3]
	ldr	d1, [x13]
	fcmp	d1, d0
	cinc	x9, x9, ne
	add	x12, x12, #1
	add	x13, x13, x11
	cmp	x21, x12
	b.ne	LBB4_48
; %bb.49:                               ;   in Loop: Header=BB4_47 Depth=1
	add	x10, x10, #1
	add	x23, x23, x11
	add	x22, x22, #8
	cmp	x10, x21
	b.ne	LBB4_47
LBB4_50:
Lloh25:
	adrp	x10, l_.str.6@PAGE
Lloh26:
	add	x10, x10, l_.str.6@PAGEOFF
	cmp	x9, #0
	csel	x8, x8, x10, eq
LBB4_51:
	ucvtf	d0, x21
	fadd	d1, d0, d0
	fmul	d0, d1, d0
	fmov	d1, #8.00000000
	fmul	d0, d0, d1
	fdiv	d0, d0, d8
	mov	x9, #225833675390976            ; =0xcd6500000000
	movk	x9, #16845, lsl #48
	fmov	d1, x9
	fdiv	d0, d0, d1
	scvtf	d1, w20
	fdiv	d1, d9, d1
	str	x8, [sp, #32]
	str	x19, [sp]
	stp	d8, d1, [sp, #8]
	str	d0, [sp, #24]
Lloh27:
	adrp	x0, l_.str.5@PAGE
Lloh28:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
Lloh29:
	adrp	x8, ___stdoutp@GOTPAGE
Lloh30:
	ldr	x8, [x8, ___stdoutp@GOTPAGEOFF]
Lloh31:
	ldr	x0, [x8]
	bl	_fflush
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #80]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
	.loh AdrpAdd	Lloh23, Lloh24
	.loh AdrpAdd	Lloh25, Lloh26
	.loh AdrpLdrGotLdr	Lloh29, Lloh30, Lloh31
	.loh AdrpAdd	Lloh27, Lloh28
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"N = %zu, BS = %d, TS = %d\n"

l_.str.1:                               ; @.str.1
	.asciz	"simd_rows (restrict+simd)"

l_.str.2:                               ; @.str.2
	.asciz	"blocked (BSxBS + simd)"

l_.str.3:                               ; @.str.3
	.asciz	"tiled (BSxBS, TSxTS SLP)"

l_.str.4:                               ; @.str.4
	.asciz	"\320\275\320\265 \321\203\320\264\320\260\320\273\320\276\321\201\321\214 \320\262\321\213\320\264\320\265\320\273\320\270\321\202\321\214 %zu \320\261\320\260\320\271\321\202\n"

l_.str.5:                               ; @.str.5
	.asciz	"%-28s  min %8.4f s  avg %8.4f s  %6.2f GB/s  %s\n"

l_.str.6:                               ; @.str.6
	.asciz	"\320\236\320\250\320\230\320\221\320\232\320\220"

l_.str.7:                               ; @.str.7
	.asciz	"ok"

.subsections_via_symbols

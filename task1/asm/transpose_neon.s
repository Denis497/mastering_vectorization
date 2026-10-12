	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 26, 0	sdk_version 26, 0
	.globl	_transpose_neon2                ; -- Begin function transpose_neon2
	.p2align	2
_transpose_neon2:                       ; @transpose_neon2
	.cfi_startproc
; %bb.0:
	lsl	x8, x3, #3
	ands	x9, x2, #0xfffffffffffffffe
	b.eq	LBB0_5
; %bb.1:
	mov	x10, #0                         ; =0x0
	lsl	x11, x3, #4
	mov	x12, x0
	mov	x13, x1
LBB0_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_3 Depth 2
	mov	x14, #0                         ; =0x0
	mov	x15, x12
	mov	x16, x13
LBB0_3:                                 ;   Parent Loop BB0_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q0, [x15]
	ldr	q1, [x15, x8]
	zip1.2d	v2, v0, v1
	str	q2, [x16]
	zip2.2d	v0, v0, v1
	str	q0, [x16, x8]
	add	x14, x14, #2
	add	x16, x16, x11
	add	x15, x15, #16
	cmp	x14, x9
	b.lo	LBB0_3
; %bb.4:                                ;   in Loop: Header=BB0_2 Depth=1
	add	x10, x10, #2
	add	x13, x13, #16
	add	x12, x12, x11
	cmp	x10, x9
	b.lo	LBB0_2
	b	LBB0_6
LBB0_5:
	cbz	x2, LBB0_21
LBB0_6:
	cmp	x3, #1
	b.ne	LBB0_16
; %bb.7:
	mov	x10, #0                         ; =0x0
	b	LBB0_9
LBB0_8:                                 ;   in Loop: Header=BB0_9 Depth=1
	add	x10, x10, #1
	add	x0, x0, x8
	add	x1, x1, #8
	cmp	x10, x2
	b.eq	LBB0_21
LBB0_9:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_12 Depth 2
                                        ;     Child Loop BB0_15 Depth 2
	cmp	x10, x9
	csel	x14, x9, xzr, lo
	subs	x12, x2, x14
	b.ls	LBB0_8
; %bb.10:                               ;   in Loop: Header=BB0_9 Depth=1
	mov	x11, x14
	cmp	x12, #7
	b.ls	LBB0_14
; %bb.11:                               ;   in Loop: Header=BB0_9 Depth=1
	and	x13, x12, #0xfffffffffffffff8
	add	x11, x14, x13
	lsl	x14, x14, #3
	add	x15, x0, x14
	mov	x16, x13
LBB0_12:                                ;   Parent Loop BB0_9 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x15]
	ldp	q2, q3, [x15, #32]
	add	x17, x1, x14
	stp	q0, q1, [x17]
	stp	q2, q3, [x17, #32]
	add	x15, x15, #64
	add	x14, x14, #64
	subs	x16, x16, #8
	b.ne	LBB0_12
; %bb.13:                               ;   in Loop: Header=BB0_9 Depth=1
	cmp	x12, x13
	b.eq	LBB0_8
LBB0_14:                                ;   in Loop: Header=BB0_9 Depth=1
	mul	x12, x8, x11
LBB0_15:                                ;   Parent Loop BB0_9 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x0, x11, lsl #3]
	str	d0, [x1, x12]
	add	x11, x11, #1
	add	x12, x12, x8
	cmp	x2, x11
	b.ne	LBB0_15
	b	LBB0_8
LBB0_16:
	mov	x10, #0                         ; =0x0
	b	LBB0_18
LBB0_17:                                ;   in Loop: Header=BB0_18 Depth=1
	add	x10, x10, #1
	add	x1, x1, #8
	add	x0, x0, x8
	cmp	x10, x2
	b.eq	LBB0_21
LBB0_18:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_20 Depth 2
	cmp	x10, x9
	csel	x13, x9, xzr, lo
	subs	x11, x2, x13
	b.ls	LBB0_17
; %bb.19:                               ;   in Loop: Header=BB0_18 Depth=1
	madd	x12, x8, x13, x1
	add	x13, x0, x13, lsl #3
LBB0_20:                                ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x13], #8
	str	d0, [x12]
	add	x12, x12, x8
	subs	x11, x11, #1
	b.ne	LBB0_20
	b	LBB0_17
LBB0_21:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_transpose_neon2_blocked        ; -- Begin function transpose_neon2_blocked
	.p2align	2
_transpose_neon2_blocked:               ; @transpose_neon2_blocked
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	stp	x28, x27, [sp, #16]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 112
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
	str	x3, [sp, #8]                    ; 8-byte Folded Spill
	ands	x8, x2, #0xfffffffffffffffe
	b.eq	LBB1_10
; %bb.1:
	mov	x15, #0                         ; =0x0
	ldr	x11, [sp, #8]                   ; 8-byte Folded Reload
	lsl	x12, x11, #3
	add	x9, x1, x12
	lsl	x10, x11, #11
	lsl	x11, x11, #4
	add	x12, x0, x12
	mov	x13, x0
	mov	x14, x1
	b	LBB1_3
LBB1_2:                                 ;   in Loop: Header=BB1_3 Depth=1
	add	x9, x9, #2048
	add	x14, x14, #2048
	add	x12, x12, x10
	add	x13, x13, x10
	mov	x15, x3
	cmp	x3, x8
	b.hs	LBB1_10
LBB1_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_6 Depth 2
                                        ;       Child Loop BB1_7 Depth 3
                                        ;         Child Loop BB1_8 Depth 4
	add	x3, x15, #256
	cmp	x3, x8
	csel	x17, x3, x8, lo
	cmp	x8, x15
	b.ls	LBB1_2
; %bb.4:                                ;   in Loop: Header=BB1_3 Depth=1
	mov	x20, #0                         ; =0x0
	mov	x4, x13
	mov	x5, x12
	mov	x6, x14
	mov	x7, x9
	b	LBB1_6
LBB1_5:                                 ;   in Loop: Header=BB1_6 Depth=2
	add	x7, x7, x10
	add	x6, x6, x10
	add	x5, x5, #2048
	add	x4, x4, #2048
	mov	x20, x16
	cmp	x16, x8
	b.hs	LBB1_2
LBB1_6:                                 ;   Parent Loop BB1_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_7 Depth 3
                                        ;         Child Loop BB1_8 Depth 4
	add	x16, x20, #256
	cmp	x16, x8
	csel	x21, x16, x8, lo
	mov	x22, x4
	mov	x23, x5
	mov	x24, x6
	mov	x25, x7
	mov	x26, x15
	cmp	x8, x20
	b.ls	LBB1_5
LBB1_7:                                 ;   Parent Loop BB1_3 Depth=1
                                        ;     Parent Loop BB1_6 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB1_8 Depth 4
	mov	x27, #0                         ; =0x0
	mov	x28, x22
	mov	x30, x23
	mov	x19, x20
LBB1_8:                                 ;   Parent Loop BB1_3 Depth=1
                                        ;     Parent Loop BB1_6 Depth=2
                                        ;       Parent Loop BB1_7 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	q0, [x28], #16
	ldr	q1, [x30], #16
	zip1.2d	v2, v0, v1
	str	q2, [x24, x27]
	zip2.2d	v0, v0, v1
	str	q0, [x25, x27]
	add	x19, x19, #2
	add	x27, x27, x11
	cmp	x19, x21
	b.lo	LBB1_8
; %bb.9:                                ;   in Loop: Header=BB1_7 Depth=3
	add	x26, x26, #2
	add	x25, x25, #16
	add	x24, x24, #16
	add	x23, x23, x11
	add	x22, x22, x11
	cmp	x26, x17
	b.lo	LBB1_7
	b	LBB1_5
LBB1_10:
	cbz	x2, LBB1_26
; %bb.11:
	ldr	x10, [sp, #8]                   ; 8-byte Folded Reload
	cmp	x10, #1
	b.ne	LBB1_21
; %bb.12:
	mov	x9, #0                          ; =0x0
	lsl	x10, x10, #3
	b	LBB1_14
LBB1_13:                                ;   in Loop: Header=BB1_14 Depth=1
	add	x9, x9, #1
	add	x0, x0, x10
	add	x1, x1, #8
	cmp	x9, x2
	b.eq	LBB1_26
LBB1_14:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_17 Depth 2
                                        ;     Child Loop BB1_20 Depth 2
	cmp	x9, x8
	csel	x14, x8, xzr, lo
	subs	x12, x2, x14
	b.ls	LBB1_13
; %bb.15:                               ;   in Loop: Header=BB1_14 Depth=1
	mov	x11, x14
	cmp	x12, #7
	b.ls	LBB1_19
; %bb.16:                               ;   in Loop: Header=BB1_14 Depth=1
	and	x13, x12, #0xfffffffffffffff8
	add	x11, x14, x13
	lsl	x14, x14, #3
	add	x15, x0, x14
	mov	x16, x13
LBB1_17:                                ;   Parent Loop BB1_14 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x15]
	ldp	q2, q3, [x15, #32]
	add	x17, x1, x14
	stp	q0, q1, [x17]
	stp	q2, q3, [x17, #32]
	add	x15, x15, #64
	add	x14, x14, #64
	subs	x16, x16, #8
	b.ne	LBB1_17
; %bb.18:                               ;   in Loop: Header=BB1_14 Depth=1
	cmp	x12, x13
	b.eq	LBB1_13
LBB1_19:                                ;   in Loop: Header=BB1_14 Depth=1
	mul	x12, x10, x11
LBB1_20:                                ;   Parent Loop BB1_14 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x0, x11, lsl #3]
	str	d0, [x1, x12]
	add	x11, x11, #1
	add	x12, x12, x10
	cmp	x2, x11
	b.ne	LBB1_20
	b	LBB1_13
LBB1_21:
	mov	x9, #0                          ; =0x0
	lsl	x10, x10, #3
	b	LBB1_23
LBB1_22:                                ;   in Loop: Header=BB1_23 Depth=1
	add	x9, x9, #1
	add	x1, x1, #8
	add	x0, x0, x10
	cmp	x9, x2
	b.eq	LBB1_26
LBB1_23:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_25 Depth 2
	cmp	x9, x8
	csel	x13, x8, xzr, lo
	subs	x11, x2, x13
	b.ls	LBB1_22
; %bb.24:                               ;   in Loop: Header=BB1_23 Depth=1
	madd	x12, x10, x13, x1
	add	x13, x0, x13, lsl #3
LBB1_25:                                ;   Parent Loop BB1_23 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x13], #8
	str	d0, [x12]
	add	x12, x12, x10
	subs	x11, x11, #1
	b.ne	LBB1_25
	b	LBB1_22
LBB1_26:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_transpose_neon4_blocked        ; -- Begin function transpose_neon4_blocked
	.p2align	2
_transpose_neon4_blocked:               ; @transpose_neon4_blocked
	.cfi_startproc
; %bb.0:
	stp	x26, x25, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	ands	x8, x2, #0xfffffffffffffffc
	b.eq	LBB2_10
; %bb.1:
	mov	x14, #0                         ; =0x0
	lsl	x9, x3, #11
	lsl	x10, x3, #5
	mov	x11, x0
	lsl	x12, x3, #3
	mov	x13, x1
	b	LBB2_3
LBB2_2:                                 ;   in Loop: Header=BB2_3 Depth=1
	add	x13, x13, #2048
	add	x11, x11, x9
	mov	x14, x15
	cmp	x15, x8
	b.hs	LBB2_10
LBB2_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_6 Depth 2
                                        ;       Child Loop BB2_7 Depth 3
                                        ;         Child Loop BB2_8 Depth 4
	add	x15, x14, #256
	cmp	x15, x8
	csel	x16, x15, x8, lo
	cmp	x8, x14
	b.ls	LBB2_2
; %bb.4:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	x5, #0                          ; =0x0
	mov	x17, x11
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
	cmp	x8, x5
	b.ls	LBB2_5
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
	ldp	q0, q1, [x22]
	add	x25, x22, x12
	add	x26, x25, x12
	ldp	q2, q3, [x25]
	ldp	q4, q5, [x26]
	add	x25, x26, x12
	ldp	q6, q7, [x25]
	zip1.2d	v16, v0, v2
	zip1.2d	v17, v4, v6
	stp	q16, q17, [x23]
	zip2.2d	v0, v0, v2
	zip2.2d	v2, v4, v6
	add	x25, x23, x12
	add	x26, x25, x12
	stp	q0, q2, [x25]
	zip1.2d	v0, v1, v3
	zip1.2d	v2, v5, v7
	stp	q0, q2, [x26]
	zip2.2d	v0, v1, v3
	add	x25, x26, x12
	zip2.2d	v1, v5, v7
	stp	q0, q1, [x25]
	add	x24, x24, #4
	add	x23, x23, x10
	add	x22, x22, #32
	cmp	x24, x7
	b.lo	LBB2_8
; %bb.9:                                ;   in Loop: Header=BB2_7 Depth=3
	add	x21, x21, #4
	add	x20, x20, #32
	add	x19, x19, x10
	cmp	x21, x16
	b.lo	LBB2_7
	b	LBB2_5
LBB2_10:
	cbz	x2, LBB2_26
; %bb.11:
	cmp	x3, #1
	b.ne	LBB2_21
; %bb.12:
	mov	x9, #0                          ; =0x0
	lsl	x10, x3, #3
	b	LBB2_14
LBB2_13:                                ;   in Loop: Header=BB2_14 Depth=1
	add	x9, x9, #1
	add	x0, x0, x10
	add	x1, x1, #8
	cmp	x9, x2
	b.eq	LBB2_26
LBB2_14:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_17 Depth 2
                                        ;     Child Loop BB2_20 Depth 2
	cmp	x9, x8
	csel	x14, x8, xzr, lo
	subs	x12, x2, x14
	b.ls	LBB2_13
; %bb.15:                               ;   in Loop: Header=BB2_14 Depth=1
	mov	x11, x14
	cmp	x12, #7
	b.ls	LBB2_19
; %bb.16:                               ;   in Loop: Header=BB2_14 Depth=1
	and	x13, x12, #0xfffffffffffffff8
	add	x11, x14, x13
	lsl	x14, x14, #3
	add	x15, x0, x14
	mov	x16, x13
LBB2_17:                                ;   Parent Loop BB2_14 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x15]
	ldp	q2, q3, [x15, #32]
	add	x17, x1, x14
	stp	q0, q1, [x17]
	stp	q2, q3, [x17, #32]
	add	x15, x15, #64
	add	x14, x14, #64
	subs	x16, x16, #8
	b.ne	LBB2_17
; %bb.18:                               ;   in Loop: Header=BB2_14 Depth=1
	cmp	x12, x13
	b.eq	LBB2_13
LBB2_19:                                ;   in Loop: Header=BB2_14 Depth=1
	mul	x12, x10, x11
LBB2_20:                                ;   Parent Loop BB2_14 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x0, x11, lsl #3]
	str	d0, [x1, x12]
	add	x11, x11, #1
	add	x12, x12, x10
	cmp	x2, x11
	b.ne	LBB2_20
	b	LBB2_13
LBB2_21:
	mov	x9, #0                          ; =0x0
	lsl	x10, x3, #3
	b	LBB2_23
LBB2_22:                                ;   in Loop: Header=BB2_23 Depth=1
	add	x9, x9, #1
	add	x1, x1, #8
	add	x0, x0, x10
	cmp	x9, x2
	b.eq	LBB2_26
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
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #64             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_transpose_neon4_pf             ; -- Begin function transpose_neon4_pf
	.p2align	2
_transpose_neon4_pf:                    ; @transpose_neon4_pf
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #224
	stp	x28, x27, [sp, #128]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #144]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #160]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #176]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #192]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #208]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 224
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
	stp	x3, x0, [sp, #8]                ; 16-byte Folded Spill
	str	x1, [sp, #24]                   ; 8-byte Folded Spill
	str	x2, [sp]                        ; 8-byte Folded Spill
	ands	x5, x2, #0xfffffffffffffffc
	b.eq	LBB3_10
; %bb.1:
	mov	x0, #0                          ; =0x0
	ldr	x10, [sp, #8]                   ; 8-byte Folded Reload
	add	x9, x10, x10, lsl #1
	lsl	x12, x10, #4
	lsl	x9, x9, #3
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	add	x11, x8, x9
	stp	x11, x5, [sp, #96]              ; 16-byte Folded Spill
	lsl	x11, x10, #11
	str	x11, [sp, #120]                 ; 8-byte Folded Spill
	lsl	x11, x10, #5
	add	x13, x8, x12
	str	x13, [sp, #88]                  ; 8-byte Folded Spill
	lsl	x13, x10, #3
	add	x10, x8, x13
	str	x10, [sp, #80]                  ; 8-byte Folded Spill
	ldr	x10, [sp, #16]                  ; 8-byte Folded Reload
	add	x9, x10, x9
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	add	x9, x10, x12
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	add	x9, x10, x13
	stp	x10, x9, [sp, #48]              ; 16-byte Folded Spill
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	b	LBB3_3
LBB3_2:                                 ;   in Loop: Header=BB3_3 Depth=1
	ldp	x8, x10, [sp, #88]              ; 16-byte Folded Reload
	add	x9, x10, #2048
	add	x8, x8, #2048
	stp	x8, x9, [sp, #88]               ; 16-byte Folded Spill
	ldp	x9, x8, [sp, #72]               ; 16-byte Folded Reload
	add	x10, x8, #2048
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	add	x8, x8, #2048
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #120]                  ; 8-byte Folded Reload
	add	x9, x9, x8
	stp	x9, x10, [sp, #72]              ; 16-byte Folded Spill
	ldr	x9, [sp, #64]                   ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	mov	x0, x8
	cmp	x8, x5
	b.hs	LBB3_10
LBB3_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_6 Depth 2
                                        ;       Child Loop BB3_7 Depth 3
                                        ;         Child Loop BB3_8 Depth 4
	add	x8, x0, #256
	cmp	x8, x5
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	csel	x7, x8, x5, lo
	cmp	x0, x7
	b.hs	LBB3_2
; %bb.4:                                ;   in Loop: Header=BB3_3 Depth=1
	mov	x27, #0                         ; =0x0
	ldp	x17, x16, [sp, #48]             ; 16-byte Folded Reload
	ldp	x15, x14, [sp, #64]             ; 16-byte Folded Reload
	ldr	x4, [sp, #40]                   ; 8-byte Folded Reload
	ldp	x13, x9, [sp, #80]              ; 16-byte Folded Reload
	ldr	x2, [sp, #96]                   ; 8-byte Folded Reload
	str	x0, [sp, #112]                  ; 8-byte Folded Spill
	b	LBB3_6
LBB3_5:                                 ;   in Loop: Header=BB3_6 Depth=2
	ldp	x0, x8, [sp, #112]              ; 16-byte Folded Reload
	add	x2, x2, x8
	add	x9, x9, x8
	add	x13, x13, x8
	add	x4, x4, x8
	add	x14, x14, #2048
	add	x15, x15, #2048
	add	x16, x16, #2048
	add	x17, x17, #2048
	mov	x27, x3
	ldr	x5, [sp, #104]                  ; 8-byte Folded Reload
	cmp	x3, x5
	b.hs	LBB3_2
LBB3_6:                                 ;   Parent Loop BB3_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_7 Depth 3
                                        ;         Child Loop BB3_8 Depth 4
	add	x3, x27, #256
	cmp	x3, x5
	csel	x30, x3, x5, lo
	mov	x19, x17
	mov	x20, x16
	mov	x21, x15
	mov	x22, x14
	mov	x23, x4
	mov	x24, x13
	mov	x25, x9
	mov	x26, x2
	mov	x5, x0
	cmp	x27, x30
	b.hs	LBB3_5
LBB3_7:                                 ;   Parent Loop BB3_3 Depth=1
                                        ;     Parent Loop BB3_6 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB3_8 Depth 4
	mov	x6, #0                          ; =0x0
	mov	x12, #0                         ; =0x0
	mov	x28, x27
LBB3_8:                                 ;   Parent Loop BB3_3 Depth=1
                                        ;     Parent Loop BB3_6 Depth=2
                                        ;       Parent Loop BB3_7 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	add	x0, x19, x6
	prfm	pldl1strm, [x0, #256]
	add	x1, x20, x6
	prfm	pldl1strm, [x1, #256]
	add	x8, x21, x6
	prfm	pldl1strm, [x8, #256]
	add	x10, x22, x6
	prfm	pldl1strm, [x10, #256]
	ld1.2d	{ v0, v1 }, [x0]
	ld1.2d	{ v2, v3 }, [x1]
	ld1.2d	{ v4, v5 }, [x8]
	ld1.2d	{ v6, v7 }, [x10]
	add	x8, x23, x12
	zip1.2d	v16, v0, v2
	zip1.2d	v17, v4, v6
	st1.2d	{ v16, v17 }, [x8]
	zip2.2d	v16, v0, v2
	zip2.2d	v17, v4, v6
	add	x8, x24, x12
	st1.2d	{ v16, v17 }, [x8]
	zip1.2d	v16, v1, v3
	zip1.2d	v17, v5, v7
	add	x8, x25, x12
	st1.2d	{ v16, v17 }, [x8]
	zip2.2d	v0, v1, v3
	zip2.2d	v1, v5, v7
	add	x8, x26, x12
	add	x28, x28, #4
	add	x12, x12, x11
	add	x6, x6, #32
	st1.2d	{ v0, v1 }, [x8]
	cmp	x28, x30
	b.lo	LBB3_8
; %bb.9:                                ;   in Loop: Header=BB3_7 Depth=3
	add	x5, x5, #4
	add	x26, x26, #32
	add	x25, x25, #32
	add	x24, x24, #32
	add	x23, x23, #32
	add	x22, x22, x11
	add	x21, x21, x11
	add	x20, x20, x11
	add	x19, x19, x11
	cmp	x5, x7
	b.lo	LBB3_7
	b	LBB3_5
LBB3_10:
	ldr	x17, [sp]                       ; 8-byte Folded Reload
	ldp	x1, x0, [sp, #16]               ; 16-byte Folded Reload
	cbz	x17, LBB3_26
; %bb.11:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	cmp	x8, #1
	b.ne	LBB3_21
; %bb.12:
	mov	x9, #0                          ; =0x0
	lsl	x10, x8, #3
	b	LBB3_14
LBB3_13:                                ;   in Loop: Header=BB3_14 Depth=1
	add	x9, x9, #1
	add	x1, x1, x10
	add	x0, x0, #8
	cmp	x9, x17
	b.eq	LBB3_26
LBB3_14:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_17 Depth 2
                                        ;     Child Loop BB3_20 Depth 2
	cmp	x9, x5
	csel	x14, x5, xzr, lo
	subs	x12, x17, x14
	b.ls	LBB3_13
; %bb.15:                               ;   in Loop: Header=BB3_14 Depth=1
	mov	x11, x14
	cmp	x12, #7
	b.ls	LBB3_19
; %bb.16:                               ;   in Loop: Header=BB3_14 Depth=1
	and	x13, x12, #0xfffffffffffffff8
	add	x11, x14, x13
	lsl	x14, x14, #3
	add	x15, x1, x14
	mov	x16, x13
LBB3_17:                                ;   Parent Loop BB3_14 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x15]
	ldp	q2, q3, [x15, #32]
	add	x8, x0, x14
	stp	q0, q1, [x8]
	stp	q2, q3, [x8, #32]
	add	x15, x15, #64
	add	x14, x14, #64
	subs	x16, x16, #8
	b.ne	LBB3_17
; %bb.18:                               ;   in Loop: Header=BB3_14 Depth=1
	cmp	x12, x13
	b.eq	LBB3_13
LBB3_19:                                ;   in Loop: Header=BB3_14 Depth=1
	mul	x12, x10, x11
LBB3_20:                                ;   Parent Loop BB3_14 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x1, x11, lsl #3]
	str	d0, [x0, x12]
	add	x11, x11, #1
	add	x12, x12, x10
	cmp	x17, x11
	b.ne	LBB3_20
	b	LBB3_13
LBB3_21:
	mov	x9, #0                          ; =0x0
	lsl	x10, x8, #3
	b	LBB3_23
LBB3_22:                                ;   in Loop: Header=BB3_23 Depth=1
	add	x9, x9, #1
	add	x0, x0, #8
	add	x1, x1, x10
	cmp	x9, x17
	b.eq	LBB3_26
LBB3_23:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_25 Depth 2
	cmp	x9, x5
	csel	x13, x5, xzr, lo
	subs	x11, x17, x13
	b.ls	LBB3_22
; %bb.24:                               ;   in Loop: Header=BB3_23 Depth=1
	madd	x12, x10, x13, x0
	add	x13, x1, x13, lsl #3
LBB3_25:                                ;   Parent Loop BB3_23 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x13], #8
	str	d0, [x12]
	add	x12, x12, x10
	subs	x11, x11, #1
	b.ne	LBB3_25
	b	LBB3_22
LBB3_26:
	ldp	x29, x30, [sp, #208]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #192]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #176]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #160]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #144]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #128]            ; 16-byte Folded Reload
	add	sp, sp, #224
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_transpose_neon8_blocked        ; -- Begin function transpose_neon8_blocked
	.p2align	2
_transpose_neon8_blocked:               ; @transpose_neon8_blocked
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #288
	stp	x28, x27, [sp, #192]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #208]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #224]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #240]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #256]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #272]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 288
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
	stp	x3, x0, [sp, #16]               ; 16-byte Folded Spill
	str	x1, [sp, #32]                   ; 8-byte Folded Spill
	str	x2, [sp, #8]                    ; 8-byte Folded Spill
	ands	x3, x2, #0xfffffffffffffff8
	b.eq	LBB4_10
; %bb.1:
	mov	x0, #0                          ; =0x0
	ldp	x12, x11, [sp, #16]             ; 16-byte Folded Reload
	lsl	x8, x12, #11
	str	x8, [sp, #136]                  ; 8-byte Folded Spill
	lsl	x10, x12, #6
	mov	w8, #56                         ; =0x38
	madd	x8, x12, x8, x11
	str	x8, [sp, #112]                  ; 8-byte Folded Spill
	add	x8, x12, x12, lsl #1
	lsl	x8, x8, #4
	add	x9, x11, x8
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	mov	w9, #40                         ; =0x28
	madd	x9, x12, x9, x11
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	mov	w9, #24                         ; =0x18
	madd	x9, x12, x9, x11
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	lsl	x15, x12, #3
	add	x9, x11, x15
	stp	x11, x9, [sp, #72]              ; 16-byte Folded Spill
	mov	w9, #32                         ; =0x20
	sub	x17, x9, x8
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	add	x8, x11, x12, lsl #5
	stp	x8, x9, [sp, #56]               ; 16-byte Folded Spill
	add	x8, x11, x12, lsl #4
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	str	x3, [sp, #120]                  ; 8-byte Folded Spill
	b	LBB4_3
LBB4_2:                                 ;   in Loop: Header=BB4_3 Depth=1
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	add	x11, x8, #2048
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #96]                   ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	add	x9, x9, x8
	stp	x9, x11, [sp, #56]              ; 16-byte Folded Spill
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	mov	x0, x8
	cmp	x8, x3
	b.hs	LBB4_10
LBB4_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_6 Depth 2
                                        ;       Child Loop BB4_7 Depth 3
                                        ;         Child Loop BB4_8 Depth 4
	add	x8, x0, #256
	cmp	x8, x3
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	csel	x21, x8, x3, lo
	cmp	x0, x21
	b.hs	LBB4_2
; %bb.4:                                ;   in Loop: Header=BB4_3 Depth=1
	mov	x2, #0                          ; =0x0
	ldp	x22, x23, [sp, #72]             ; 16-byte Folded Reload
	ldp	x24, x26, [sp, #48]             ; 16-byte Folded Reload
	ldp	x25, x20, [sp, #88]             ; 16-byte Folded Reload
	ldp	x12, x14, [sp, #104]            ; 16-byte Folded Reload
	ldr	x4, [sp, #64]                   ; 8-byte Folded Reload
	str	x0, [sp, #128]                  ; 8-byte Folded Spill
	b	LBB4_6
LBB4_5:                                 ;   in Loop: Header=BB4_6 Depth=2
	ldp	x9, x8, [sp, #136]              ; 16-byte Folded Reload
	add	x4, x4, x9
	add	x14, x14, #2048
	add	x12, x12, #2048
	add	x20, x20, #2048
	ldp	x26, x25, [sp, #152]            ; 16-byte Folded Reload
	add	x26, x26, #2048
	add	x25, x25, #2048
	ldp	x24, x23, [sp, #168]            ; 16-byte Folded Reload
	add	x24, x24, #2048
	add	x23, x23, #2048
	ldr	x22, [sp, #184]                 ; 8-byte Folded Reload
	add	x22, x22, #2048
	mov	x2, x8
	ldp	x3, x0, [sp, #120]              ; 16-byte Folded Reload
	cmp	x8, x3
	b.hs	LBB4_2
LBB4_6:                                 ;   Parent Loop BB4_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB4_7 Depth 3
                                        ;         Child Loop BB4_8 Depth 4
	add	x8, x2, #256
	cmp	x8, x3
	stp	x8, x26, [sp, #144]             ; 16-byte Folded Spill
	csel	x11, x8, x3, lo
	stp	x23, x22, [sp, #176]            ; 16-byte Folded Spill
	stp	x25, x24, [sp, #160]            ; 16-byte Folded Spill
	mov	x27, x20
	mov	x28, x12
	mov	x30, x14
	mov	x6, x4
	cmp	x2, x11
	b.hs	LBB4_5
LBB4_7:                                 ;   Parent Loop BB4_3 Depth=1
                                        ;     Parent Loop BB4_6 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB4_8 Depth 4
	mov	x1, #0                          ; =0x0
	mov	x8, x6
	mov	x3, x2
	mov	x5, x6
LBB4_8:                                 ;   Parent Loop BB4_3 Depth=1
                                        ;     Parent Loop BB4_6 Depth=2
                                        ;       Parent Loop BB4_7 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	add	x16, x22, x1
	ld1.2d	{ v0, v1 }, [x16], #32
	add	x19, x23, x1
	ld1.2d	{ v2, v3 }, [x19], #32
	add	x13, x24, x1
	ld1.2d	{ v4, v5 }, [x13], #32
	add	x7, x25, x1
	ld1.2d	{ v6, v7 }, [x7], #32
	zip1.2d	v16, v0, v2
	zip1.2d	v17, v4, v6
	st1.2d	{ v16, v17 }, [x5], x10
	zip2.2d	v16, v0, v2
	zip2.2d	v17, v4, v6
	add	x9, x8, x15
	st1.2d	{ v16, v17 }, [x9], x15
	zip1.2d	v16, v1, v3
	zip1.2d	v17, v5, v7
	zip2.2d	v0, v1, v3
	st1.2d	{ v16, v17 }, [x9], x15
	zip2.2d	v1, v5, v7
	st1.2d	{ v0, v1 }, [x9], x15
	ld1.2d	{ v0, v1 }, [x16]
	ld1.2d	{ v2, v3 }, [x19]
	ld1.2d	{ v4, v5 }, [x13]
	ld1.2d	{ v6, v7 }, [x7]
	zip1.2d	v16, v0, v2
	zip1.2d	v17, v4, v6
	st1.2d	{ v16, v17 }, [x9], x15
	zip2.2d	v16, v0, v2
	zip2.2d	v17, v4, v6
	st1.2d	{ v16, v17 }, [x9], x15
	zip1.2d	v16, v1, v3
	zip1.2d	v17, v5, v7
	st1.2d	{ v16, v17 }, [x9], x15
	zip2.2d	v0, v1, v3
	zip2.2d	v1, v5, v7
	st1.2d	{ v0, v1 }, [x9], x17
	add	x13, x26, x1
	ld1.2d	{ v0, v1 }, [x13], #32
	add	x16, x27, x1
	ld1.2d	{ v2, v3 }, [x16], #32
	add	x7, x28, x1
	ld1.2d	{ v4, v5 }, [x7], #32
	add	x19, x30, x1
	ld1.2d	{ v6, v7 }, [x19], #32
	add	x8, x8, #32
	zip1.2d	v16, v0, v2
	zip1.2d	v17, v4, v6
	st1.2d	{ v16, v17 }, [x8]
	zip2.2d	v16, v0, v2
	zip2.2d	v17, v4, v6
	st1.2d	{ v16, v17 }, [x9], x15
	zip1.2d	v16, v1, v3
	zip1.2d	v17, v5, v7
	zip2.2d	v0, v1, v3
	st1.2d	{ v16, v17 }, [x9], x15
	zip2.2d	v1, v5, v7
	st1.2d	{ v0, v1 }, [x9], x15
	ld1.2d	{ v0, v1 }, [x13]
	ld1.2d	{ v2, v3 }, [x16]
	ld1.2d	{ v4, v5 }, [x7]
	ld1.2d	{ v6, v7 }, [x19]
	zip1.2d	v16, v0, v2
	zip1.2d	v17, v4, v6
	st1.2d	{ v16, v17 }, [x9], x15
	zip2.2d	v16, v0, v2
	zip2.2d	v17, v4, v6
	zip1.2d	v18, v1, v3
	st1.2d	{ v16, v17 }, [x9], x15
	zip1.2d	v19, v5, v7
	zip2.2d	v0, v1, v3
	zip2.2d	v1, v5, v7
	st1.2d	{ v18, v19 }, [x9], x15
	st1.2d	{ v0, v1 }, [x9]
	add	x3, x3, #8
	add	x1, x1, #64
	mov	x8, x5
	cmp	x3, x11
	b.lo	LBB4_8
; %bb.9:                                ;   in Loop: Header=BB4_7 Depth=3
	add	x0, x0, #8
	add	x6, x6, #64
	add	x30, x30, x10
	add	x28, x28, x10
	add	x27, x27, x10
	add	x26, x26, x10
	add	x25, x25, x10
	add	x24, x24, x10
	add	x23, x23, x10
	add	x22, x22, x10
	cmp	x0, x21
	b.lo	LBB4_7
	b	LBB4_5
LBB4_10:
	ldr	x17, [sp, #8]                   ; 8-byte Folded Reload
	ldp	x1, x0, [sp, #24]               ; 16-byte Folded Reload
	cbz	x17, LBB4_34
; %bb.11:
	ldr	x11, [sp, #16]                  ; 8-byte Folded Reload
	cmp	x11, #1
	b.ne	LBB4_21
; %bb.12:
	mov	x9, #0                          ; =0x0
	and	x8, x17, #0x7
	cbz	x8, LBB4_26
; %bb.13:
	sub	x10, x8, x17
	lsl	x11, x11, #3
	b	LBB4_15
LBB4_14:                                ;   in Loop: Header=BB4_15 Depth=1
	add	x9, x9, #1
	add	x1, x1, x11
	add	x0, x0, #8
	cmp	x9, x17
	b.eq	LBB4_34
LBB4_15:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_18 Depth 2
                                        ;     Child Loop BB4_20 Depth 2
	cmp	x9, x3
	csel	x14, x3, xzr, lo
	subs	x13, x17, x14
	b.ls	LBB4_14
; %bb.16:                               ;   in Loop: Header=BB4_15 Depth=1
	mov	x12, x14
	cmp	x13, #8
	b.lo	LBB4_19
; %bb.17:                               ;   in Loop: Header=BB4_15 Depth=1
	sub	x12, x13, x8
	add	x12, x14, x12
	add	x13, x10, x14
	lsl	x14, x14, #3
	add	x15, x1, x14
LBB4_18:                                ;   Parent Loop BB4_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x15]
	ldp	q2, q3, [x15, #32]
	add	x16, x0, x14
	stp	q0, q1, [x16]
	stp	q2, q3, [x16, #32]
	add	x15, x15, #64
	add	x14, x14, #64
	adds	x13, x13, #8
	b.ne	LBB4_18
LBB4_19:                                ;   in Loop: Header=BB4_15 Depth=1
	mul	x13, x11, x12
LBB4_20:                                ;   Parent Loop BB4_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x1, x12, lsl #3]
	str	d0, [x0, x13]
	add	x12, x12, #1
	add	x13, x13, x11
	cmp	x17, x12
	b.ne	LBB4_20
	b	LBB4_14
LBB4_21:
	mov	x8, #0                          ; =0x0
	lsl	x9, x11, #3
	b	LBB4_23
LBB4_22:                                ;   in Loop: Header=BB4_23 Depth=1
	add	x8, x8, #1
	add	x0, x0, #8
	add	x1, x1, x9
	cmp	x8, x17
	b.eq	LBB4_34
LBB4_23:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_25 Depth 2
	cmp	x8, x3
	csel	x12, x3, xzr, lo
	subs	x10, x17, x12
	b.ls	LBB4_22
; %bb.24:                               ;   in Loop: Header=BB4_23 Depth=1
	madd	x11, x9, x12, x0
	add	x12, x1, x12, lsl #3
LBB4_25:                                ;   Parent Loop BB4_23 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x12], #8
	str	d0, [x11]
	add	x11, x11, x9
	subs	x10, x10, #1
	b.ne	LBB4_25
	b	LBB4_22
LBB4_26:
	sub	x8, x8, x17
	lsl	x10, x11, #3
	b	LBB4_28
LBB4_27:                                ;   in Loop: Header=BB4_28 Depth=1
	add	x9, x9, #1
	add	x1, x1, x10
	add	x0, x0, #8
	cmp	x9, x17
	b.eq	LBB4_34
LBB4_28:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_33 Depth 2
                                        ;     Child Loop BB4_31 Depth 2
	cmp	x9, x3
	csel	x12, x3, xzr, lo
	subs	x11, x17, x12
	b.ls	LBB4_27
; %bb.29:                               ;   in Loop: Header=BB4_28 Depth=1
	cmp	x11, #7
	b.hi	LBB4_32
; %bb.30:                               ;   in Loop: Header=BB4_28 Depth=1
	mul	x11, x10, x12
LBB4_31:                                ;   Parent Loop BB4_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x1, x12, lsl #3]
	str	d0, [x0, x11]
	add	x12, x12, #1
	add	x11, x11, x10
	cmp	x17, x12
	b.ne	LBB4_31
	b	LBB4_27
LBB4_32:                                ;   in Loop: Header=BB4_28 Depth=1
	add	x11, x8, x12
	lsl	x12, x12, #3
	add	x13, x1, x12
LBB4_33:                                ;   Parent Loop BB4_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x13]
	ldp	q2, q3, [x13, #32]
	add	x14, x0, x12
	stp	q0, q1, [x14]
	stp	q2, q3, [x14, #32]
	add	x13, x13, #64
	add	x12, x12, #64
	adds	x11, x11, #8
	b.ne	LBB4_33
	b	LBB4_27
LBB4_34:
	ldp	x29, x30, [sp, #272]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #256]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #240]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #224]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #208]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #192]            ; 16-byte Folded Reload
	add	sp, sp, #288
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_copy_ref                       ; -- Begin function copy_ref
	.p2align	2
_copy_ref:                              ; @copy_ref
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	mul	x9, x2, x3
	lsl	x2, x9, #3
	mov	x0, x1
	mov	x1, x8
	b	_memcpy
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function main
lCPI6_0:
	.quad	0                               ; 0x0
	.quad	1                               ; 0x1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #160
	stp	d11, d10, [sp, #48]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #64]               ; 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
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
	cmp	w0, #2
	b.lt	LBB6_3
; %bb.1:
	mov	x21, x1
	mov	x22, x0
	ldr	x0, [x1, #8]
	mov	x1, #0                          ; =0x0
	mov	w2, #10                         ; =0xa
	bl	_strtoull
	mov	x19, x0
	cmp	w22, #2
	b.ne	LBB6_40
; %bb.2:
	mov	x0, #0                          ; =0x0
	mov	w20, #5                         ; =0x5
	b	LBB6_4
LBB6_3:
	mov	x0, #0                          ; =0x0
	mov	w20, #5                         ; =0x5
	mov	w19, #8192                      ; =0x2000
LBB6_4:
	add	x21, x0, x19
	mul	x8, x19, x21
	lsl	x24, x8, #3
	add	x8, x24, #127
	and	x25, x8, #0xffffffffffffff80
	mov	w0, #128                        ; =0x80
	mov	x1, x25
	bl	_aligned_alloc
	cbz	x0, LBB6_53
; %bb.5:
	mov	x22, x0
	mov	w0, #128                        ; =0x80
	mov	x1, x25
	bl	_aligned_alloc
	cbz	x0, LBB6_53
; %bb.6:
	mov	x23, x0
	cbz	x19, LBB6_48
; %bb.7:
	cmp	x19, #7
	b.hi	LBB6_35
; %bb.8:
	str	xzr, [x22]
	cmp	x19, #1
	b.eq	LBB6_48
; %bb.9:
	mov	x8, #4607182418800017408        ; =0x3ff0000000000000
	str	x8, [x22, #8]
	cmp	x19, #2
	b.eq	LBB6_15
; %bb.10:
	mov	x8, #4611686018427387904        ; =0x4000000000000000
	str	x8, [x22, #16]
	cmp	x19, #3
	b.eq	LBB6_15
; %bb.11:
	mov	x8, #4613937818241073152        ; =0x4008000000000000
	str	x8, [x22, #24]
	cmp	x19, #4
	b.eq	LBB6_15
; %bb.12:
	mov	x8, #4616189618054758400        ; =0x4010000000000000
	str	x8, [x22, #32]
	cmp	x19, #5
	b.eq	LBB6_15
; %bb.13:
	mov	x8, #4617315517961601024        ; =0x4014000000000000
	str	x8, [x22, #40]
	cmp	x19, #6
	b.eq	LBB6_15
; %bb.14:
	mov	x8, #4618441417868443648        ; =0x4018000000000000
	str	x8, [x22, #48]
	cmp	x19, #1
	b.eq	LBB6_48
LBB6_15:
	ucvtf	d0, x19
	add	x8, x19, #1
	ucvtf	d1, x8
	add	x8, x22, x21, lsl #3
	stp	d0, d1, [x8]
	cmp	x19, #2
	b.eq	LBB6_48
; %bb.16:
	add	x9, x19, #2
	ucvtf	d0, x9
	str	d0, [x8, #16]
	cmp	x19, #3
	b.eq	LBB6_21
; %bb.17:
	add	x9, x19, #3
	ucvtf	d0, x9
	str	d0, [x8, #24]
	cmp	x19, #4
	b.eq	LBB6_21
; %bb.18:
	add	x9, x19, #4
	ucvtf	d0, x9
	str	d0, [x8, #32]
	cmp	x19, #5
	b.eq	LBB6_21
; %bb.19:
	add	x9, x19, #5
	ucvtf	d0, x9
	str	d0, [x8, #40]
	cmp	x19, #6
	b.eq	LBB6_21
; %bb.20:
	add	x9, x19, #6
	ucvtf	d0, x9
	str	d0, [x8, #48]
	cmp	x19, #2
	b.eq	LBB6_48
LBB6_21:
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
	b.eq	LBB6_48
; %bb.22:
	add	x10, x8, #3
	ucvtf	d0, x10
	str	d0, [x9, #24]
	cmp	x19, #4
	b.eq	LBB6_26
; %bb.23:
	add	x10, x8, #4
	ucvtf	d0, x10
	str	d0, [x9, #32]
	cmp	x19, #5
	b.eq	LBB6_26
; %bb.24:
	add	x10, x8, #5
	ucvtf	d0, x10
	str	d0, [x9, #40]
	cmp	x19, #6
	b.eq	LBB6_26
; %bb.25:
	add	x8, x8, #6
	ucvtf	d0, x8
	str	d0, [x9, #48]
	cmp	x19, #3
	b.eq	LBB6_48
LBB6_26:
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
	b.eq	LBB6_48
; %bb.27:
	add	x10, x8, #4
	ucvtf	d0, x10
	str	d0, [x9, #32]
	cmp	x19, #5
	b.eq	LBB6_30
; %bb.28:
	add	x10, x8, #5
	ucvtf	d0, x10
	str	d0, [x9, #40]
	cmp	x19, #6
	b.eq	LBB6_30
; %bb.29:
	add	x10, x8, #6
	ucvtf	d0, x10
	str	d0, [x9, #48]
	cmp	x19, #4
	b.eq	LBB6_48
LBB6_30:
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
	b.eq	LBB6_48
; %bb.31:
	add	x11, x9, #5
	ucvtf	d0, x11
	str	d0, [x10, #40]
	cmp	x19, #6
	b.eq	LBB6_33
; %bb.32:
	add	x9, x9, #6
	ucvtf	d0, x9
	str	d0, [x10, #48]
	cmp	x19, #5
	b.eq	LBB6_48
LBB6_33:
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
	b.eq	LBB6_48
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
	b	LBB6_48
LBB6_35:
	and	x8, x19, #0xfffffffffffffff8
	subs	x9, x19, x8
	b.ne	LBB6_42
; %bb.36:
	add	x10, x22, #32
	lsl	x11, x21, #3
Lloh0:
	adrp	x12, lCPI6_0@PAGE
Lloh1:
	ldr	q0, [x12, lCPI6_0@PAGEOFF]
	mov	w12, #2                         ; =0x2
	dup.2d	v1, x12
	mov	w12, #4                         ; =0x4
	dup.2d	v2, x12
	mov	w12, #6                         ; =0x6
	dup.2d	v3, x12
	mov	w12, #8                         ; =0x8
	dup.2d	v4, x12
LBB6_37:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_38 Depth 2
	mul	x12, x9, x19
	dup.2d	v5, x12
	mov	x12, x10
	mov	x13, x8
	mov.16b	v6, v0
LBB6_38:                                ;   Parent Loop BB6_37 Depth=1
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
	b.ne	LBB6_38
; %bb.39:                               ;   in Loop: Header=BB6_37 Depth=1
	add	x9, x9, #1
	add	x10, x10, x11
	cmp	x9, x19
	b.ne	LBB6_37
	b	LBB6_48
LBB6_40:
	ldr	x0, [x21, #16]
	bl	_atoi
	mov	x20, x0
	cmp	w22, #4
	b.lo	LBB6_52
; %bb.41:
	ldr	x0, [x21, #24]
	mov	x1, #0                          ; =0x0
	mov	w2, #10                         ; =0xa
	bl	_strtoull
	b	LBB6_4
LBB6_42:
	mov	x10, #0                         ; =0x0
	add	x11, x22, #32
	lsl	x12, x21, #3
	lsr	x13, x19, #3
	mov	w14, #2                         ; =0x2
	dup.2d	v0, x14
Lloh2:
	adrp	x14, lCPI6_0@PAGE
Lloh3:
	ldr	q1, [x14, lCPI6_0@PAGEOFF]
	mov	w14, #4                         ; =0x4
	dup.2d	v2, x14
	mov	w14, #6                         ; =0x6
	add	x13, x22, x13, lsl #6
	dup.2d	v3, x14
	mov	w14, #8                         ; =0x8
	dup.2d	v4, x14
	mov	x14, x8
LBB6_43:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_44 Depth 2
                                        ;     Child Loop BB6_46 Depth 2
	mul	x15, x10, x19
	dup.2d	v5, x15
	mov	x15, x8
	mov	x16, x11
	mov.16b	v6, v1
LBB6_44:                                ;   Parent Loop BB6_43 Depth=1
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
	b.ne	LBB6_44
; %bb.45:                               ;   in Loop: Header=BB6_43 Depth=1
	mov	x15, x14
	mov	x16, x13
	mov	x17, x9
LBB6_46:                                ;   Parent Loop BB6_43 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ucvtf	d5, x15
	str	d5, [x16], #8
	add	x15, x15, #1
	subs	x17, x17, #1
	b.ne	LBB6_46
; %bb.47:                               ;   in Loop: Header=BB6_43 Depth=1
	add	x10, x10, #1
	add	x11, x11, x12
	add	x13, x13, x12
	add	x14, x14, x19
	cmp	x10, x19
	b.ne	LBB6_43
LBB6_48:
	mov	w8, #256                        ; =0x100
	stp	x19, x8, [sp]
Lloh4:
	adrp	x0, l_.str@PAGE
Lloh5:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	x0, x23
	mov	x1, x24
	bl	_bzero
	mov	x8, #36074                      ; =0x8cea
	movk	x8, #14752, lsl #16
	movk	x8, #15961, lsl #32
	movk	x8, #17961, lsl #48
	fmov	d8, x8
	cmp	w20, #1
	b.lt	LBB6_51
; %bb.49:
	mov	x8, #54933                      ; =0xd695
	movk	x8, #59430, lsl #16
	movk	x8, #11787, lsl #32
	movk	x8, #15889, lsl #48
	fmov	d9, x8
	mov	x25, x20
LBB6_50:                                ; =>This Inner Loop Header: Depth=1
	add	x1, sp, #32
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	d0, d1, [sp, #32]
	scvtf	d0, d0
	scvtf	d1, d1
	fmadd	d10, d1, d9, d0
	mov	x0, x23
	mov	x1, x22
	mov	x2, x24
	bl	_memcpy
	add	x1, sp, #32
	mov	w0, #6                          ; =0x6
	bl	_clock_gettime
	ldp	d0, d1, [sp, #32]
	scvtf	d0, d0
	scvtf	d1, d1
	fmadd	d0, d1, d9, d0
	fsub	d0, d0, d10
	fcmp	d0, d8
	fcsel	d8, d0, d8, mi
	subs	w25, w25, #1
	b.ne	LBB6_50
LBB6_51:
	ucvtf	d0, x19
	fadd	d1, d0, d0
	fmul	d0, d1, d0
	fmov	d1, #8.00000000
	fmul	d0, d0, d1
	fdiv	d0, d0, d8
	mov	x8, #225833675390976            ; =0xcd6500000000
	movk	x8, #16845, lsl #48
	fmov	d1, x8
	fdiv	d9, d0, d1
	mov	x0, x22
	mov	x1, x23
	mov	x2, x24
	bl	_memcmp
Lloh6:
	adrp	x8, l_.str.3@PAGE
Lloh7:
	add	x8, x8, l_.str.3@PAGEOFF
Lloh8:
	adrp	x9, l_.str.4@PAGE
Lloh9:
	add	x9, x9, l_.str.4@PAGEOFF
	cmp	w0, #0
	csel	x8, x9, x8, eq
	str	x8, [sp, #24]
Lloh10:
	adrp	x8, l_.str.2@PAGE
Lloh11:
	add	x8, x8, l_.str.2@PAGEOFF
	str	x8, [sp]
	stp	d8, d9, [sp, #8]
Lloh12:
	adrp	x0, l_.str.1@PAGE
Lloh13:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
Lloh14:
	adrp	x0, l_.str.5@PAGE
Lloh15:
	add	x0, x0, l_.str.5@PAGEOFF
Lloh16:
	adrp	x1, _transpose_neon2@PAGE
Lloh17:
	add	x1, x1, _transpose_neon2@PAGEOFF
	mov	x2, x22
	mov	x3, x23
	mov	x4, x19
	mov	x5, x21
	mov	x6, x20
	bl	_bench
Lloh18:
	adrp	x0, l_.str.6@PAGE
Lloh19:
	add	x0, x0, l_.str.6@PAGEOFF
Lloh20:
	adrp	x1, _transpose_neon2_blocked@PAGE
Lloh21:
	add	x1, x1, _transpose_neon2_blocked@PAGEOFF
	mov	x2, x22
	mov	x3, x23
	mov	x4, x19
	mov	x5, x21
	mov	x6, x20
	bl	_bench
Lloh22:
	adrp	x0, l_.str.7@PAGE
Lloh23:
	add	x0, x0, l_.str.7@PAGEOFF
Lloh24:
	adrp	x1, _transpose_neon4_blocked@PAGE
Lloh25:
	add	x1, x1, _transpose_neon4_blocked@PAGEOFF
	mov	x2, x22
	mov	x3, x23
	mov	x4, x19
	mov	x5, x21
	mov	x6, x20
	bl	_bench
Lloh26:
	adrp	x0, l_.str.8@PAGE
Lloh27:
	add	x0, x0, l_.str.8@PAGEOFF
Lloh28:
	adrp	x1, _transpose_neon4_pf@PAGE
Lloh29:
	add	x1, x1, _transpose_neon4_pf@PAGEOFF
	mov	x2, x22
	mov	x3, x23
	mov	x4, x19
	mov	x5, x21
	mov	x6, x20
	bl	_bench
Lloh30:
	adrp	x0, l_.str.9@PAGE
Lloh31:
	add	x0, x0, l_.str.9@PAGEOFF
Lloh32:
	adrp	x1, _transpose_neon8_blocked@PAGE
Lloh33:
	add	x1, x1, _transpose_neon8_blocked@PAGEOFF
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
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #64]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
LBB6_52:
	mov	x0, #0                          ; =0x0
	b	LBB6_4
LBB6_53:
Lloh34:
	adrp	x8, ___stderrp@GOTPAGE
Lloh35:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh36:
	ldr	x0, [x8]
	str	x25, [sp]
Lloh37:
	adrp	x1, l_.str.10@PAGE
Lloh38:
	add	x1, x1, l_.str.10@PAGEOFF
	bl	_fprintf
	mov	w0, #1                          ; =0x1
	bl	_exit
	.loh AdrpLdr	Lloh0, Lloh1
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpAdd	Lloh30, Lloh31
	.loh AdrpAdd	Lloh28, Lloh29
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh37, Lloh38
	.loh AdrpLdrGotLdr	Lloh34, Lloh35, Lloh36
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
	b.lt	LBB7_3
; %bb.1:
	mov	x8, #54933                      ; =0xd695
	movk	x8, #59430, lsl #16
	movk	x8, #11787, lsl #32
	movk	x8, #15889, lsl #48
	fmov	d10, x8
	mov	x26, x20
LBB7_2:                                 ; =>This Inner Loop Header: Depth=1
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
	b.ne	LBB7_2
LBB7_3:
Lloh39:
	adrp	x8, l_.str.4@PAGE
Lloh40:
	add	x8, x8, l_.str.4@PAGEOFF
	cbz	x21, LBB7_51
; %bb.4:
	cmp	x21, #7
	b.hi	LBB7_39
; %bb.5:
	ldr	d0, [x22]
	ldr	d1, [x23]
	fcmp	d0, d1
	cset	w9, ne
	cmp	x21, #1
	b.eq	LBB7_12
; %bb.6:
	ldr	d0, [x22, x24, lsl #3]
	ldr	d1, [x23, #8]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #2
	b.eq	LBB7_12
; %bb.7:
	lsl	x10, x24, #4
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #16]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #3
	b.eq	LBB7_12
; %bb.8:
	mov	w10, #24                        ; =0x18
	mul	x10, x24, x10
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #24]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #4
	b.eq	LBB7_12
; %bb.9:
	lsl	x10, x24, #5
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB7_12
; %bb.10:
	mov	w10, #40                        ; =0x28
	mul	x10, x24, x10
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB7_12
; %bb.11:
	mov	w10, #48                        ; =0x30
	mul	x10, x24, x10
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB7_12:
	cmp	x21, #1
	b.eq	LBB7_50
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
	b.eq	LBB7_19
; %bb.14:
	lsl	x12, x24, #4
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #16]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #3
	b.eq	LBB7_19
; %bb.15:
	mov	w12, #24                        ; =0x18
	mul	x12, x24, x12
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #24]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #4
	b.eq	LBB7_19
; %bb.16:
	lsl	x12, x24, #5
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB7_19
; %bb.17:
	mov	w12, #40                        ; =0x28
	mul	x12, x24, x12
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB7_19
; %bb.18:
	mov	w12, #48                        ; =0x30
	mul	x12, x24, x12
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB7_19:
	cmp	x21, #2
	b.eq	LBB7_50
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
	b.eq	LBB7_25
; %bb.21:
	mov	w13, #24                        ; =0x18
	mul	x13, x24, x13
	ldr	d0, [x11, x13]
	ldr	d1, [x12, #24]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #4
	b.eq	LBB7_25
; %bb.22:
	lsl	x13, x24, #5
	ldr	d0, [x11, x13]
	ldr	d1, [x12, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB7_25
; %bb.23:
	mov	w13, #40                        ; =0x28
	mul	x13, x24, x13
	ldr	d0, [x11, x13]
	ldr	d1, [x12, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB7_25
; %bb.24:
	mov	w13, #48                        ; =0x30
	mul	x13, x24, x13
	ldr	d0, [x11, x13]
	ldr	d1, [x12, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB7_25:
	cmp	x21, #3
	b.eq	LBB7_50
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
	b.eq	LBB7_30
; %bb.27:
	lsl	x14, x24, #5
	ldr	d0, [x12, x14]
	ldr	d1, [x13, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB7_30
; %bb.28:
	mov	w14, #40                        ; =0x28
	mul	x14, x24, x14
	ldr	d0, [x12, x14]
	ldr	d1, [x13, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB7_30
; %bb.29:
	mov	w14, #48                        ; =0x30
	mul	x14, x24, x14
	ldr	d0, [x12, x14]
	ldr	d1, [x13, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB7_30:
	cmp	x21, #4
	b.eq	LBB7_50
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
	b.eq	LBB7_34
; %bb.32:
	mov	w15, #40                        ; =0x28
	mul	x15, x24, x15
	ldr	d0, [x13, x15]
	ldr	d1, [x14, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB7_34
; %bb.33:
	mov	w15, #48                        ; =0x30
	mul	x15, x24, x15
	ldr	d0, [x13, x15]
	ldr	d1, [x14, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB7_34:
	cmp	x21, #5
	b.eq	LBB7_50
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
	b.eq	LBB7_37
; %bb.36:
	mov	w15, #48                        ; =0x30
	mul	x15, x24, x15
	ldr	d0, [x13, x15]
	ldr	d1, [x14, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB7_37:
	cmp	x21, #6
	b.eq	LBB7_50
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
	b	LBB7_50
LBB7_39:
	cmp	x24, #1
	b.ne	LBB7_46
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
	b	LBB7_42
LBB7_41:                                ;   in Loop: Header=BB7_42 Depth=1
	add	x10, x10, #1
	add	x12, x12, #8
	add	x13, x13, x14
	add	x16, x16, x14
	add	x17, x17, #8
	cmp	x10, x21
	b.eq	LBB7_50
LBB7_42:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_43 Depth 2
                                        ;     Child Loop BB7_45 Depth 2
	movi.2d	v0, #0000000000000000
	mov.d	v0[0], x9
	movi.2d	v1, #0000000000000000
	mov	x9, x13
	mov	x0, x12
	mov	x1, x11
	movi.2d	v2, #0000000000000000
	movi.2d	v3, #0000000000000000
LBB7_43:                                ;   Parent Loop BB7_42 Depth=1
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
	b.ne	LBB7_43
; %bb.44:                               ;   in Loop: Header=BB7_42 Depth=1
	add.2d	v0, v1, v0
	add.2d	v1, v3, v2
	add.2d	v0, v1, v0
	addp.2d	d0, v0
	fmov	x9, d0
	mov	x0, x17
	mov	x1, x16
	mov	x2, x15
	cmp	x21, x11
	b.eq	LBB7_41
LBB7_45:                                ;   Parent Loop BB7_42 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x0]
	ldr	d1, [x1], #8
	fcmp	d0, d1
	cinc	x9, x9, ne
	add	x0, x0, x14
	subs	x2, x2, #1
	b.ne	LBB7_45
	b	LBB7_41
LBB7_46:
	mov	x10, #0                         ; =0x0
	mov	x9, #0                          ; =0x0
	lsl	x11, x24, #3
LBB7_47:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_48 Depth 2
	mov	x12, #0                         ; =0x0
	mov	x13, x22
LBB7_48:                                ;   Parent Loop BB7_47 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x23, x12, lsl #3]
	ldr	d1, [x13]
	fcmp	d1, d0
	cinc	x9, x9, ne
	add	x12, x12, #1
	add	x13, x13, x11
	cmp	x21, x12
	b.ne	LBB7_48
; %bb.49:                               ;   in Loop: Header=BB7_47 Depth=1
	add	x10, x10, #1
	add	x23, x23, x11
	add	x22, x22, #8
	cmp	x10, x21
	b.ne	LBB7_47
LBB7_50:
Lloh41:
	adrp	x10, l_.str.3@PAGE
Lloh42:
	add	x10, x10, l_.str.3@PAGEOFF
	cmp	x9, #0
	csel	x8, x8, x10, eq
LBB7_51:
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
Lloh43:
	adrp	x0, l_.str.11@PAGE
Lloh44:
	add	x0, x0, l_.str.11@PAGEOFF
	bl	_printf
Lloh45:
	adrp	x8, ___stdoutp@GOTPAGE
Lloh46:
	ldr	x8, [x8, ___stdoutp@GOTPAGEOFF]
Lloh47:
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
	.loh AdrpAdd	Lloh39, Lloh40
	.loh AdrpAdd	Lloh41, Lloh42
	.loh AdrpLdrGotLdr	Lloh45, Lloh46, Lloh47
	.loh AdrpAdd	Lloh43, Lloh44
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"N = %zu, BS = %d\n"

l_.str.1:                               ; @.str.1
	.asciz	"%-28s  min %8.4f s  %24.2f GB/s  %s\n"

l_.str.2:                               ; @.str.2
	.asciz	"memcpy (\321\215\321\202\320\260\320\273\320\276\320\275)"

l_.str.3:                               ; @.str.3
	.asciz	"\320\236\320\250\320\230\320\221\320\232\320\220"

l_.str.4:                               ; @.str.4
	.asciz	"ok"

l_.str.5:                               ; @.str.5
	.asciz	"neon2 (2x2)"

l_.str.6:                               ; @.str.6
	.asciz	"neon2_blocked (2x2+BS)"

l_.str.7:                               ; @.str.7
	.asciz	"neon4_blocked (4x4+BS)"

l_.str.8:                               ; @.str.8
	.asciz	"neon4_pf (4x4 ldp/stp+pf)"

l_.str.9:                               ; @.str.9
	.asciz	"neon8_blocked (8x8+BS)"

l_.str.10:                              ; @.str.10
	.asciz	"\320\275\320\265 \321\203\320\264\320\260\320\273\320\276\321\201\321\214 \320\262\321\213\320\264\320\265\320\273\320\270\321\202\321\214 %zu \320\261\320\260\320\271\321\202\n"

l_.str.11:                              ; @.str.11
	.asciz	"%-28s  min %8.4f s  avg %8.4f s  %6.2f GB/s  %s\n"

.subsections_via_symbols

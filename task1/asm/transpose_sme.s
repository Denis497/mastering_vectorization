	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 26, 0	sdk_version 26, 0
	.globl	_transpose_sme8                 ; -- Begin function transpose_sme8
	.p2align	2
_transpose_sme8:                        ; @transpose_sme8
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x23, x3
	mov	x19, x2
	mov	x20, x1
	mov	x21, x0
	and	x22, x2, #0xfffffffffffffff8
	mov	x2, x22
	bl	_sme8_core
	cbz	x19, LBB0_24
; %bb.1:
	cmp	x23, #1
	b.ne	LBB0_11
; %bb.2:
	mov	x9, #0                          ; =0x0
	and	x8, x19, #0x7
	cbz	x8, LBB0_16
; %bb.3:
	sub	x10, x8, x19
	lsl	x11, x23, #3
	b	LBB0_5
LBB0_4:                                 ;   in Loop: Header=BB0_5 Depth=1
	add	x9, x9, #1
	add	x21, x21, x11
	add	x20, x20, #8
	cmp	x9, x19
	b.eq	LBB0_24
LBB0_5:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_8 Depth 2
                                        ;     Child Loop BB0_10 Depth 2
	cmp	x9, x22
	csel	x14, x22, xzr, lo
	subs	x13, x19, x14
	b.ls	LBB0_4
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=1
	mov	x12, x14
	cmp	x13, #8
	b.lo	LBB0_9
; %bb.7:                                ;   in Loop: Header=BB0_5 Depth=1
	sub	x12, x13, x8
	add	x12, x14, x12
	add	x13, x10, x14
	lsl	x14, x14, #3
	add	x15, x21, x14
LBB0_8:                                 ;   Parent Loop BB0_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x15]
	ldp	q2, q3, [x15, #32]
	add	x16, x20, x14
	stp	q0, q1, [x16]
	stp	q2, q3, [x16, #32]
	add	x15, x15, #64
	add	x14, x14, #64
	adds	x13, x13, #8
	b.ne	LBB0_8
LBB0_9:                                 ;   in Loop: Header=BB0_5 Depth=1
	mul	x13, x11, x12
LBB0_10:                                ;   Parent Loop BB0_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x21, x12, lsl #3]
	str	d0, [x20, x13]
	add	x12, x12, #1
	add	x13, x13, x11
	cmp	x19, x12
	b.ne	LBB0_10
	b	LBB0_4
LBB0_11:
	mov	x8, #0                          ; =0x0
	lsl	x9, x23, #3
	b	LBB0_13
LBB0_12:                                ;   in Loop: Header=BB0_13 Depth=1
	add	x8, x8, #1
	add	x20, x20, #8
	add	x21, x21, x9
	cmp	x8, x19
	b.eq	LBB0_24
LBB0_13:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_15 Depth 2
	cmp	x8, x22
	csel	x12, x22, xzr, lo
	subs	x10, x19, x12
	b.ls	LBB0_12
; %bb.14:                               ;   in Loop: Header=BB0_13 Depth=1
	madd	x11, x9, x12, x20
	add	x12, x21, x12, lsl #3
LBB0_15:                                ;   Parent Loop BB0_13 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x12], #8
	str	d0, [x11]
	add	x11, x11, x9
	subs	x10, x10, #1
	b.ne	LBB0_15
	b	LBB0_12
LBB0_16:
	sub	x8, x8, x19
	lsl	x10, x23, #3
	b	LBB0_18
LBB0_17:                                ;   in Loop: Header=BB0_18 Depth=1
	add	x9, x9, #1
	add	x21, x21, x10
	add	x20, x20, #8
	cmp	x9, x19
	b.eq	LBB0_24
LBB0_18:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_23 Depth 2
                                        ;     Child Loop BB0_21 Depth 2
	cmp	x9, x22
	csel	x12, x22, xzr, lo
	subs	x11, x19, x12
	b.ls	LBB0_17
; %bb.19:                               ;   in Loop: Header=BB0_18 Depth=1
	cmp	x11, #7
	b.hi	LBB0_22
; %bb.20:                               ;   in Loop: Header=BB0_18 Depth=1
	mul	x11, x10, x12
LBB0_21:                                ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x21, x12, lsl #3]
	str	d0, [x20, x11]
	add	x12, x12, #1
	add	x11, x11, x10
	cmp	x19, x12
	b.ne	LBB0_21
	b	LBB0_17
LBB0_22:                                ;   in Loop: Header=BB0_18 Depth=1
	add	x11, x8, x12
	lsl	x12, x12, #3
	add	x13, x21, x12
LBB0_23:                                ;   Parent Loop BB0_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x13]
	ldp	q2, q3, [x13, #32]
	add	x14, x20, x12
	stp	q0, q1, [x14]
	stp	q2, q3, [x14, #32]
	add	x13, x13, #64
	add	x12, x12, #64
	adds	x11, x11, #8
	b.ne	LBB0_23
	b	LBB0_17
LBB0_24:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function sme8_core
_sme8_core:                             ; @sme8_core
	.cfi_startproc
; %bb.0:
	stp	d15, d14, [sp, #-144]!          ; 16-byte Folded Spill
	.cfi_def_cfa_offset 144
	stp	d13, d12, [sp, #16]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
	stp	x26, x25, [sp, #64]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #80]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #96]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128
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
	.cfi_offset b12, -120
	.cfi_offset b13, -128
	.cfi_offset b14, -136
	.cfi_offset b15, -144
	smstart	sm
	mrs	x8, TPIDR2_EL0
	cbz	x8, LBB1_2
; %bb.1:
	bl	___arm_tpidr2_save
	msr	TPIDR2_EL0, xzr
LBB1_2:
	smstart	za
	zero	{za}
	ptrue	p0.d
	cbz	x2, LBB1_12
; %bb.3:
	mov	x11, #0                         ; =0x0
	lsl	x8, x3, #11
	lsl	x9, x3, #6
	lsl	x10, x3, #3
	mov	w13, #1                         ; =0x1
	mov	w14, #2                         ; =0x2
	b	LBB1_5
LBB1_4:                                 ;   in Loop: Header=BB1_5 Depth=1
	add	x1, x1, #2048
	add	x0, x0, x8
	mov	x11, x16
	cmp	x16, x2
	b.hs	LBB1_12
LBB1_5:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_8 Depth 2
                                        ;       Child Loop BB1_9 Depth 3
                                        ;         Child Loop BB1_10 Depth 4
	add	x16, x11, #256
	cmp	x16, x2
	csel	x17, x16, x2, lo
	cmp	x11, x17
	b.hs	LBB1_4
; %bb.6:                                ;   in Loop: Header=BB1_5 Depth=1
	mov	x5, #0                          ; =0x0
	mov	x3, x0
	mov	x4, x1
	b	LBB1_8
LBB1_7:                                 ;   in Loop: Header=BB1_8 Depth=2
	add	x4, x4, x8
	add	x3, x3, #2048
	mov	x5, x6
	cmp	x6, x2
	b.hs	LBB1_4
LBB1_8:                                 ;   Parent Loop BB1_5 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_9 Depth 3
                                        ;         Child Loop BB1_10 Depth 4
	add	x6, x5, #256
	cmp	x6, x2
	csel	x7, x6, x2, lo
	mov	x19, x3
	mov	x20, x4
	mov	x21, x11
	cmp	x5, x7
	b.hs	LBB1_7
LBB1_9:                                 ;   Parent Loop BB1_5 Depth=1
                                        ;     Parent Loop BB1_8 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB1_10 Depth 4
	mov	x22, x19
	mov	x23, x20
	mov	x24, x5
LBB1_10:                                ;   Parent Loop BB1_5 Depth=1
                                        ;     Parent Loop BB1_8 Depth=2
                                        ;       Parent Loop BB1_9 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	mov	w15, #0                         ; =0x0
	ld1d	{za0h.d[w15, 0]}, p0/z, [x22]
	add	x25, x22, x10
	add	x26, x25, x10
	ld1d	{za0h.d[w13, 0]}, p0/z, [x25]
	ld1d	{za0h.d[w14, 0]}, p0/z, [x26]
	add	x25, x26, x10
	add	x26, x25, x10
	mov	w12, #3                         ; =0x3
	ld1d	{za0h.d[w12, 0]}, p0/z, [x25]
	mov	w12, #4                         ; =0x4
	ld1d	{za0h.d[w12, 0]}, p0/z, [x26]
	add	x25, x26, x10
	add	x26, x25, x10
	mov	w12, #5                         ; =0x5
	ld1d	{za0h.d[w12, 0]}, p0/z, [x25]
	mov	w12, #6                         ; =0x6
	ld1d	{za0h.d[w12, 0]}, p0/z, [x26]
	add	x25, x26, x10
	mov	w12, #7                         ; =0x7
	ld1d	{za0h.d[w12, 0]}, p0/z, [x25]
	st1d	{za0v.d[w15, 0]}, p0, [x23]
	add	x15, x23, x10
	add	x25, x15, x10
	st1d	{za0v.d[w13, 0]}, p0, [x15]
	st1d	{za0v.d[w14, 0]}, p0, [x25]
	add	x15, x25, x10
	add	x25, x15, x10
	mov	w12, #3                         ; =0x3
	st1d	{za0v.d[w12, 0]}, p0, [x15]
	mov	w12, #4                         ; =0x4
	st1d	{za0v.d[w12, 0]}, p0, [x25]
	add	x15, x25, x10
	add	x25, x15, x10
	mov	w12, #5                         ; =0x5
	st1d	{za0v.d[w12, 0]}, p0, [x15]
	mov	w12, #6                         ; =0x6
	st1d	{za0v.d[w12, 0]}, p0, [x25]
	add	x15, x25, x10
	mov	w12, #7                         ; =0x7
	st1d	{za0v.d[w12, 0]}, p0, [x15]
	add	x24, x24, #8
	add	x23, x23, x9
	add	x22, x22, #64
	cmp	x24, x7
	b.lo	LBB1_10
; %bb.11:                               ;   in Loop: Header=BB1_9 Depth=3
	add	x21, x21, #8
	add	x20, x20, #64
	add	x19, x19, x9
	cmp	x21, x17
	b.lo	LBB1_9
	b	LBB1_7
LBB1_12:
	smstop	za
	smstop	sm
	.cfi_def_cfa wsp, 144
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp], #144            ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w23
	.cfi_restore w24
	.cfi_restore w25
	.cfi_restore w26
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_transpose_sme16                ; -- Begin function transpose_sme16
	.p2align	2
_transpose_sme16:                       ; @transpose_sme16
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x23, x3
	mov	x19, x2
	mov	x20, x1
	mov	x21, x0
	and	x22, x2, #0xfffffffffffffff0
	mov	x2, x22
	bl	_sme16_core
	cbz	x19, LBB2_24
; %bb.1:
	cmp	x23, #1
	b.ne	LBB2_11
; %bb.2:
	mov	x9, #0                          ; =0x0
	and	x8, x19, #0x7
	cbz	x8, LBB2_16
; %bb.3:
	sub	x10, x8, x19
	lsl	x11, x23, #3
	b	LBB2_5
LBB2_4:                                 ;   in Loop: Header=BB2_5 Depth=1
	add	x9, x9, #1
	add	x21, x21, x11
	add	x20, x20, #8
	cmp	x9, x19
	b.eq	LBB2_24
LBB2_5:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_8 Depth 2
                                        ;     Child Loop BB2_10 Depth 2
	cmp	x9, x22
	csel	x14, x22, xzr, lo
	subs	x13, x19, x14
	b.ls	LBB2_4
; %bb.6:                                ;   in Loop: Header=BB2_5 Depth=1
	mov	x12, x14
	cmp	x13, #8
	b.lo	LBB2_9
; %bb.7:                                ;   in Loop: Header=BB2_5 Depth=1
	sub	x12, x13, x8
	add	x12, x14, x12
	add	x13, x10, x14
	lsl	x14, x14, #3
	add	x15, x21, x14
LBB2_8:                                 ;   Parent Loop BB2_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x15]
	ldp	q2, q3, [x15, #32]
	add	x16, x20, x14
	stp	q0, q1, [x16]
	stp	q2, q3, [x16, #32]
	add	x15, x15, #64
	add	x14, x14, #64
	adds	x13, x13, #8
	b.ne	LBB2_8
LBB2_9:                                 ;   in Loop: Header=BB2_5 Depth=1
	mul	x13, x11, x12
LBB2_10:                                ;   Parent Loop BB2_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x21, x12, lsl #3]
	str	d0, [x20, x13]
	add	x12, x12, #1
	add	x13, x13, x11
	cmp	x19, x12
	b.ne	LBB2_10
	b	LBB2_4
LBB2_11:
	mov	x8, #0                          ; =0x0
	lsl	x9, x23, #3
	b	LBB2_13
LBB2_12:                                ;   in Loop: Header=BB2_13 Depth=1
	add	x8, x8, #1
	add	x20, x20, #8
	add	x21, x21, x9
	cmp	x8, x19
	b.eq	LBB2_24
LBB2_13:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_15 Depth 2
	cmp	x8, x22
	csel	x12, x22, xzr, lo
	subs	x10, x19, x12
	b.ls	LBB2_12
; %bb.14:                               ;   in Loop: Header=BB2_13 Depth=1
	madd	x11, x9, x12, x20
	add	x12, x21, x12, lsl #3
LBB2_15:                                ;   Parent Loop BB2_13 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x12], #8
	str	d0, [x11]
	add	x11, x11, x9
	subs	x10, x10, #1
	b.ne	LBB2_15
	b	LBB2_12
LBB2_16:
	sub	x8, x8, x19
	lsl	x10, x23, #3
	b	LBB2_18
LBB2_17:                                ;   in Loop: Header=BB2_18 Depth=1
	add	x9, x9, #1
	add	x21, x21, x10
	add	x20, x20, #8
	cmp	x9, x19
	b.eq	LBB2_24
LBB2_18:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_23 Depth 2
                                        ;     Child Loop BB2_21 Depth 2
	cmp	x9, x22
	csel	x12, x22, xzr, lo
	subs	x11, x19, x12
	b.ls	LBB2_17
; %bb.19:                               ;   in Loop: Header=BB2_18 Depth=1
	cmp	x11, #7
	b.hi	LBB2_22
; %bb.20:                               ;   in Loop: Header=BB2_18 Depth=1
	mul	x11, x10, x12
LBB2_21:                                ;   Parent Loop BB2_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x21, x12, lsl #3]
	str	d0, [x20, x11]
	add	x12, x12, #1
	add	x11, x11, x10
	cmp	x19, x12
	b.ne	LBB2_21
	b	LBB2_17
LBB2_22:                                ;   in Loop: Header=BB2_18 Depth=1
	add	x11, x8, x12
	lsl	x12, x12, #3
	add	x13, x21, x12
LBB2_23:                                ;   Parent Loop BB2_18 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q0, q1, [x13]
	ldp	q2, q3, [x13, #32]
	add	x14, x20, x12
	stp	q0, q1, [x14]
	stp	q2, q3, [x14, #32]
	add	x13, x13, #64
	add	x12, x12, #64
	adds	x11, x11, #8
	b.ne	LBB2_23
	b	LBB2_17
LBB2_24:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function sme16_core
_sme16_core:                            ; @sme16_core
	.cfi_startproc
; %bb.0:
	stp	d15, d14, [sp, #-160]!          ; 16-byte Folded Spill
	.cfi_def_cfa_offset 160
	stp	d13, d12, [sp, #16]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
	stp	x28, x27, [sp, #64]             ; 16-byte Folded Spill
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
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_offset b14, -152
	.cfi_offset b15, -160
	sub	sp, sp, #784
	stp	x0, x1, [sp, #256]              ; 16-byte Folded Spill
	smstart	sm
	mrs	x8, TPIDR2_EL0
	cbz	x8, LBB3_2
; %bb.1:
	bl	___arm_tpidr2_save
	msr	TPIDR2_EL0, xzr
LBB3_2:
	smstart	za
	zero	{za}
	ptrue	p0.d
	cbz	x2, LBB3_12
; %bb.3:
	lsl	x8, x3, #3
	lsl	x9, x3, #11
	stp	x9, xzr, [sp, #280]             ; 16-byte Folded Spill
	lsl	x19, x3, #7
	sub	x11, x19, x8
	ldr	x6, [sp, #264]                  ; 8-byte Folded Reload
	add	x9, x6, x11
	str	x9, [sp, #248]                  ; 8-byte Folded Spill
	lsl	x9, x3, #6
	sub	x12, x9, x8
	add	x10, x6, x12
	str	x10, [sp, #240]                 ; 8-byte Folded Spill
	lsl	x10, x3, #4
	sub	x13, x19, x10
	add	x14, x6, x13
	str	x14, [sp, #232]                 ; 8-byte Folded Spill
	add	x14, x3, x3, lsl #1
	lsl	x15, x14, #4
	add	x16, x6, x15
	str	x16, [sp, #224]                 ; 8-byte Folded Spill
	mov	w16, #104                       ; =0x68
	mul	x16, x3, x16
	add	x17, x6, x16
	str	x17, [sp, #216]                 ; 8-byte Folded Spill
	add	x17, x3, x3, lsl #2
	lsl	x0, x17, #3
	add	x1, x6, x0
	str	x1, [sp, #208]                  ; 8-byte Folded Spill
	lsl	x1, x14, #5
	add	x4, x6, x1
	str	x4, [sp, #200]                  ; 8-byte Folded Spill
	lsl	x5, x3, #5
	add	x4, x6, x5
	str	x4, [sp, #192]                  ; 8-byte Folded Spill
	mov	w4, #88                         ; =0x58
	mul	x4, x3, x4
	add	x7, x6, x4
	str	x7, [sp, #184]                  ; 8-byte Folded Spill
	lsl	x14, x14, #3
	add	x7, x6, x14
	str	x7, [sp, #176]                  ; 8-byte Folded Spill
	lsl	x17, x17, #4
	add	x7, x6, x17
	str	x7, [sp, #168]                  ; 8-byte Folded Spill
	add	x7, x6, x10
	str	x7, [sp, #160]                  ; 8-byte Folded Spill
	add	x3, x8, x3
	lsl	x3, x3, #3
	add	x7, x6, x3
	str	x7, [sp, #152]                  ; 8-byte Folded Spill
	ldr	x7, [sp, #256]                  ; 8-byte Folded Reload
	add	x11, x7, x11
	str	x11, [sp, #144]                 ; 8-byte Folded Spill
	add	x11, x7, x12
	str	x11, [sp, #136]                 ; 8-byte Folded Spill
	add	x11, x7, x13
	str	x11, [sp, #128]                 ; 8-byte Folded Spill
	add	x11, x7, x15
	str	x11, [sp, #120]                 ; 8-byte Folded Spill
	add	x11, x7, x16
	str	x11, [sp, #112]                 ; 8-byte Folded Spill
	add	x11, x7, x0
	str	x11, [sp, #104]                 ; 8-byte Folded Spill
	add	x11, x7, x1
	str	x11, [sp, #96]                  ; 8-byte Folded Spill
	add	x11, x7, x5
	str	x11, [sp, #88]                  ; 8-byte Folded Spill
	add	x11, x7, x4
	str	x11, [sp, #80]                  ; 8-byte Folded Spill
	add	x11, x7, x14
	str	x11, [sp, #72]                  ; 8-byte Folded Spill
	add	x11, x7, x17
	add	x10, x7, x10
	stp	x10, x11, [sp, #56]             ; 16-byte Folded Spill
	mov	x10, x19
	add	x11, x7, x3
	str	x11, [sp, #48]                  ; 8-byte Folded Spill
	add	x11, x6, x8
	add	x8, x7, x8
	stp	x8, x11, [sp, #32]              ; 16-byte Folded Spill
	add	x8, x6, x9
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	add	x8, x7, x9
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	mov	x16, #8                         ; =0x8
	str	x2, [sp, #272]                  ; 8-byte Folded Spill
	b	LBB3_5
LBB3_4:                                 ;   in Loop: Header=BB3_5 Depth=1
	ldr	x8, [sp, #264]                  ; 8-byte Folded Reload
	add	x8, x8, #2048
	str	x8, [sp, #264]                  ; 8-byte Folded Spill
	ldp	x8, x11, [sp, #240]             ; 16-byte Folded Reload
	add	x9, x11, #2048
	add	x8, x8, #2048
	stp	x8, x9, [sp, #240]              ; 16-byte Folded Spill
	ldp	x8, x11, [sp, #224]             ; 16-byte Folded Reload
	add	x9, x11, #2048
	add	x8, x8, #2048
	stp	x8, x9, [sp, #224]              ; 16-byte Folded Spill
	ldp	x8, x11, [sp, #208]             ; 16-byte Folded Reload
	add	x9, x11, #2048
	add	x8, x8, #2048
	stp	x8, x9, [sp, #208]              ; 16-byte Folded Spill
	ldp	x8, x11, [sp, #192]             ; 16-byte Folded Reload
	add	x9, x11, #2048
	add	x8, x8, #2048
	stp	x8, x9, [sp, #192]              ; 16-byte Folded Spill
	ldp	x8, x11, [sp, #176]             ; 16-byte Folded Reload
	add	x9, x11, #2048
	add	x8, x8, #2048
	stp	x8, x9, [sp, #176]              ; 16-byte Folded Spill
	ldp	x8, x11, [sp, #160]             ; 16-byte Folded Reload
	add	x9, x11, #2048
	add	x8, x8, #2048
	stp	x8, x9, [sp, #160]              ; 16-byte Folded Spill
	ldr	x8, [sp, #152]                  ; 8-byte Folded Reload
	add	x11, x8, #2048
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	add	x8, x8, #2048
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	add	x8, x8, #2048
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #256]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #280]                  ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #256]                  ; 8-byte Folded Spill
	ldr	x8, [sp, #144]                  ; 8-byte Folded Reload
	add	x8, x8, x9
	stp	x8, x11, [sp, #144]             ; 16-byte Folded Spill
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #136]                  ; 8-byte Folded Spill
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #128]                  ; 8-byte Folded Spill
	ldr	x8, [sp, #120]                  ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #120]                  ; 8-byte Folded Spill
	ldr	x8, [sp, #112]                  ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #112]                  ; 8-byte Folded Spill
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #104]                  ; 8-byte Folded Spill
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #96]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #88]                   ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #88]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #80]                   ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #80]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #72]                   ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #72]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #64]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	str	x8, [sp, #288]                  ; 8-byte Folded Spill
	cmp	x8, x13
	mov	x2, x13
	b.hs	LBB3_12
LBB3_5:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_8 Depth 2
                                        ;       Child Loop BB3_9 Depth 3
                                        ;         Child Loop BB3_10 Depth 4
	ldr	x9, [sp, #288]                  ; 8-byte Folded Reload
	add	x8, x9, #256
	cmp	x8, x2
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	csel	x8, x8, x2, lo
	str	x8, [sp, #560]                  ; 8-byte Folded Spill
	cmp	x9, x8
	mov	x13, x2
	b.hs	LBB3_4
; %bb.6:                                ;   in Loop: Header=BB3_5 Depth=1
	mov	x30, #0                         ; =0x0
	ldp	x8, x25, [sp, #16]              ; 16-byte Folded Reload
	ldp	x9, x24, [sp, #32]              ; 16-byte Folded Reload
	ldp	x11, x12, [sp, #48]             ; 16-byte Folded Reload
	ldp	x19, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x17, [sp, #80]             ; 16-byte Folded Reload
	ldp	x0, x1, [sp, #96]               ; 16-byte Folded Reload
	ldp	x3, x4, [sp, #112]              ; 16-byte Folded Reload
	ldp	x5, x28, [sp, #128]             ; 16-byte Folded Reload
	ldp	x27, x23, [sp, #144]            ; 16-byte Folded Reload
	ldp	x15, x26, [sp, #248]            ; 16-byte Folded Reload
	ldp	x22, x14, [sp, #160]            ; 16-byte Folded Reload
	str	x14, [sp, #552]                 ; 8-byte Folded Spill
	ldr	x14, [sp, #176]                 ; 8-byte Folded Reload
	str	x14, [sp, #544]                 ; 8-byte Folded Spill
	ldr	x14, [sp, #184]                 ; 8-byte Folded Reload
	str	x14, [sp, #536]                 ; 8-byte Folded Spill
	ldr	x14, [sp, #192]                 ; 8-byte Folded Reload
	str	x14, [sp, #528]                 ; 8-byte Folded Spill
	ldr	x14, [sp, #200]                 ; 8-byte Folded Reload
	str	x14, [sp, #520]                 ; 8-byte Folded Spill
	ldr	x14, [sp, #208]                 ; 8-byte Folded Reload
	str	x14, [sp, #512]                 ; 8-byte Folded Spill
	ldr	x14, [sp, #216]                 ; 8-byte Folded Reload
	str	x14, [sp, #504]                 ; 8-byte Folded Spill
	ldp	x14, x7, [sp, #224]             ; 16-byte Folded Reload
	str	x14, [sp, #496]                 ; 8-byte Folded Spill
	ldr	x6, [sp, #240]                  ; 8-byte Folded Reload
	ldr	x14, [sp, #264]                 ; 8-byte Folded Reload
	b	LBB3_8
LBB3_7:                                 ;   in Loop: Header=BB3_8 Depth=2
	ldr	x8, [sp, #280]                  ; 8-byte Folded Reload
	ldp	x14, x15, [sp, #480]            ; 16-byte Folded Reload
	add	x14, x14, x8
	add	x15, x15, x8
	ldp	x6, x7, [sp, #304]              ; 16-byte Folded Reload
	add	x6, x6, x8
	add	x7, x7, x8
	ldr	x9, [sp, #496]                  ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #496]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #504]                  ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #504]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #512]                  ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #512]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #520]                  ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #520]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #528]                  ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #528]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #536]                  ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #536]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #544]                  ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #544]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #552]                  ; 8-byte Folded Reload
	add	x9, x9, x8
	str	x9, [sp, #552]                  ; 8-byte Folded Spill
	ldp	x22, x23, [sp, #320]            ; 16-byte Folded Reload
	add	x22, x22, x8
	add	x23, x23, x8
	ldp	x24, x25, [sp, #336]            ; 16-byte Folded Reload
	add	x24, x24, x8
	add	x25, x25, x8
	ldp	x26, x27, [sp, #352]            ; 16-byte Folded Reload
	add	x26, x26, #2048
	add	x27, x27, #2048
	ldp	x28, x5, [sp, #368]             ; 16-byte Folded Reload
	add	x28, x28, #2048
	add	x5, x5, #2048
	ldp	x4, x3, [sp, #384]              ; 16-byte Folded Reload
	add	x4, x4, #2048
	add	x3, x3, #2048
	ldp	x1, x0, [sp, #400]              ; 16-byte Folded Reload
	add	x1, x1, #2048
	add	x0, x0, #2048
	ldp	x17, x20, [sp, #416]            ; 16-byte Folded Reload
	add	x17, x17, #2048
	add	x20, x20, #2048
	ldp	x21, x19, [sp, #432]            ; 16-byte Folded Reload
	add	x21, x21, #2048
	add	x19, x19, #2048
	ldp	x12, x11, [sp, #448]            ; 16-byte Folded Reload
	add	x12, x12, #2048
	add	x11, x11, #2048
	ldp	x9, x8, [sp, #464]              ; 16-byte Folded Reload
	add	x9, x9, #2048
	add	x8, x8, #2048
	ldr	x2, [sp, #296]                  ; 8-byte Folded Reload
	mov	x30, x2
	ldr	x13, [sp, #272]                 ; 8-byte Folded Reload
	cmp	x2, x13
	b.hs	LBB3_4
LBB3_8:                                 ;   Parent Loop BB3_5 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_9 Depth 3
                                        ;         Child Loop BB3_10 Depth 4
	stp	x14, x15, [sp, #480]            ; 16-byte Folded Spill
	str	x30, [sp, #568]                 ; 8-byte Folded Spill
	add	x2, x30, #256
	cmp	x2, x13
	str	x2, [sp, #296]                  ; 8-byte Folded Spill
	csel	x2, x2, x13, lo
	stp	x9, x8, [sp, #464]              ; 16-byte Folded Spill
	mov	x30, x8
	mov	x15, x9
	stp	x12, x11, [sp, #448]            ; 16-byte Folded Spill
	mov	x14, x11
	mov	x9, x7
	mov	x7, x12
	mov	x12, x2
	stp	x21, x19, [sp, #432]            ; 16-byte Folded Spill
	mov	x2, x19
	stur	x21, [x29, #-184]               ; 8-byte Folded Spill
	str	x20, [sp, #424]                 ; 8-byte Folded Spill
	stur	x20, [x29, #-176]               ; 8-byte Folded Spill
	str	x17, [sp, #416]                 ; 8-byte Folded Spill
	stur	x17, [x29, #-160]               ; 8-byte Folded Spill
	str	x0, [sp, #408]                  ; 8-byte Folded Spill
	stur	x0, [x29, #-168]                ; 8-byte Folded Spill
	stp	x3, x1, [sp, #392]              ; 16-byte Folded Spill
	str	x1, [sp, #656]                  ; 8-byte Folded Spill
	str	x3, [sp, #648]                  ; 8-byte Folded Spill
	stp	x5, x4, [sp, #376]              ; 16-byte Folded Spill
	mov	x19, x4
	mov	x8, x5
	stp	x27, x28, [sp, #360]            ; 16-byte Folded Spill
	mov	x13, x27
	stp	x25, x26, [sp, #344]            ; 16-byte Folded Spill
	mov	x5, x25
	stp	x23, x24, [sp, #328]            ; 16-byte Folded Spill
	mov	x11, x6
	mov	x6, x24
	stp	x9, x22, [sp, #312]             ; 16-byte Folded Spill
	mov	x25, x22
	ldr	x1, [sp, #552]                  ; 8-byte Folded Reload
	ldr	x24, [sp, #544]                 ; 8-byte Folded Reload
	ldr	x17, [sp, #536]                 ; 8-byte Folded Reload
	ldr	x21, [sp, #528]                 ; 8-byte Folded Reload
	ldr	x20, [sp, #520]                 ; 8-byte Folded Reload
	str	x20, [sp, #640]                 ; 8-byte Folded Spill
	ldp	x3, x0, [sp, #504]              ; 16-byte Folded Reload
	str	x0, [sp, #632]                  ; 8-byte Folded Spill
	str	x3, [sp, #624]                  ; 8-byte Folded Spill
	ldr	x3, [sp, #496]                  ; 8-byte Folded Reload
	str	x3, [sp, #616]                  ; 8-byte Folded Spill
	str	x9, [sp, #608]                  ; 8-byte Folded Spill
	str	x11, [sp, #304]                 ; 8-byte Folded Spill
	str	x11, [sp, #600]                 ; 8-byte Folded Spill
	ldp	x9, x11, [sp, #480]             ; 16-byte Folded Reload
	str	x11, [sp, #592]                 ; 8-byte Folded Spill
	str	x9, [sp, #584]                  ; 8-byte Folded Spill
	ldr	x9, [sp, #288]                  ; 8-byte Folded Reload
	str	x9, [sp, #576]                  ; 8-byte Folded Spill
	ldr	x11, [sp, #568]                 ; 8-byte Folded Reload
	cmp	x11, x12
	b.hs	LBB3_7
LBB3_9:                                 ;   Parent Loop BB3_5 Depth=1
                                        ;     Parent Loop BB3_8 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB3_10 Depth 4
	str	x7, [sp, #664]                  ; 8-byte Folded Spill
	stp	x14, x15, [x29, #-256]          ; 16-byte Folded Spill
	stp	x30, x26, [x29, #-240]          ; 16-byte Folded Spill
	stp	x13, x28, [x29, #-224]          ; 16-byte Folded Spill
	stp	x8, x19, [x29, #-208]           ; 16-byte Folded Spill
	stur	x2, [x29, #-192]                ; 8-byte Folded Spill
	mov	x2, #0                          ; =0x0
	mov	x8, x5
	mov	x26, x23
	mov	x4, #0                          ; =0x0
	ldr	x9, [sp, #656]                  ; 8-byte Folded Reload
	ldr	x20, [sp, #648]                 ; 8-byte Folded Reload
	mov	x22, x1
	mov	x7, x17
	ldr	x27, [sp, #640]                 ; 8-byte Folded Reload
	ldr	x3, [sp, #632]                  ; 8-byte Folded Reload
	ldr	x5, [sp, #624]                  ; 8-byte Folded Reload
	ldr	x19, [sp, #616]                 ; 8-byte Folded Reload
	ldr	x23, [sp, #608]                 ; 8-byte Folded Reload
	ldr	x17, [sp, #600]                 ; 8-byte Folded Reload
	ldr	x0, [sp, #592]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #584]                  ; 8-byte Folded Reload
LBB3_10:                                ;   Parent Loop BB3_5 Depth=1
                                        ;     Parent Loop BB3_8 Depth=2
                                        ;       Parent Loop BB3_9 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	mov	w13, #2                         ; =0x2
	mov	w14, #4                         ; =0x4
	mov	x28, x12
	mov	w12, #1                         ; =0x1
	mov	w15, #0                         ; =0x0
	mov	x30, x10
	ldur	x10, [x29, #-232]               ; 8-byte Folded Reload
	add	x10, x10, x2
	ld1d	{za0h.d[w15, 0]}, p0/z, [x10]
	ld1d	{za1h.d[w15, 0]}, p0/z, [x10, x16, lsl #3]
	ldur	x10, [x29, #-240]               ; 8-byte Folded Reload
	add	x10, x10, x2
	ld1d	{za2h.d[w15, 0]}, p0/z, [x10]
	ld1d	{za3h.d[w15, 0]}, p0/z, [x10, x16, lsl #3]
	ldur	x10, [x29, #-248]               ; 8-byte Folded Reload
	add	x10, x10, x2
	ld1d	{za0h.d[w12, 0]}, p0/z, [x10]
	ld1d	{za1h.d[w12, 0]}, p0/z, [x10, x16, lsl #3]
	ldur	x10, [x29, #-256]               ; 8-byte Folded Reload
	add	x10, x10, x2
	ld1d	{za2h.d[w12, 0]}, p0/z, [x10]
	ld1d	{za3h.d[w12, 0]}, p0/z, [x10, x16, lsl #3]
	ldr	x10, [sp, #664]                 ; 8-byte Folded Reload
	add	x10, x10, x2
	ld1d	{za0h.d[w13, 0]}, p0/z, [x10]
	ld1d	{za1h.d[w13, 0]}, p0/z, [x10, x16, lsl #3]
	ldur	x10, [x29, #-192]               ; 8-byte Folded Reload
	add	x10, x10, x2
	ld1d	{za2h.d[w13, 0]}, p0/z, [x10]
	ld1d	{za3h.d[w13, 0]}, p0/z, [x10, x16, lsl #3]
	mov	w13, #3                         ; =0x3
	ldur	x10, [x29, #-184]               ; 8-byte Folded Reload
	add	x10, x10, x2
	ld1d	{za0h.d[w13, 0]}, p0/z, [x10]
	ld1d	{za1h.d[w13, 0]}, p0/z, [x10, x16, lsl #3]
	ldur	x10, [x29, #-176]               ; 8-byte Folded Reload
	add	x10, x10, x2
	ld1d	{za2h.d[w13, 0]}, p0/z, [x10]
	ld1d	{za3h.d[w13, 0]}, p0/z, [x10, x16, lsl #3]
	ldur	x10, [x29, #-160]               ; 8-byte Folded Reload
	add	x10, x10, x2
	ld1d	{za0h.d[w14, 0]}, p0/z, [x10]
	ld1d	{za1h.d[w14, 0]}, p0/z, [x10, x16, lsl #3]
	ldur	x10, [x29, #-168]               ; 8-byte Folded Reload
	add	x10, x10, x2
	ld1d	{za2h.d[w14, 0]}, p0/z, [x10]
	ld1d	{za3h.d[w14, 0]}, p0/z, [x10, x16, lsl #3]
	mov	w14, #5                         ; =0x5
	add	x10, x9, x2
	ld1d	{za0h.d[w14, 0]}, p0/z, [x10]
	ld1d	{za1h.d[w14, 0]}, p0/z, [x10, x16, lsl #3]
	add	x10, x20, x2
	ld1d	{za2h.d[w14, 0]}, p0/z, [x10]
	ld1d	{za3h.d[w14, 0]}, p0/z, [x10, x16, lsl #3]
	ldur	x10, [x29, #-200]               ; 8-byte Folded Reload
	add	x10, x10, x2
	mov	w12, #6                         ; =0x6
	ld1d	{za0h.d[w12, 0]}, p0/z, [x10]
	ld1d	{za1h.d[w12, 0]}, p0/z, [x10, x16, lsl #3]
	ldur	x10, [x29, #-208]               ; 8-byte Folded Reload
	add	x10, x10, x2
	ld1d	{za2h.d[w12, 0]}, p0/z, [x10]
	ld1d	{za3h.d[w12, 0]}, p0/z, [x10, x16, lsl #3]
	ldur	x10, [x29, #-216]               ; 8-byte Folded Reload
	add	x10, x10, x2
	mov	w12, #7                         ; =0x7
	ld1d	{za0h.d[w12, 0]}, p0/z, [x10]
	ld1d	{za1h.d[w12, 0]}, p0/z, [x10, x16, lsl #3]
	ldur	x10, [x29, #-224]               ; 8-byte Folded Reload
	add	x10, x10, x2
	ld1d	{za2h.d[w12, 0]}, p0/z, [x10]
	ld1d	{za3h.d[w12, 0]}, p0/z, [x10, x16, lsl #3]
	add	x10, x1, x4
	st1d	{za0v.d[w15, 0]}, p0, [x10]
	st1d	{za2v.d[w15, 0]}, p0, [x10, x16, lsl #3]
	add	x10, x8, x4
	st1d	{za1v.d[w15, 0]}, p0, [x10]
	st1d	{za3v.d[w15, 0]}, p0, [x10, x16, lsl #3]
	mov	w12, #1                         ; =0x1
	add	x10, x6, x4
	st1d	{za0v.d[w12, 0]}, p0, [x10]
	st1d	{za2v.d[w12, 0]}, p0, [x10, x16, lsl #3]
	add	x10, x26, x4
	st1d	{za1v.d[w12, 0]}, p0, [x10]
	st1d	{za3v.d[w12, 0]}, p0, [x10, x16, lsl #3]
	mov	w12, #2                         ; =0x2
	add	x10, x25, x4
	st1d	{za0v.d[w12, 0]}, p0, [x10]
	st1d	{za2v.d[w12, 0]}, p0, [x10, x16, lsl #3]
	add	x10, x22, x4
	st1d	{za1v.d[w12, 0]}, p0, [x10]
	st1d	{za3v.d[w12, 0]}, p0, [x10, x16, lsl #3]
	mov	w12, #4                         ; =0x4
	add	x10, x24, x4
	st1d	{za0v.d[w13, 0]}, p0, [x10]
	st1d	{za2v.d[w13, 0]}, p0, [x10, x16, lsl #3]
	add	x10, x7, x4
	st1d	{za1v.d[w13, 0]}, p0, [x10]
	st1d	{za3v.d[w13, 0]}, p0, [x10, x16, lsl #3]
	add	x10, x21, x4
	st1d	{za0v.d[w12, 0]}, p0, [x10]
	st1d	{za2v.d[w12, 0]}, p0, [x10, x16, lsl #3]
	add	x10, x27, x4
	st1d	{za1v.d[w12, 0]}, p0, [x10]
	st1d	{za3v.d[w12, 0]}, p0, [x10, x16, lsl #3]
	mov	w12, #6                         ; =0x6
	add	x10, x3, x4
	st1d	{za0v.d[w14, 0]}, p0, [x10]
	st1d	{za2v.d[w14, 0]}, p0, [x10, x16, lsl #3]
	add	x10, x5, x4
	st1d	{za1v.d[w14, 0]}, p0, [x10]
	st1d	{za3v.d[w14, 0]}, p0, [x10, x16, lsl #3]
	add	x10, x19, x4
	st1d	{za0v.d[w12, 0]}, p0, [x10]
	st1d	{za2v.d[w12, 0]}, p0, [x10, x16, lsl #3]
	add	x10, x23, x4
	st1d	{za1v.d[w12, 0]}, p0, [x10]
	st1d	{za3v.d[w12, 0]}, p0, [x10, x16, lsl #3]
	mov	w12, #7                         ; =0x7
	add	x10, x17, x4
	st1d	{za0v.d[w12, 0]}, p0, [x10]
	st1d	{za2v.d[w12, 0]}, p0, [x10, x16, lsl #3]
	add	x10, x0, x4
	st1d	{za1v.d[w12, 0]}, p0, [x10]
	st1d	{za3v.d[w12, 0]}, p0, [x10, x16, lsl #3]
	mov	x12, x28
	mov	x10, x30
	add	x11, x11, #16
	add	x4, x4, x30
	add	x2, x2, #128
	cmp	x11, x28
	b.lo	LBB3_10
; %bb.11:                               ;   in Loop: Header=BB3_9 Depth=3
	ldr	x13, [sp, #576]                 ; 8-byte Folded Reload
	add	x13, x13, #16
	add	x1, x1, #128
	str	x1, [sp, #584]                  ; 8-byte Folded Spill
	add	x0, x0, #128
	str	x0, [sp, #592]                  ; 8-byte Folded Spill
	add	x17, x17, #128
	str	x17, [sp, #600]                 ; 8-byte Folded Spill
	add	x23, x23, #128
	str	x23, [sp, #608]                 ; 8-byte Folded Spill
	add	x19, x19, #128
	str	x19, [sp, #616]                 ; 8-byte Folded Spill
	add	x5, x5, #128
	str	x5, [sp, #624]                  ; 8-byte Folded Spill
	add	x3, x3, #128
	str	x3, [sp, #632]                  ; 8-byte Folded Spill
	add	x27, x27, #128
	str	x27, [sp, #640]                 ; 8-byte Folded Spill
	add	x21, x21, #128
	add	x0, x7, #128
	add	x24, x24, #128
	add	x1, x22, #128
	add	x25, x25, #128
	add	x23, x26, #128
	add	x6, x6, #128
	add	x5, x8, #128
	ldp	x26, x3, [x29, #-232]           ; 16-byte Folded Reload
	add	x26, x26, x10
	add	x3, x3, x10
	ldp	x28, x8, [x29, #-216]           ; 16-byte Folded Reload
	add	x28, x28, x10
	add	x8, x8, x10
	ldur	x19, [x29, #-200]               ; 8-byte Folded Reload
	add	x19, x19, x10
	add	x20, x20, x10
	str	x20, [sp, #648]                 ; 8-byte Folded Spill
	add	x9, x9, x10
	str	x9, [sp, #656]                  ; 8-byte Folded Spill
	ldur	x9, [x29, #-168]                ; 8-byte Folded Reload
	add	x9, x9, x10
	stur	x9, [x29, #-168]                ; 8-byte Folded Spill
	ldur	x9, [x29, #-160]                ; 8-byte Folded Reload
	add	x9, x9, x10
	stur	x9, [x29, #-160]                ; 8-byte Folded Spill
	ldur	x9, [x29, #-176]                ; 8-byte Folded Reload
	add	x9, x9, x10
	stur	x9, [x29, #-176]                ; 8-byte Folded Spill
	ldp	x17, x9, [x29, #-192]           ; 16-byte Folded Reload
	add	x9, x9, x10
	stur	x9, [x29, #-184]                ; 8-byte Folded Spill
	add	x2, x17, x10
	ldr	x7, [sp, #664]                  ; 8-byte Folded Reload
	add	x7, x7, x10
	ldp	x14, x15, [x29, #-256]          ; 16-byte Folded Reload
	add	x14, x14, x10
	add	x15, x15, x10
	ldur	x30, [x29, #-240]               ; 8-byte Folded Reload
	add	x30, x30, x10
	ldr	x11, [sp, #560]                 ; 8-byte Folded Reload
	str	x13, [sp, #576]                 ; 8-byte Folded Spill
	cmp	x13, x11
	ldr	x11, [sp, #568]                 ; 8-byte Folded Reload
	mov	x13, x3
	mov	x17, x0
	b.lo	LBB3_9
	b	LBB3_7
LBB3_12:
	smstop	za
	smstop	sm
	add	sp, sp, #784
	.cfi_def_cfa wsp, 160
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp], #160            ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w23
	.cfi_restore w24
	.cfi_restore w25
	.cfi_restore w26
	.cfi_restore w27
	.cfi_restore w28
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function main
lCPI4_0:
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
	b.lt	LBB4_3
; %bb.1:
	mov	x21, x1
	mov	x22, x0
	ldr	x0, [x1, #8]
	mov	x1, #0                          ; =0x0
	mov	w2, #10                         ; =0xa
	bl	_strtoull
	mov	x19, x0
	cmp	w22, #2
	b.ne	LBB4_37
; %bb.2:
	mov	x21, #0                         ; =0x0
	mov	w20, #5                         ; =0x5
	b	LBB4_4
LBB4_3:
	mov	x21, #0                         ; =0x0
	mov	w20, #5                         ; =0x5
	mov	w19, #8192                      ; =0x2000
LBB4_4:
	bl	_sme_vl
	cmp	x0, #8
	b.ne	LBB4_36
; %bb.5:
	add	x21, x21, x19
	mul	x8, x19, x21
	lsl	x8, x8, #3
	add	x8, x8, #127
	and	x24, x8, #0xffffffffffffff80
	mov	w0, #128                        ; =0x80
	mov	x1, x24
	bl	_aligned_alloc
	cbz	x0, LBB4_52
; %bb.6:
	mov	x22, x0
	mov	w0, #128                        ; =0x80
	mov	x1, x24
	bl	_aligned_alloc
	cbz	x0, LBB4_52
; %bb.7:
	mov	x23, x0
	cbz	x19, LBB4_51
; %bb.8:
	cmp	x19, #7
	b.hi	LBB4_39
; %bb.9:
	str	xzr, [x22]
	cmp	x19, #1
	b.eq	LBB4_51
; %bb.10:
	mov	x8, #4607182418800017408        ; =0x3ff0000000000000
	str	x8, [x22, #8]
	cmp	x19, #2
	b.eq	LBB4_16
; %bb.11:
	mov	x8, #4611686018427387904        ; =0x4000000000000000
	str	x8, [x22, #16]
	cmp	x19, #3
	b.eq	LBB4_16
; %bb.12:
	mov	x8, #4613937818241073152        ; =0x4008000000000000
	str	x8, [x22, #24]
	cmp	x19, #4
	b.eq	LBB4_16
; %bb.13:
	mov	x8, #4616189618054758400        ; =0x4010000000000000
	str	x8, [x22, #32]
	cmp	x19, #5
	b.eq	LBB4_16
; %bb.14:
	mov	x8, #4617315517961601024        ; =0x4014000000000000
	str	x8, [x22, #40]
	cmp	x19, #6
	b.eq	LBB4_16
; %bb.15:
	mov	x8, #4618441417868443648        ; =0x4018000000000000
	str	x8, [x22, #48]
	cmp	x19, #1
	b.eq	LBB4_51
LBB4_16:
	ucvtf	d0, x19
	add	x8, x19, #1
	ucvtf	d1, x8
	add	x8, x22, x21, lsl #3
	stp	d0, d1, [x8]
	cmp	x19, #2
	b.eq	LBB4_51
; %bb.17:
	add	x9, x19, #2
	ucvtf	d0, x9
	str	d0, [x8, #16]
	cmp	x19, #3
	b.eq	LBB4_22
; %bb.18:
	add	x9, x19, #3
	ucvtf	d0, x9
	str	d0, [x8, #24]
	cmp	x19, #4
	b.eq	LBB4_22
; %bb.19:
	add	x9, x19, #4
	ucvtf	d0, x9
	str	d0, [x8, #32]
	cmp	x19, #5
	b.eq	LBB4_22
; %bb.20:
	add	x9, x19, #5
	ucvtf	d0, x9
	str	d0, [x8, #40]
	cmp	x19, #6
	b.eq	LBB4_22
; %bb.21:
	add	x9, x19, #6
	ucvtf	d0, x9
	str	d0, [x8, #48]
	cmp	x19, #2
	b.eq	LBB4_51
LBB4_22:
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
	b.eq	LBB4_51
; %bb.23:
	add	x10, x8, #3
	ucvtf	d0, x10
	str	d0, [x9, #24]
	cmp	x19, #4
	b.eq	LBB4_27
; %bb.24:
	add	x10, x8, #4
	ucvtf	d0, x10
	str	d0, [x9, #32]
	cmp	x19, #5
	b.eq	LBB4_27
; %bb.25:
	add	x10, x8, #5
	ucvtf	d0, x10
	str	d0, [x9, #40]
	cmp	x19, #6
	b.eq	LBB4_27
; %bb.26:
	add	x8, x8, #6
	ucvtf	d0, x8
	str	d0, [x9, #48]
	cmp	x19, #3
	b.eq	LBB4_51
LBB4_27:
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
	b.eq	LBB4_51
; %bb.28:
	add	x10, x8, #4
	ucvtf	d0, x10
	str	d0, [x9, #32]
	cmp	x19, #5
	b.eq	LBB4_31
; %bb.29:
	add	x10, x8, #5
	ucvtf	d0, x10
	str	d0, [x9, #40]
	cmp	x19, #6
	b.eq	LBB4_31
; %bb.30:
	add	x10, x8, #6
	ucvtf	d0, x10
	str	d0, [x9, #48]
	cmp	x19, #4
	b.eq	LBB4_51
LBB4_31:
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
	b.eq	LBB4_51
; %bb.32:
	add	x11, x9, #5
	ucvtf	d0, x11
	str	d0, [x10, #40]
	cmp	x19, #6
	b.eq	LBB4_34
; %bb.33:
	add	x9, x9, #6
	ucvtf	d0, x9
	str	d0, [x10, #48]
	cmp	x19, #5
	b.eq	LBB4_51
LBB4_34:
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
	b.eq	LBB4_51
; %bb.35:
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
	b	LBB4_51
LBB4_36:
	str	x0, [sp]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w0, #1                          ; =0x1
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
LBB4_37:
	ldr	x0, [x21, #16]
	bl	_atoi
	mov	x20, x0
	cmp	w22, #4
	b.lo	LBB4_44
; %bb.38:
	ldr	x0, [x21, #24]
	mov	x1, #0                          ; =0x0
	mov	w2, #10                         ; =0xa
	bl	_strtoull
	mov	x21, x0
	b	LBB4_4
LBB4_39:
	and	x8, x19, #0xfffffffffffffff8
	subs	x9, x19, x8
	b.ne	LBB4_45
; %bb.40:
	add	x10, x22, #32
	lsl	x11, x21, #3
Lloh2:
	adrp	x12, lCPI4_0@PAGE
Lloh3:
	ldr	q0, [x12, lCPI4_0@PAGEOFF]
	mov	w12, #2                         ; =0x2
	dup.2d	v1, x12
	mov	w12, #4                         ; =0x4
	dup.2d	v2, x12
	mov	w12, #6                         ; =0x6
	dup.2d	v3, x12
	mov	w12, #8                         ; =0x8
	dup.2d	v4, x12
LBB4_41:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_42 Depth 2
	mul	x12, x9, x19
	dup.2d	v5, x12
	mov	x12, x10
	mov	x13, x8
	mov.16b	v6, v0
LBB4_42:                                ;   Parent Loop BB4_41 Depth=1
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
	b.ne	LBB4_42
; %bb.43:                               ;   in Loop: Header=BB4_41 Depth=1
	add	x9, x9, #1
	add	x10, x10, x11
	cmp	x9, x19
	b.ne	LBB4_41
	b	LBB4_51
LBB4_44:
	mov	x21, #0                         ; =0x0
	b	LBB4_4
LBB4_45:
	mov	x10, #0                         ; =0x0
	add	x11, x22, #32
	lsl	x12, x21, #3
	lsr	x13, x19, #3
	mov	w14, #2                         ; =0x2
	dup.2d	v0, x14
Lloh4:
	adrp	x14, lCPI4_0@PAGE
Lloh5:
	ldr	q1, [x14, lCPI4_0@PAGEOFF]
	mov	w14, #4                         ; =0x4
	dup.2d	v2, x14
	mov	w14, #6                         ; =0x6
	add	x13, x22, x13, lsl #6
	dup.2d	v3, x14
	mov	w14, #8                         ; =0x8
	dup.2d	v4, x14
	mov	x14, x8
LBB4_46:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_47 Depth 2
                                        ;     Child Loop BB4_49 Depth 2
	mul	x15, x10, x19
	dup.2d	v5, x15
	mov	x15, x8
	mov	x16, x11
	mov.16b	v6, v1
LBB4_47:                                ;   Parent Loop BB4_46 Depth=1
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
	b.ne	LBB4_47
; %bb.48:                               ;   in Loop: Header=BB4_46 Depth=1
	mov	x15, x14
	mov	x16, x13
	mov	x17, x9
LBB4_49:                                ;   Parent Loop BB4_46 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ucvtf	d5, x15
	str	d5, [x16], #8
	add	x15, x15, #1
	subs	x17, x17, #1
	b.ne	LBB4_49
; %bb.50:                               ;   in Loop: Header=BB4_46 Depth=1
	add	x10, x10, #1
	add	x11, x11, x12
	add	x13, x13, x12
	add	x14, x14, x19
	cmp	x10, x19
	b.ne	LBB4_46
LBB4_51:
	mov	w8, #512                        ; =0x200
	str	x8, [sp, #16]
	mov	w8, #256                        ; =0x100
	stp	x19, x8, [sp]
Lloh6:
	adrp	x0, l_.str.1@PAGE
Lloh7:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
Lloh8:
	adrp	x0, l_.str.2@PAGE
Lloh9:
	add	x0, x0, l_.str.2@PAGEOFF
Lloh10:
	adrp	x1, _transpose_sme8@PAGE
Lloh11:
	add	x1, x1, _transpose_sme8@PAGEOFF
	mov	x2, x22
	mov	x3, x23
	mov	x4, x19
	mov	x5, x21
	mov	x6, x20
	bl	_bench
Lloh12:
	adrp	x0, l_.str.3@PAGE
Lloh13:
	add	x0, x0, l_.str.3@PAGEOFF
Lloh14:
	adrp	x1, _transpose_sme16@PAGE
Lloh15:
	add	x1, x1, _transpose_sme16@PAGEOFF
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
LBB4_52:
Lloh16:
	adrp	x8, ___stderrp@GOTPAGE
Lloh17:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh18:
	ldr	x0, [x8]
	str	x24, [sp]
Lloh19:
	adrp	x1, l_.str.4@PAGE
Lloh20:
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fprintf
	mov	w0, #1                          ; =0x1
	bl	_exit
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpLdr	Lloh4, Lloh5
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh19, Lloh20
	.loh AdrpLdrGotLdr	Lloh16, Lloh17, Lloh18
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function sme_vl
_sme_vl:                                ; @sme_vl
	.cfi_startproc
; %bb.0:
	stp	d15, d14, [sp, #-64]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	stp	d13, d12, [sp, #16]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
	.cfi_offset b8, -8
	.cfi_offset b9, -16
	.cfi_offset b10, -24
	.cfi_offset b11, -32
	.cfi_offset b12, -40
	.cfi_offset b13, -48
	.cfi_offset b14, -56
	.cfi_offset b15, -64
	smstart	sm
	cntd	x0
	smstop	sm
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp], #64             ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	ret
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
	b.lt	LBB6_3
; %bb.1:
	mov	x8, #54933                      ; =0xd695
	movk	x8, #59430, lsl #16
	movk	x8, #11787, lsl #32
	movk	x8, #15889, lsl #48
	fmov	d10, x8
	mov	x26, x20
LBB6_2:                                 ; =>This Inner Loop Header: Depth=1
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
	b.ne	LBB6_2
LBB6_3:
Lloh21:
	adrp	x8, l_.str.7@PAGE
Lloh22:
	add	x8, x8, l_.str.7@PAGEOFF
	cbz	x21, LBB6_51
; %bb.4:
	cmp	x21, #7
	b.hi	LBB6_39
; %bb.5:
	ldr	d0, [x22]
	ldr	d1, [x23]
	fcmp	d0, d1
	cset	w9, ne
	cmp	x21, #1
	b.eq	LBB6_12
; %bb.6:
	ldr	d0, [x22, x24, lsl #3]
	ldr	d1, [x23, #8]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #2
	b.eq	LBB6_12
; %bb.7:
	lsl	x10, x24, #4
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #16]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #3
	b.eq	LBB6_12
; %bb.8:
	mov	w10, #24                        ; =0x18
	mul	x10, x24, x10
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #24]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #4
	b.eq	LBB6_12
; %bb.9:
	lsl	x10, x24, #5
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB6_12
; %bb.10:
	mov	w10, #40                        ; =0x28
	mul	x10, x24, x10
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB6_12
; %bb.11:
	mov	w10, #48                        ; =0x30
	mul	x10, x24, x10
	ldr	d0, [x22, x10]
	ldr	d1, [x23, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB6_12:
	cmp	x21, #1
	b.eq	LBB6_50
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
	b.eq	LBB6_19
; %bb.14:
	lsl	x12, x24, #4
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #16]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #3
	b.eq	LBB6_19
; %bb.15:
	mov	w12, #24                        ; =0x18
	mul	x12, x24, x12
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #24]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #4
	b.eq	LBB6_19
; %bb.16:
	lsl	x12, x24, #5
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB6_19
; %bb.17:
	mov	w12, #40                        ; =0x28
	mul	x12, x24, x12
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB6_19
; %bb.18:
	mov	w12, #48                        ; =0x30
	mul	x12, x24, x12
	ldr	d0, [x10, x12]
	ldr	d1, [x11, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB6_19:
	cmp	x21, #2
	b.eq	LBB6_50
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
	b.eq	LBB6_25
; %bb.21:
	mov	w13, #24                        ; =0x18
	mul	x13, x24, x13
	ldr	d0, [x11, x13]
	ldr	d1, [x12, #24]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #4
	b.eq	LBB6_25
; %bb.22:
	lsl	x13, x24, #5
	ldr	d0, [x11, x13]
	ldr	d1, [x12, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB6_25
; %bb.23:
	mov	w13, #40                        ; =0x28
	mul	x13, x24, x13
	ldr	d0, [x11, x13]
	ldr	d1, [x12, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB6_25
; %bb.24:
	mov	w13, #48                        ; =0x30
	mul	x13, x24, x13
	ldr	d0, [x11, x13]
	ldr	d1, [x12, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB6_25:
	cmp	x21, #3
	b.eq	LBB6_50
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
	b.eq	LBB6_30
; %bb.27:
	lsl	x14, x24, #5
	ldr	d0, [x12, x14]
	ldr	d1, [x13, #32]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #5
	b.eq	LBB6_30
; %bb.28:
	mov	w14, #40                        ; =0x28
	mul	x14, x24, x14
	ldr	d0, [x12, x14]
	ldr	d1, [x13, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB6_30
; %bb.29:
	mov	w14, #48                        ; =0x30
	mul	x14, x24, x14
	ldr	d0, [x12, x14]
	ldr	d1, [x13, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB6_30:
	cmp	x21, #4
	b.eq	LBB6_50
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
	b.eq	LBB6_34
; %bb.32:
	mov	w15, #40                        ; =0x28
	mul	x15, x24, x15
	ldr	d0, [x13, x15]
	ldr	d1, [x14, #40]
	fcmp	d0, d1
	cinc	x9, x9, ne
	cmp	x21, #6
	b.eq	LBB6_34
; %bb.33:
	mov	w15, #48                        ; =0x30
	mul	x15, x24, x15
	ldr	d0, [x13, x15]
	ldr	d1, [x14, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB6_34:
	cmp	x21, #5
	b.eq	LBB6_50
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
	b.eq	LBB6_37
; %bb.36:
	mov	w15, #48                        ; =0x30
	mul	x15, x24, x15
	ldr	d0, [x13, x15]
	ldr	d1, [x14, #48]
	fcmp	d0, d1
	cinc	x9, x9, ne
LBB6_37:
	cmp	x21, #6
	b.eq	LBB6_50
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
	b	LBB6_50
LBB6_39:
	cmp	x24, #1
	b.ne	LBB6_46
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
	b	LBB6_42
LBB6_41:                                ;   in Loop: Header=BB6_42 Depth=1
	add	x10, x10, #1
	add	x12, x12, #8
	add	x13, x13, x14
	add	x16, x16, x14
	add	x17, x17, #8
	cmp	x10, x21
	b.eq	LBB6_50
LBB6_42:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_43 Depth 2
                                        ;     Child Loop BB6_45 Depth 2
	movi.2d	v0, #0000000000000000
	mov.d	v0[0], x9
	movi.2d	v1, #0000000000000000
	mov	x9, x13
	mov	x0, x12
	mov	x1, x11
	movi.2d	v2, #0000000000000000
	movi.2d	v3, #0000000000000000
LBB6_43:                                ;   Parent Loop BB6_42 Depth=1
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
	b.ne	LBB6_43
; %bb.44:                               ;   in Loop: Header=BB6_42 Depth=1
	add.2d	v0, v1, v0
	add.2d	v1, v3, v2
	add.2d	v0, v1, v0
	addp.2d	d0, v0
	fmov	x9, d0
	mov	x0, x17
	mov	x1, x16
	mov	x2, x15
	cmp	x21, x11
	b.eq	LBB6_41
LBB6_45:                                ;   Parent Loop BB6_42 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x0]
	ldr	d1, [x1], #8
	fcmp	d0, d1
	cinc	x9, x9, ne
	add	x0, x0, x14
	subs	x2, x2, #1
	b.ne	LBB6_45
	b	LBB6_41
LBB6_46:
	mov	x10, #0                         ; =0x0
	mov	x9, #0                          ; =0x0
	lsl	x11, x24, #3
LBB6_47:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_48 Depth 2
	mov	x12, #0                         ; =0x0
	mov	x13, x22
LBB6_48:                                ;   Parent Loop BB6_47 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x23, x12, lsl #3]
	ldr	d1, [x13]
	fcmp	d1, d0
	cinc	x9, x9, ne
	add	x12, x12, #1
	add	x13, x13, x11
	cmp	x21, x12
	b.ne	LBB6_48
; %bb.49:                               ;   in Loop: Header=BB6_47 Depth=1
	add	x10, x10, #1
	add	x23, x23, x11
	add	x22, x22, #8
	cmp	x10, x21
	b.ne	LBB6_47
LBB6_50:
Lloh23:
	adrp	x10, l_.str.6@PAGE
Lloh24:
	add	x10, x10, l_.str.6@PAGEOFF
	cmp	x9, #0
	csel	x8, x8, x10, eq
LBB6_51:
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
Lloh25:
	adrp	x0, l_.str.5@PAGE
Lloh26:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
Lloh27:
	adrp	x8, ___stdoutp@GOTPAGE
Lloh28:
	ldr	x8, [x8, ___stdoutp@GOTPAGEOFF]
Lloh29:
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
	.loh AdrpAdd	Lloh21, Lloh22
	.loh AdrpAdd	Lloh23, Lloh24
	.loh AdrpLdrGotLdr	Lloh27, Lloh28, Lloh29
	.loh AdrpAdd	Lloh25, Lloh26
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"\320\264\320\273\320\270\320\275\320\260 \320\262\320\265\320\272\321\202\320\276\321\200\320\260 SME %llu double, \320\276\320\266\320\270\320\264\320\260\320\273\320\276\321\201\321\214 8\n"

l_.str.1:                               ; @.str.1
	.asciz	"N = %zu, BS = %d, SVL = %llu \320\261\320\270\321\202\n"

l_.str.2:                               ; @.str.2
	.asciz	"sme8 (ZA 8x8+BS)"

l_.str.3:                               ; @.str.3
	.asciz	"sme16 (4 tiles ZA 16x16+BS)"

l_.str.4:                               ; @.str.4
	.asciz	"\320\275\320\265 \321\203\320\264\320\260\320\273\320\276\321\201\321\214 \320\262\321\213\320\264\320\265\320\273\320\270\321\202\321\214 %zu \320\261\320\260\320\271\321\202\n"

l_.str.5:                               ; @.str.5
	.asciz	"%-28s  min %8.4f s  avg %8.4f s  %6.2f GB/s  %s\n"

l_.str.6:                               ; @.str.6
	.asciz	"\320\236\320\250\320\230\320\221\320\232\320\220"

l_.str.7:                               ; @.str.7
	.asciz	"ok"

.subsections_via_symbols

		cmpi.b  #$00, ($FFFFFFF9).w ; are we sonic
		beq.w	RTSStfu		; if so, go back to regular hurt code
		cmpi.b  #$04, ($FFFFFFF9).w ; are we snorc
		beq.w	RTSStfu		; if so, go back to regular hurt code
		cmpi.b  #$08, ($FFFFFFF9).w ; are we dg
		beq.w	RTSStfu		; if so, go back to regular hurt code
		cmpi.b  #$0C, ($FFFFFFF9).w ; are we sonic debut sonic with a little bit of stolen sprites lmfao
		beq.w	RTSStfu		; if so, go back to regular hurt code

HurtSonic1:
		tst.b	($FFFFFE2C).w	; does Sonic have a shield?
		bne.s	Hurt_Shield1	; if yes, branch
		tst.w	($FFFFFE20).w	; does Sonic have any rings?
		beq.w	Hurt_NoRings	; if not, branch
		jsr	SingleObjLoad
		bne.s	Hurt_Shield1
		move.b	#$37,0(a1)	; load bouncing	multi rings object
		move.w	8(a0),8(a1)
		move.w	$C(a0),$C(a1)

Hurt_Shield1:
		move.b	#0,($FFFFFE2C).w ; remove shield
		move.b	#4,$24(a0)
		bsr.w	Sonic_ResetOnFloor
		bset	#1,$22(a0)
		move.w	#-$900,$12(a0)	; make Sonic bounce away from the object
		move.w	#-$900,$10(a0)
		move.b	#$3F,0(a1)	; load explosion object
		move.w	8(a0),8(a1)
		move.w	$C(a0),$C(a1)
		jsr	(RandomNumber).l
		move.w	d0,d1
		moveq	#0,d1
		move.b	d0,d1
		lsr.b	#2,d1
		subi.w	#$20,d1
		add.w	d1,8(a1)
		lsr.w	#8,d0
		lsr.b	#3,d0
		add.w	d0,$C(a1) ;end of explo code
		btst	#6,$22(a0)
		jsr	Hurt_Reverse
		move.w	#-$900,$12(a0)
		move.w	#-$900,$10(a0)

RTSStfu:
		rts ; return
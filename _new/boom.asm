		cmpi.b  #$10, ($FFFFFFF9).w ; are we dumbass
		bne.w	Dieded_RTSStfu		; if so, go back to regular hurt code

HurtSonic1:
		tst.b	($FFFFFE2C).w	; does Sonic have a shield?
		bne.s	Hurt_Shield1	; if yes, branch
		tst.w	($FFFFFE20).w	; does Sonic have any rings?
		beq.w	Hurt_NoRings1	; if not, branch
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
		beq.s	Hurt_Reverse1
		move.w	#-$900,$12(a0)
		move.w	#-$900,$10(a0)

Hurt_Reverse1:
		move.w	8(a0),d0
		cmp.w	8(a2),d0
		bcs.s	Hurt_ChkSpikes1	; if Sonic is left of the object, branch
		neg.w	$10(a0)		; if Sonic is right of the object, reverse

Hurt_ChkSpikes1:
		move.b	#0,$39(a0)	; clear Spin Dash flag
		move.w	#0,$14(a0)
		move.b	#$1F,$1C(a0)
		move.w	#$78,$30(a0)
		move.w	#$A3,d0		; load normal damage sound
		cmpi.b	#$36,(a2)	; was damage caused by spikes?
		bne.s	Hurt_Sound1	; if not, branch
		cmpi.b	#$16,(a2)	; was damage caused by LZ harpoon?
		bne.s	Hurt_Sound1	; if not, branch
		move.w	#$A6,d0		; load spikes damage sound

Hurt_Sound1:
		jsr	(PlaySound_Special).l
		moveq	#-1,d0
		rts	
; ===========================================================================

Hurt_NoRings1:
		tst.w	($FFFFFFFA).w	; is debug mode	cheat on?
		bne.w	Hurt_Shield1	; if yes, branch
; End of function HurtSonic
; ---------------------------------------------------------------------------
; Subroutine to	kill Sonic
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


KillSonic1:
		move.w	#0,($FFFFFE20).w ; clear rings
		move.b	#0,($FFFFFE2D).w ; remove invincibility
		move.b	#6,$24(a0)
		bsr.w	Sonic_ResetOnFloor
		bset	#1,$22(a0)
		move.w	#-$700,$12(a0)
		move.w	#0,$10(a0)
		move.w	#0,$14(a0)
		move.w	$C(a0),$38(a0)
		move.b	#$18,$1C(a0)
		bset	#7,2(a0)
		move.w	#990,$10(a0)	; WEEEEEEEEEEEEEEEE
		move.w	#$A3,d0		; play normal death sound
		cmpi.b	#$36,(a2)	; check	if you were killed by spikes
		bne.s	Kill_Sound1
		move.w	#$A6,d0		; play spikes death sound

Kill_Sound1:
		jsr	(PlaySound_Special).l

Kill_NoDeath1:
		moveq	#-1,d0
		rts	
; End of function KillSonic
		jmp Touch_Special
		
; Go back to regular non-S1GHM Code
Dieded_RTSStfu:
		jmp SEHEnd
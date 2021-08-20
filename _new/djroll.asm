		cmpi.b  #$10, ($FFFFFFF9).w ; are we sonic
		bne.b	DJRoll_RTSStfu		; if so, go back to regular jump code
        move.b    ($FFFFF603).w,d0 ; Move $FFFFF603 to d0
        andi.b    #$70,d0 ; Has A/B/C been pressed?
        bne.w    DJRoll_Checks ; If so, branch.
        rts ; Return.
 
DJRoll_Checks:
        cmpi.b  #2,$1C(a0) ; Is animation 2 active?
        bne.s   DJRoll_Set ; If not, branch.
        btst    #1,$22(a0) ; Is bit 1 in the status bitfield enabled?
        bne.s   DJRoll_Set ; If so, branch.
        rts ; Return
		
DJRoll_Set:
		cmpi.b    #2,$1C(a0) ; Is animation 2 active?
		beq.b	DJRoll_RTSStfu		; if so, gtfo we're already spinning
		move.w	#$500,$12(a0)	; make Sonic jump
		neg.w	$12(a0)
		move.b  #2,$1C(a0) ; Set Sonic's animation to the rolling animation.
		move.w	#$B4,d0
		jsr		(PlaySound_Special).l 	; Play spindash charge sound
		
DJRoll_RTSStfu:
		rts ; return
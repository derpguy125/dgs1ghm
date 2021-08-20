		cmpi.b  #$00, ($FFFFFFF9).w ; are we sonic
		beq.b	AirRoll_RTSStfu		; if so, go back to regular jump code
		cmpi.b  #$04, ($FFFFFFF9).w ; are we snorc
		beq.b	AirRoll_RTSStfu		; if so, go back to regular jump code
		cmpi.b  #$10, ($FFFFFFF9).w ; are we snorc
		beq.b	AirRoll_RTSStfu		; if so, go back to regular jump code
        move.b    ($FFFFF603).w,d0 ; Move $FFFFF603 to d0
        andi.b    #$70,d0 ; Has A/B/C been pressed?
        bne.w    AirRoll_Checks ; If so, branch.
        rts ; Return.
 
AirRoll_Checks:
        cmpi.b  #2,$1C(a0) ; Is animation 2 active?
        bne.s   AirRoll_Set ; If not, branch.
        btst    #1,$22(a0) ; Is bit 1 in the status bitfield enabled?
        bne.s   AirRoll_Set ; If so, branch.
        rts ; Return
		
AirRoll_Set:
		cmpi.b    #2,$1C(a0) ; Is animation 2 active?
		beq.b	AirRoll_RTSStfu		; if so, gtfo we're already spinning
		
		move.b  #2,$1C(a0) ; Set Sonic's animation to the rolling animation.
		move.w	#$BE,d0
		jsr		(PlaySound_Special).l 	; Play spindash charge sound
		
AirRoll_RTSStfu:
		rts ; return
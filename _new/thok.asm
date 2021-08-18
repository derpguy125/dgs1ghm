; ---------------------------------------------------------------------------
; Subroutine to make Sonic perform a thok
; ---------------------------------------------------------------------------
; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


; Sonic_Thok:
		cmpi.b  #$04, ($FFFFFFF9).w ; are we snorc
		bne.b	Thok_RTSStfu		; if not, go back to regular jump code
		
        move.b    ($FFFFF603).w,d0 ; Move $FFFFF603 to d0
        andi.b    #$70,d0 ; Has A/B/C been pressed?
        bne.w    Thok_Checks ; If so, branch.
        rts ; Return.
 
Thok_Checks:
		
		cmpi.b  #2,$1C(a0) ; Is animation 2 active?
        beq.s   Thok_Set ; If not, branch.
		btst    #0,$3C(a0) ; Is bit 1 in the status bitfield enabled?
        bne.s   Thok_Set ; If so, branch.
		
        rts ; Return
		
Thok_Set:
		cmpi.w	#$00, ($FFFFF5C0).w	; yeah?
		bne.s 	Thok_RTSStfu ; yeah...?
		
		move.w	#$01, ($FFFFF5C0).w	

		btst 	#0,$22(a0) ; is sonic facing left
		bne.b	Thok_MovLeft
		jmp		Thok_MovRight

Thok_SFX:
		moveq    #$FFFFFF84,d0
        jsr    PlaySample
		
		jmp Thok_RTSStfu	; return
	
Thok_MovLeft:		   ; XREF: Sonic_Move
		move.w	#$C00,$10(a0)
		neg.w	$10(a0)
		jmp Thok_SFX
		
Thok_MovRight:		   ; XREF: Sonic_Move
		move.w	#$C00,$10(a0)
		jmp Thok_SFX
		
Thok_ResetFlag:
		move.w	#$0, ($FFFFF5C0).w	
		rts ; return
Thok_RTSStfu:
		rts ; return
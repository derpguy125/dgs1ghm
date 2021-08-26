; ---------------------------------------------------------------------------
; Animation script - Anthont
; ---------------------------------------------------------------------------
		dc.w AnthontAni_Walk-AnthontAniData
		dc.w AnthontAni_Run-AnthontAniData
		dc.w AnthontAni_Roll-AnthontAniData
		dc.w AnthontAni_Roll2-AnthontAniData
		dc.w AnthontAni_Push-AnthontAniData
		dc.w AnthontAni_Wait-AnthontAniData
		dc.w AnthontAni_Balance-AnthontAniData
		dc.w AnthontAni_LookUp-AnthontAniData
		dc.w AnthontAni_Duck-AnthontAniData
		dc.w AnthontAni_Warp1-AnthontAniData
		dc.w AnthontAni_Warp2-AnthontAniData
		dc.w AnthontAni_Warp3-AnthontAniData
		dc.w AnthontAni_Warp4-AnthontAniData
		dc.w AnthontAni_Stop-AnthontAniData
		dc.w AnthontAni_Float1-AnthontAniData
		dc.w AnthontAni_Float2-AnthontAniData
		dc.w AnthontAni_Spring-AnthontAniData
		dc.w AnthontAni_LZHang-AnthontAniData
		dc.w AnthontAni_Leap1-AnthontAniData
		dc.w AnthontAni_Leap2-AnthontAniData
		dc.w AnthontAni_Surf-AnthontAniData
		dc.w AnthontAni_Bubble-AnthontAniData
		dc.w AnthontAni_Death1-AnthontAniData
		dc.w AnthontAni_Drown-AnthontAniData
		dc.w AnthontAni_Death2-AnthontAniData
		dc.w AnthontAni_Shrink-AnthontAniData
		dc.w AnthontAni_Hurt-AnthontAniData
		dc.w AnthontAni_LZSlide-AnthontAniData
		dc.w AnthontAni_Blank-AnthontAniData
		dc.w AnthontAni_Float3-AnthontAniData
		dc.w AnthontAni_Speen-AnthontAniData
AnthontAni_Walk:	dc.b $FF, 8, 9,	$A, $B,	6, 7, $FF
AnthontAni_Run:	dc.b $FF, $1E, $1F, $20, $21, $FF, $FF,	$FF
AnthontAni_Roll:	dc.b $FE, $2E, $2F, $30, $31, $32, $FF,	$FF
AnthontAni_Roll2:	dc.b $FE, $2E, $2F, $32, $30, $31, $32,	$FF
AnthontAni_Push:	dc.b $FD, $45, $46, $47, $48, $FF, $FF,	$FF
AnthontAni_Wait:	dc.b $17, 1, 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 3, 2, 2, 2, 3, 4, $FE, 2, 0
AnthontAni_Balance:	dc.b $1F, $3A, $3B, $FF
AnthontAni_LookUp:	dc.b $3F, 5, $FF, 0
AnthontAni_Duck:	dc.b $3F, $39, $FF, 0
AnthontAni_Warp1:	dc.b 0, $33, $34, $35, $36, $FF
AnthontAni_Warp2:	dc.b $3F, $34, $FF, 0
AnthontAni_Warp3:	dc.b $3F, $35, $FF, 0
AnthontAni_Warp4:	dc.b $3F, $36, $FF, 0
AnthontAni_Stop:	dc.b 7,	$37, $38, $FF
AnthontAni_Float1:	dc.b 7,	$3C, $3F, $FF
AnthontAni_Float2:	dc.b 7,	$3C, $3D, $53, $3E, $54, $FF, 0
AnthontAni_Spring:	dc.b $2F, $40, $FD, 0
AnthontAni_LZHang:	dc.b 4,	$41, $42, $FF
AnthontAni_Leap1:	dc.b $F, $43, $43, $43,	$FE, 1
AnthontAni_Leap2:	dc.b $F, $43, $44, $FE,	1, 0
AnthontAni_Surf:	dc.b $3F, $49, $FF, 0
AnthontAni_Bubble:	dc.b $B, $56, $56, $A, $B, $FD,	0, 0
AnthontAni_Death1:	dc.b $20, $4B, $FF, 0
AnthontAni_Drown:	dc.b $2F, $4C, $FF, 0
AnthontAni_Death2:	dc.b 3,	$4D, $FF, 0
AnthontAni_Shrink:	dc.b 3,	$4E, $4F, $50, $51, $52, 0, $FE, 1, 0
AnthontAni_Hurt:	dc.b 3,	$55, $FF, 0
AnthontAni_LZSlide:	dc.b 7, $55, $57, $FF
AnthontAni_Blank:	dc.b $77, 0, $FD, 0
AnthontAni_Float3:	dc.b 3,	$3C, $3D, $53, $3E, $54, $FF, 0
AnthontAni_Float4:	dc.b 3,	$3C, $FD, 0
AnthontAni_Speen:	dc.b 3,	$4E, $4F, $50, $51, $FF, 0
		even
BattleCommand_Hex:
; get the opponent's status condition
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
; return if it's 0 (no condition)
	and a
	ret z
; it's not zero, so double the damage
	jp DoubleDamage
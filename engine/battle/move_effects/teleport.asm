BattleCommand_Teleport:
; teleport

	ldh a, [hBattleTurn]
	and a
	jp nz, .Enemy

; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	jp z, FailedTeleport

	call UpdateBattleMonInParty
	call AnimateCurrentMove

	ld c, 50
	call DelayFrames

; Transition into switchmon menu
	call LoadStandardMenuHeader
	farcall SetUpBattlePartyMenu

	farcall ForcePickSwitchMonInBattle

; Return to battle scene
	call ClearPalettes
	farcall _LoadBattleFontsHPBar
	call CloseWindow
	call ClearSprites
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetPalettes
	call Teleport_LinkPlayerSwitch

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, EndMoveEffect

	ld hl, PassedBattleMonEntrance
	call CallBattleCore

	call ResetTeleportStatus
	ret

.Enemy:
; Wildmons don't have anything to switch to
	ld a, [wBattleMode]
	dec a ; WILDMON
	jp z, FailedTeleport

	call CheckAnyOtherAliveEnemyMons
	jp z, FailedTeleport

	call UpdateEnemyMonInParty
	call AnimateCurrentMove
	call Teleport_LinkEnemySwitch

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, EndMoveEffect

; Passed enemy PartyMon entrance
	xor a
	ld [wEnemySwitchMonIndex], a
	ld hl, EnemySwitch_SetMode
	call CallBattleCore
	ld hl, ResetBattleParticipants
	call CallBattleCore
	ld a, TRUE
	ld [wApplyStatLevelMultipliersToEnemy], a
	ld hl, ApplyStatLevelMultiplierOnAllStats
	call CallBattleCore

	ld hl, SpikesDamage
	call CallBattleCore

	jr ResetTeleportStatus

Teleport_LinkPlayerSwitch:
	ld a, [wLinkMode]
	and a
	ret z

	ld a, BATTLEPLAYERACTION_USEITEM
	ld [wBattlePlayerAction], a

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore
	call CloseWindow

	xor a ; BATTLEPLAYERACTION_USEMOVE
	ld [wBattlePlayerAction], a
	ret

Teleport_LinkEnemySwitch:
	ld a, [wLinkMode]
	and a
	ret z

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore

	ld a, [wOTPartyCount]
	add BATTLEACTION_SWITCH1
	ld b, a
	ld a, [wBattleAction]
	cp BATTLEACTION_SWITCH1
	jr c, .teleport
	cp b
	jr c, .switch

.teleport
	ld a, [wCurOTMon]
	add BATTLEACTION_SWITCH1
	ld [wBattleAction], a
.switch
	jp CloseWindow

FailedTeleport:
	call AnimateFailedMove
	jp PrintButItFailed

ResetTeleportStatus:
; Reset status changes that aren't passed by Teleport.

	; Nightmare isn't passed.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr nz, .ok

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]
.ok

	; Disable isn't passed.
	call ResetActorDisable

	; Attraction isn't passed.
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, wEnemySubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, wPlayerSubStatus5

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TRANSFORMED, [hl]
	res SUBSTATUS_ENCORED, [hl]
	
	; trying to reset the stats of the pokemon coming in
	ld a, BASE_STAT_LEVEL
	ld hl, wPlayerStatLevels
	call .Fill
	
	ldh a, [hBattleTurn]
	push af
	
	call SetPlayerTurn
	call CalcPlayerStats
	
	pop af
	ldh [hBattleTurn], a
	
.Fill:
	ld b, NUM_LEVEL_STATS
.next
	ld [hli], a
	dec b
	jr nz, .next
	ret 
	
	; New mon hasn't used a move yet.
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], 0

	xor a
	ld [wPlayerWrapCount], a
	ld [wEnemyWrapCount], a
	ret

CheckAnyOtherAlivePartyMons:
	ld hl, wPartyMon1HP
	ld a, [wPartyCount]
	ld d, a
	ld a, [wCurBattleMon]
	ld e, a
	jr CheckAnyOtherAliveMons

CheckAnyOtherAliveEnemyMons:
	ld hl, wOTPartyMon1HP
	ld a, [wOTPartyCount]
	ld d, a
	ld a, [wCurOTMon]
	ld e, a

	; fallthrough

CheckAnyOtherAliveMons:
; Check for nonzero HP starting from partymon
; HP at hl for d partymons, besides current mon e.

; Return nz if any are alive.

	xor a
	ld b, a
	ld c, a
.loop
	ld a, c
	cp d
	jr z, .done
	cp e
	jr z, .next

	ld a, [hli]
	or b
	ld b, a
	ld a, [hld]
	or b
	ld b, a

.next
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	inc c
	jr .loop

.done
	ld a, b
	and a
	ret

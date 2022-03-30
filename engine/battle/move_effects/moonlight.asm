BattleCommand_StartFullMoon:
; start full moon

	ld a, [wBattleWeather]
	cp WEATHER_FULL_MOON
	jr z, .failed

	ld a, WEATHER_FULL_MOON
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	ld hl, TheFullMoonRisesText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

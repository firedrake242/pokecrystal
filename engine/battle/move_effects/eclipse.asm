BattleCommand_StartEclipse:
; startsandstorm

	ld a, [wBattleWeather]
	cp WEATHER_ECLIPSE
	jr z, .failed

	ld a, WEATHER_ECLIPSE
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, EclipseBeginsText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

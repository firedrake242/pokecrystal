	db WYRDEER ; 252
	db  103, 105, 72,  105, 75,  65
	;	hp  atk  def  spd  sat  sdf, tot: 525
	
	db NORMAL, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 175; base exp
	db NO_ITEM, NO_ITEM ; Items
	db GENDER_F50 ; Gender rate
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/wyrdeer/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups
	
	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, EARTHQUAKE, RETURN, PSYCHIC_M, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DREAM_EATER, DETECT, REST, ATTRACT, THIEF, NIGHTMARE, FLASH, BLIZZARD, ICE_BEAM
	; end
	
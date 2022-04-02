	object_const_def
	const NEWBARKTOWNF_TEACHER
	const NEWBARKTOWNF_FISHER
	const NEWBARKTOWNF_SILVER

NewBarkTown_MapScripts_F:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0_F:
	end

.DummyScene1_F:
	end

.FlyPoint_F:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

NewBarkTown_TeacherStopsYouScene1_F:
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWNF_TEACHER, LEFT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWNF_TEACHER, NewBarkTown_TeacherRunsToYouMovement1
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow NEWBARKTOWNF_TEACHER, PLAYER
	applymovement NEWBARKTOWNF_TEACHER, NewBarkTown_TeacherBringsYouBackMovement1
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NewBarkTown_TeacherStopsYouScene2_F:
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWNF_TEACHER, LEFT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWNF_TEACHER, NewBarkTown_TeacherRunsToYouMovement2
	turnobject PLAYER, UP
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow NEWBARKTOWNF_TEACHER, PLAYER
	applymovement NEWBARKTOWNF_TEACHER, NewBarkTown_TeacherBringsYouBackMovement2
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NewBarkTownTeacherScript_F:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .CallMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .TellMomYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable_F:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.TellMomYoureLeaving_F:
	writetext Text_TellMomIfLeaving
	waitbutton
	closetext
	end

.CallMom_F:
	writetext Text_CallMomOnGear
	waitbutton
	closetext
	end

NewBarkTownFisherScript_F:
	jumptextfaceplayer Text_ElmDiscoveredNewMon

NewBarkTownSilverScript_F:
	opentext
	writetext NewBarkTownRivalText1
	waitbutton
	closetext
	turnobject NEWBARKTOWNF_SILVER, LEFT
	opentext
	writetext NewBarkTownRivalText2
	waitbutton
	closetext
	follow PLAYER, NEWBARKTOWNF_SILVER
	applymovement PLAYER, NewBarkTown_SilverPushesYouAwayMovement
	stopfollow
	pause 5
	turnobject NEWBARKTOWNF_SILVER, DOWN
	pause 5
	playsound SFX_TACKLE
	applymovement PLAYER, NewBarkTown_SilverShovesYouOutMovement
	applymovement NEWBARKTOWNF_SILVER, NewBarkTown_SilverReturnsToTheShadowsMovement
	end

NewBarkTownSign_F:
	jumptext NewBarkTownSignText

NewBarkTownPlayersHouseSign_F:
	jumptext NewBarkTownPlayersHouseSignText

NewBarkTownElmsLabSign_F:
	jumptext NewBarkTownElmsLabSignText

NewBarkTownElmsHouseSign_F:
	jumptext NewBarkTownElmsHouseSignText

NewBarkTown_TeacherRunsToYouMovement1_F:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

NewBarkTown_TeacherRunsToYouMovement2_F:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

NewBarkTown_TeacherBringsYouBackMovement1_F:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

NewBarkTown_TeacherBringsYouBackMovement2_F:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

NewBarkTown_SilverPushesYouAwayMovement_F:
	turn_head UP
	step DOWN
	step_end

NewBarkTown_SilverShovesYouOutMovement_F:
	turn_head UP
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end

NewBarkTown_SilverReturnsToTheShadowsMovement_F:
	step RIGHT
	step_end

Text_GearIsImpressive_F:
	text "Wow, your #GEAR"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
	done

Text_WaitPlayer_F:
	text "Wait, <PLAY_G>!"
	done

Text_WhatDoYouThinkYoureDoing_F:
	text "What do you think"
	line "you're doing?"
	done

Text_ItsDangerousToGoAlone_F:
	text "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Wild #MON"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	done

Text_YourMonIsAdorable_F:
	text "Oh! Your #MON"
	line "is adorable!"
	cont "I wish I had one!"
	done

Text_TellMomIfLeaving_F:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

Text_CallMomOnGear_F:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
	done

Text_ElmDiscoveredNewMon_F:
	text "Yo, <PLAYER>!"

	para "I hear PROF.ELM"
	line "discovered some"
	cont "new #MON."
	done

NewBarkTownRivalText1_F:
	text "<……>"

	para "So this is the"
	line "famous ELM #MON"
	cont "LAB…"
	done

NewBarkTownRivalText2_F:
	text "…What are you"
	line "staring at?"
	done

NewBarkTownSignText_F:
	text "NEW BARK TOWN"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

NewBarkTownPlayersHouseSignText_F:
	text "<PLAYER>'s House"
	done

NewBarkTownElmsLabSignText_F:
	text "ELM #MON LAB"
	done

NewBarkTownElmsHouseSignText_F:
	text "ELM'S HOUSE"
	done

NewBarkTown_MapEvents_F:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  3, ELMS_LAB, 1
	warp_event 13,  5, PLAYERS_HOUSE_1F, 1
	warp_event  3, 11, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 11, 13, ELMS_HOUSE, 1

	def_coord_events
	coord_event  1,  8, SCENE_DEFAULT, NewBarkTown_TeacherStopsYouScene1
	coord_event  1,  9, SCENE_DEFAULT, NewBarkTown_TeacherStopsYouScene2

	def_bg_events
	bg_event  8,  8, BGEVENT_READ, NewBarkTownSign
	bg_event 11,  5, BGEVENT_READ, NewBarkTownPlayersHouseSign
	bg_event  3,  3, BGEVENT_READ, NewBarkTownElmsLabSign
	bg_event  9, 13, BGEVENT_READ, NewBarkTownElmsHouseSign

	def_object_events
	object_event  6,  8, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownTeacherScript, -1
	object_event 12,  9, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NewBarkTownFisherScript, -1
	object_event  3,  2, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownSilverScript, EVENT_RIVAL_NEW_BARK_TOWN

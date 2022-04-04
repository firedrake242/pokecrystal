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
	endcallback

NewBarkTownSign_F:
	jumptext NewBarkTownSignText

NewBarkTownPlayersHouseSign_F:
	jumptext NewBarkTownPlayersHouseSignText

NewBarkTownElmsLabSign_F:
	jumptext NewBarkTownElmsLabSignText

NewBarkTownElmsHouseSign_F:
	jumptext NewBarkTownElmsHouseSignText


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

	def_bg_events
	bg_event  8,  8, BGEVENT_READ, NewBarkTownSign_F
	bg_event 11,  5, BGEVENT_READ, NewBarkTownPlayersHouseSign_F
	bg_event  3,  3, BGEVENT_READ, NewBarkTownElmsLabSign_F
	bg_event  9, 13, BGEVENT_READ, NewBarkTownElmsHouseSign_F



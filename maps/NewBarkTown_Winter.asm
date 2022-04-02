NewBarkTownW_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

NewBarkTownWSignText:
	text "NEW BARK TOWN"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

NewBarkTownWPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NewBarkTownWElmsLabSignText:
	text "ELM #MON LAB"
	done

NewBarkTownWElmsHouseSignText:
	text "ELM'S HOUSE"
	done

NewBarkTownW_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  3, ELMS_LAB, 1
	warp_event 13,  5, PLAYERS_HOUSE_1F, 1
	warp_event  3, 11, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 11, 13, ELMS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  8,  8, BGEVENT_READ, NewBarkTownWSign
	bg_event 11,  5, BGEVENT_READ, NewBarkTownWPlayersHouseSign
	bg_event  3,  3, BGEVENT_READ, NewBarkTownWElmsLabSign
	bg_event  9, 13, BGEVENT_READ, NewBarkTownWElmsHouseSign


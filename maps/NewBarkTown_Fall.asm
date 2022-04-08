	object_const_def
	const NEWBARKTOWN_FALL_SHRINE

NewBarkTown_Fall_MapScripts:
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
	endcallback

NewBarkTown_FallSign:
	jumptext NewBarkTown_FallSignText

NewBarkTown_FallPlayersHouseSign:
	jumptext NewBarkTown_FallPlayersHouseSignText

NewBarkTown_FallElmsLabSign:
	jumptext NewBarkTown_FallElmsLabSignText

NewBarkTown_FallElmsHouseSign:
	jumptext NewBarkTown_FallElmsHouseSignText


NewBarkTown_FallSignText:
	text "NEW BARK TOWN"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

NewBarkTown_FallPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NewBarkTown_FallElmsLabSignText:
	text "ELM #MON LAB"
	done

NewBarkTown_FallElmsHouseSignText:
	text "ELM'S HOUSE"
	done

NewBarkTown_FallShrine:
	jumpstd ShrineScript
	
	


NewBarkTown_Fall_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  3, ELMS_LAB, 1
	warp_event 13,  5, PLAYERS_HOUSE_1F, 1
	warp_event  3, 11, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 11, 13, ELMS_HOUSE, 1

	def_bg_events
	bg_event  8,  8, BGEVENT_READ, NewBarkTown_FallSign
	bg_event 11,  5, BGEVENT_READ, NewBarkTown_FallPlayersHouseSign
	bg_event  3,  3, BGEVENT_READ, NewBarkTown_FallElmsLabSign
	bg_event  9, 13, BGEVENT_READ, NewBarkTown_FallElmsHouseSign
	
	def_object_events
	object_event 17, 2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownShrine, -1
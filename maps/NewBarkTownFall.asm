	object_const_def
	const NEWBARKTOWNFALL_SHRINE

NewBarkTownFall_MapScripts:
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

NewBarkTownFallSign:
	jumptext NewBarkTownFallSignText

NewBarkTownFallPlayersHouseSign:
	jumptext NewBarkTownFallPlayersHouseSignText

NewBarkTownFallElmsLabSign:
	jumptext NewBarkTownFallElmsLabSignText

NewBarkTownFallElmsHouseSign:
	jumptext NewBarkTownFallElmsHouseSignText


NewBarkTownFallSignText:
	text "NEW BARK TOWN"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

NewBarkTownFallPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NewBarkTownFallElmsLabSignText:
	text "ELM #MON LAB"
	done

NewBarkTownFallElmsHouseSignText:
	text "ELM'S HOUSE"
	done

NewBarkTownShrine:
	jumpstd ShrineScript

	
NewBarkTownFall_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  3, ELMS_LAB, 1
	warp_event 13,  5, PLAYERS_HOUSE_1F, 1
	warp_event  3, 11, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 11, 13, ELMS_HOUSE, 1

	def_coord_events
	
	def_bg_events
	bg_event  8,  8, BGEVENT_READ, NewBarkTownFallSign
	bg_event 11,  5, BGEVENT_READ, NewBarkTownFallPlayersHouseSign
	bg_event  3,  3, BGEVENT_READ, NewBarkTownFallElmsLabSign
	bg_event  9, 13, BGEVENT_READ, NewBarkTownFallElmsHouseSign
	
	def_object_events
	object_event 17, 2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownFallShrine, -1
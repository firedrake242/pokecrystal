	object_const_def
	const NEWBARKTOWNWINTER_SHRINE

NewBarkTownWinter_MapScripts:
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

NewBarkTownWinterSign:
	jumptext NewBarkTownWinterSignText

NewBarkTownWinterPlayersHouseSign:
	jumptext NewBarkTownWinterPlayersHouseSignText

NewBarkTownWinterElmsLabSign:
	jumptext NewBarkTownWinterElmsLabSignText

NewBarkTownWinterElmsHouseSign:
	jumptext NewBarkTownWinterElmsHouseSignText


NewBarkTownWinterSignText:
	text "NEW BARK TOWN"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

NewBarkTownWinterPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NewBarkTownWinterElmsLabSignText:
	text "ELM #MON LAB"
	done

NewBarkTownWinterElmsHouseSignText:
	text "ELM'S HOUSE"
	done

NewBarkTownWinterShrine:
	jumpstd ShrineScript
	ifequal 1,   .Fall
	ifequal 2, .Winter
	ifequal 3, .Spring
	ifequal 4, .Summer
	
.Fall:
	warp NEW_BARK_TOWN_FALL, 17,3
	end
.Winter:
	warp NEW_BARK_TOWN_WINTER, 17,3
	end
.Spring:
.Summer:
	warp NEW_BARK_TOWN, 17,3
	end	
	
NewBarkTownWinter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  3, ELMS_LAB, 1
	warp_event 13,  5, PLAYERS_HOUSE_1F, 1
	warp_event  3, 11, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 11, 13, ELMS_HOUSE, 1

	def_coord_events
	
	def_bg_events
	bg_event  8,  8, BGEVENT_READ, NewBarkTownWinterSign
	bg_event 11,  5, BGEVENT_READ, NewBarkTownWinterPlayersHouseSign
	bg_event  3,  3, BGEVENT_READ, NewBarkTownWinterElmsLabSign
	bg_event  9, 13, BGEVENT_READ, NewBarkTownWinterElmsHouseSign
	
	def_object_events
	object_event 17, 2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownWinterShrine, -1
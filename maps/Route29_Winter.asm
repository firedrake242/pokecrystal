	object_const_def
	const ROUTE29W_COOLTRAINER_M1
	const ROUTE29W_YOUNGSTER
	const ROUTE29W_TEACHER1
	const ROUTE29W_FRUIT_TREE
	const ROUTE29W_FISHER
	const ROUTE29W_COOLTRAINER_M2
	const ROUTE29W_TUSCANY
	const ROUTE29W_POKE_BALL

Route29W_MapScripts_W:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_ROUTE29W_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE29W_CATCH_TUTORIAL

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Tuscany

.DummyScene0_W:
	end

.DummyScene1_W:
	end

.Tuscany_W:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears_W:
	disappear ROUTE29W_TUSCANY
	endcallback

.DoesTuscanyAppear_W:
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE29W_TUSCANY
	endcallback

Route29WTutorial1_W:
	turnobject ROUTE29W_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29W_COOLTRAINER_M1, 15
	applymovement ROUTE29W_COOLTRAINER_M1, DudeMovementData1a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial1
	closetext
	follow ROUTE29W_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29W_COOLTRAINER_M1, DudeMovementData1b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE29W_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE29W_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Route29WTutorial2_W:
	turnobject ROUTE29W_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29W_COOLTRAINER_M1, 15
	applymovement ROUTE29W_COOLTRAINER_M1, DudeMovementData2a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial2
	closetext
	follow ROUTE29W_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29W_COOLTRAINER_M1, DudeMovementData2b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE29W_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE29W_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Script_RefusedTutorial1_W:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE29W_COOLTRAINER_M1, DudeMovementData1b
	setscene SCENE_ROUTE29W_NOTHING
	end

Script_RefusedTutorial2_W:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE29W_COOLTRAINER_M1, DudeMovementData2b
	setscene SCENE_ROUTE29W_NOTHING
	end

CatchingTutorialDudeScript_W:
	faceplayer
	opentext
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .BoxFull
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse .BoxFull
	writetext CatchingTutorialRepeatText
	yesorno
	iffalse .Declined
	closetext
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

.BoxFull_W:
	writetext CatchingTutorialBoxFullText
	waitbutton
	closetext
	end

.Declined_W:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	end

Route29WYoungsterScript_W:
	jumptextfaceplayer Route29WYoungsterText

Route29WTeacherScript_W:
	jumptextfaceplayer Route29WTeacherText

Route29WFisherScript_W:
	jumptextfaceplayer Route29WFisherText

Route29WCooltrainerMScript_W:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime NITE
	iftrue .nite
.day_morn
	writetext Route29WCooltrainerMText_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Route29WCooltrainerMText_WaitingForMorning
	waitbutton
	closetext
	end

TuscanyScript_W:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	promptbutton
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany_W:
	writetext TuscanyGivesGiftText
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript_W:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript_W:
	closetext
	end

TuscanyNotTuesdayScript_W:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

Route29WSign1_W:
	jumptext Route29WSign1Text

Route29WSign2_W:
	jumptext Route29WSign2Text

Route29WFruitTree_W:
	fruittree FRUITTREE_ROUTE_29

Route29WPotion_W:
	itemball POTION

DudeMovementData1a_W:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData2a_W:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData1b_W:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DudeMovementData2b_W:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

CatchingTutorialBoxFullText_W:
	text "#MON hide in"
	line "the grass. Who"

	para "knows when they'll"
	line "pop out…"
	done

CatchingTutorialIntroText_W:
	text "I've seen you a"
	line "couple times. How"

	para "many #MON have"
	line "you caught?"

	para "Would you like me"
	line "to show you how to"
	cont "catch #MON?"
	done

CatchingTutorialDebriefText_W:
	text "That's how you do"
	line "it."

	para "If you weaken them"
	line "first, #MON are"
	cont "easier to catch."
	done

CatchingTutorialDeclinedText_W:
	text "Oh. Fine, then."

	para "Anyway, if you"
	line "want to catch"

	para "#MON, you have"
	line "to walk a lot."
	done

CatchingTutorialRepeatText_W:
	text "Huh? You want me"
	line "to show you how to"
	cont "catch #MON?"
	done

Route29WYoungsterText_W:
	text "Yo. How are your"
	line "#MON?"

	para "If they're weak"
	line "and not ready for"

	para "battle, keep out"
	line "of the grass."
	done

Route29WTeacherText_W:
	text "See those ledges?"
	line "It's scary to jump"
	cont "off them."

	para "But you can go to"
	line "NEW BARK without"

	para "walking through"
	line "the grass."
	done

Route29WFisherText_W:
	text "I wanted to take a"
	line "break, so I saved"

	para "to record my"
	line "progress."
	done

Route29WCooltrainerMText_WaitingForDay_W: ; unreferenced
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "daytime."
	done

Route29WCooltrainerMText_WaitingForNight_W:
	text "I'm waiting for"
	line "#MON that"

	para "appear only at"
	line "night."
	done

Route29WCooltrainerMText_WaitingForMorning_W:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "morning."
	done

MeetTuscanyText_W:
	text "TUSCANY_W: I do be-"
	line "lieve that this is"

	para "the first time"
	line "we've met?"

	para "Please allow me to"
	line "introduce myself."

	para "I am TUSCANY of"
	line "Tuesday."
	done

TuscanyGivesGiftText_W:
	text "By way of intro-"
	line "duction, please"

	para "accept this gift,"
	line "a PINK BOW."
	done

TuscanyGaveGiftText_W:
	text "TUSCANY_W: Wouldn't"
	line "you agree that it"
	cont "is most adorable?"

	para "It strengthens"
	line "normal-type moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText_W:
	text "TUSCANY_W: Have you"
	line "met MONICA, my"
	cont "older sister?"

	para "Or my younger"
	line "brother, WESLEY?"

	para "I am the second of"
	line "seven children."
	done

TuscanyNotTuesdayText_W:
	text "TUSCANY_W: Today is"
	line "not Tuesday. That"
	cont "is unfortunate…"
	done

Route29WSign1Text_W:
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done

Route29WSign2Text_W:
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done

Route29W_MapEvents_W:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  1, ROUTE_29_ROUTE_46_GATE, 3

	def_coord_events
	coord_event 53,  8, SCENE_ROUTE29W_CATCH_TUTORIAL, Route29WTutorial1
	coord_event 53,  9, SCENE_ROUTE29W_CATCH_TUTORIAL, Route29WTutorial2

	def_bg_events
	bg_event 51,  7, BGEVENT_READ, Route29WSign1
	bg_event  3,  5, BGEVENT_READ, Route29WSign2

	def_object_events
	object_event 50, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CatchingTutorialDudeScript, -1
	object_event 27, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29WYoungsterScript, -1
	object_event 15, 11, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29WTeacherScript, -1
	object_event 12,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29WFruitTree, -1
	object_event 25,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route29WFisherScript, -1
	object_event 13,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29WCooltrainerMScript, -1
	object_event 29, 12, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 48,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route29WPotion, EVENT_ROUTE_29_POTION

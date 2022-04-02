	object_const_def
	const ROUTE27F_COOLTRAINER_M1
	const ROUTE27F_COOLTRAINER_M2
	const ROUTE27F_COOLTRAINER_F1
	const ROUTE27F_COOLTRAINER_F2
	const ROUTE27F_YOUNGSTER1
	const ROUTE27F_YOUNGSTER2
	const ROUTE27F_POKE_BALL1
	const ROUTE27F_POKE_BALL2
	const ROUTE27F_FISHER

Route27F_MapScripts_F:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks

.DummyScene0_F:
	end

.DummyScene1_F:
	end

FirstStepIntoKantoLeftScene_F:
	turnobject ROUTE27F_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27F_FISHER, 15
	applymovement ROUTE27F_FISHER, Route27FFisherStepLeftTwiceMovement
	sjump FirstStepIntoKantoScene_Continue

FirstStepIntoKantoRightScene_F:
	turnobject ROUTE27F_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27F_FISHER, 15
	applymovement ROUTE27F_FISHER, Route27FFisherStepLeftOnceMovement
FirstStepIntoKantoScene_Continue_F:
	turnobject PLAYER, RIGHT
	opentext
	writetext Route27FFisherHeyText
	promptbutton
	writetext Route27FFisherText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

Route27FFisherScript_F:
	jumptextfaceplayer Route27FFisherText

TrainerPsychicGilbert_F:
	trainer PSYCHIC_T, GILBERT, EVENT_BEAT_PSYCHIC_GILBERT, PsychicGilbertSeenText, PsychicGilbertBeatenText, 0, .Script

.Script_F:
	endifjustbattled
	opentext
	writetext PsychicGilbertAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperJose2_F:
	trainer BIRD_KEEPER, JOSE2, EVENT_BEAT_BIRD_KEEPER_JOSE2, BirdKeeperJose2SeenText, BirdKeeperJose2BeatenText, 0, .Script

.Script_F:
	loadvar VAR_CALLERID, PHONE_BIRDKEEPER_JOSE
	endifjustbattled
	opentext
	checkflag ENGINE_JOSE_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue .HasStarPiece
	checkcellnum PHONE_BIRDKEEPER_JOSE
	iftrue .NumberAccepted
	checkevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BirdKeeperJose2AfterBattleText
	promptbutton
	setevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready_F:
	scall .AskNumber2
.AskForNumber_F:
	askforphonenumber PHONE_BIRDKEEPER_JOSE
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE2
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle_F:
	scall .Rematch
	winlosstext BirdKeeperJose2BeatenText, 0
	readmem wJoseFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2_F:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1_F:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0_F:
	loadtrainer BIRD_KEEPER, JOSE2
	startbattle
	reloadmapafterbattle
	loadmem wJoseFightCount, 1
	clearflag ENGINE_JOSE_READY_FOR_REMATCH
	end

.LoadFight1_F:
	loadtrainer BIRD_KEEPER, JOSE1
	startbattle
	reloadmapafterbattle
	loadmem wJoseFightCount, 2
	clearflag ENGINE_JOSE_READY_FOR_REMATCH
	end

.LoadFight2_F:
	loadtrainer BIRD_KEEPER, JOSE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOSE_READY_FOR_REMATCH
	end

.HasStarPiece_F:
	scall .Gift
	verbosegiveitem STAR_PIECE
	iffalse .NoRoom
	clearflag ENGINE_JOSE_HAS_STAR_PIECE
	sjump .NumberAccepted

.NoRoom_F:
	sjump .PackFull

.AskNumber1_F:
	jumpstd AskNumber1MScript
	end

.AskNumber2_F:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber_F:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted_F:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined_F:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull_F:
	jumpstd PhoneFullMScript
	end

.Rematch_F:
	jumpstd RematchMScript
	end

.Gift_F:
	jumpstd GiftMScript
	end

.PackFull_F:
	jumpstd PackFullMScript
	end

TrainerCooltrainermBlake_F:
	trainer COOLTRAINERM, BLAKE, EVENT_BEAT_COOLTRAINERM_BLAKE, CooltrainermBlakeSeenText, CooltrainermBlakeBeatenText, 0, .Script

.Script_F:
	endifjustbattled
	opentext
	writetext CooltrainermBlakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBrian_F:
	trainer COOLTRAINERM, BRIAN, EVENT_BEAT_COOLTRAINERM_BRIAN, CooltrainermBrianSeenText, CooltrainermBrianBeatenText, 0, .Script

.Script_F:
	endifjustbattled
	opentext
	writetext CooltrainermBrianAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfReena_F:
	trainer COOLTRAINERF, REENA1, EVENT_BEAT_COOLTRAINERF_REENA, CooltrainerfReenaSeenText, CooltrainerfReenaBeatenText, 0, .Script

.Script_F:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_REENA
	endifjustbattled
	opentext
	checkflag ENGINE_REENA_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_REENA
	iftrue .NumberAccepted
	checkevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainerfReenaAfterBattleText
	promptbutton
	setevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready_F:
	scall .AskNumber2
.AskForNumber_F:
	askforphonenumber PHONE_COOLTRAINERF_REENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle_F:
	scall .Rematch
	winlosstext CooltrainerfReenaBeatenText, 0
	readmem wReenaFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2_F:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1_F:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0_F:
	loadtrainer COOLTRAINERF, REENA1
	startbattle
	reloadmapafterbattle
	loadmem wReenaFightCount, 1
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.LoadFight1_F:
	loadtrainer COOLTRAINERF, REENA2
	startbattle
	reloadmapafterbattle
	loadmem wReenaFightCount, 2
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.LoadFight2_F:
	loadtrainer COOLTRAINERF, REENA3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.AskNumber1_F:
	jumpstd AskNumber1FScript
	end

.AskNumber2_F:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber_F:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted_F:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined_F:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull_F:
	jumpstd PhoneFullFScript
	end

.Rematch_F:
	jumpstd RematchFScript
	end

TrainerCooltrainerfMegan_F:
	trainer COOLTRAINERF, MEGAN, EVENT_BEAT_COOLTRAINERF_MEGAN, CooltrainerfMeganSeenText, CooltrainerfMeganBeatenText, 0, .Script

.Script_F:
	endifjustbattled
	opentext
	writetext CooltrainerfMeganAfterBattleText
	waitbutton
	closetext
	end

TohjoFallsSign_F:
	jumptext TohjoFallsSignText

Route27FTMSolarbeam_F:
	itemball TM_SOLARBEAM

Route27FRareCandy_F:
	itemball RARE_CANDY

Route27FFisherStepLeftTwiceMovement_F:
	step LEFT
	step LEFT
	step_end

Route27FFisherStepLeftOnceMovement_F:
	step LEFT
	step_end

Route27FFisherHeyText_F:
	text "Hey!"
	done

Route27FFisherText_F:
	text "Do you know what"
	line "you just did?"

	para "You've taken your"
	line "first step into"
	cont "KANTO."

	para "Check your #-"
	line "GEAR MAP and see."
	done

CooltrainermBlakeSeenText_F:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainermBlakeBeatenText_F:
	text "Yow!"
	done

CooltrainermBlakeAfterBattleText_F:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done

CooltrainermBrianSeenText_F:
	text "Hm? You're good,"
	line "aren't you?"
	done

CooltrainermBrianBeatenText_F:
	text "Just as I thought!"
	done

CooltrainermBrianAfterBattleText_F:
	text "A good trainer can"
	line "recognize other"
	cont "good trainers."
	done

CooltrainerfReenaSeenText_F:
	text "You shouldn't"
	line "underestimate the"

	para "wild #MON in"
	line "these parts."
	done

CooltrainerfReenaBeatenText_F:
	text "Oh! You're much"
	line "too strong!"
	done

CooltrainerfReenaAfterBattleText_F:
	text "You're just a kid,"
	line "but you're not to"

	para "be underestimated"
	line "either."
	done

CooltrainerfMeganSeenText_F:
	text "It's rare to see"
	line "anyone come here."

	para "Are you training"
	line "on your own?"
	done

CooltrainerfMeganBeatenText_F:
	text "Oh! You're really"
	line "strong!"
	done

CooltrainerfMeganAfterBattleText_F:
	text "I'm checking out"
	line "pre- and post-"
	cont "evolution #MON."

	para "Evolution really"
	line "does make #MON"
	cont "stronger."

	para "But evolved forms"
	line "also learn moves"
	cont "later on."
	done

PsychicGilbertSeenText_F:
	text "Don't say a thing!"

	para "Let me guess what"
	line "you're thinking."

	para "Mmmmmmm…"

	para "I got it! You're"
	line "on the #MON"
	cont "LEAGUE challenge!"
	done

PsychicGilbertBeatenText_F:
	text "You're too much!"
	done

PsychicGilbertAfterBattleText_F:
	text "With your skills,"
	line "you'll do well at"
	cont "the LEAGUE."

	para "That's what my"
	line "premonition says."
	done

BirdKeeperJose2SeenText_F:
	text "Tweet! Tweet!"
	line "Tetweet!"
	done

BirdKeeperJose2BeatenText_F:
	text "Tweet!"
	done

BirdKeeperJose2AfterBattleText_F:
	text "BIRD KEEPERS like"
	line "me mimic bird"

	para "whistles to com-"
	line "mand #MON."
	done

TohjoFallsSignText_F:
	text "TOHJO FALLS"

	para "THE LINK BETWEEN"
	line "KANTO AND JOHTO"
	done

Route27F_MapEvents_F:
	db 0, 0 ; filler

	def_warp_events
	warp_event 33,  7, ROUTE_27_SANDSTORM_HOUSE, 1
	warp_event 26,  5, TOHJO_FALLS, 1
	warp_event 36,  5, TOHJO_FALLS, 2

	def_coord_events
	coord_event 18, 10, SCENE_DEFAULT, FirstStepIntoKantoLeftScene
	coord_event 19, 10, SCENE_DEFAULT, FirstStepIntoKantoRightScene

	def_bg_events
	bg_event 25,  7, BGEVENT_READ, TohjoFallsSign

	def_object_events
	object_event 48,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermBlake, -1
	object_event 58,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermBrian, -1
	object_event 72, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfReena, -1
	object_event 37,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfMegan, -1
	object_event 65,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicGilbert, -1
	object_event 58, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperJose2, -1
	object_event 60, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27FTMSolarbeam, EVENT_ROUTE_27_TM_SOLARBEAM
	object_event 53, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27FRareCandy, EVENT_ROUTE_27_RARE_CANDY
	object_event 21, 10, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 3, Route27FFisherScript, -1

	object_const_def
	const ROUTE27W_COOLTRAINER_M1
	const ROUTE27W_COOLTRAINER_M2
	const ROUTE27W_COOLTRAINER_F1
	const ROUTE27W_COOLTRAINER_F2
	const ROUTE27W_YOUNGSTER1
	const ROUTE27W_YOUNGSTER2
	const ROUTE27W_POKE_BALL1
	const ROUTE27W_POKE_BALL2
	const ROUTE27W_FISHER

Route27W_MapScripts_W:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks

.DummyScene0_W:
	end

.DummyScene1_W:
	end

FirstStepIntoKantoLeftScene_W:
	turnobject ROUTE27W_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27W_FISHER, 15
	applymovement ROUTE27W_FISHER, Route27WFisherStepLeftTwiceMovement
	sjump FirstStepIntoKantoScene_Continue

FirstStepIntoKantoRightScene_W:
	turnobject ROUTE27W_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27W_FISHER, 15
	applymovement ROUTE27W_FISHER, Route27WFisherStepLeftOnceMovement
FirstStepIntoKantoScene_Continue_W:
	turnobject PLAYER, RIGHT
	opentext
	writetext Route27WFisherHeyText
	promptbutton
	writetext Route27WFisherText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

Route27WFisherScript_W:
	jumptextfaceplayer Route27WFisherText

TrainerPsychicGilbert_W:
	trainer PSYCHIC_T, GILBERT, EVENT_BEAT_PSYCHIC_GILBERT, PsychicGilbertSeenText, PsychicGilbertBeatenText, 0, .Script

.Script_W:
	endifjustbattled
	opentext
	writetext PsychicGilbertAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperJose2_W:
	trainer BIRD_KEEPER, JOSE2, EVENT_BEAT_BIRD_KEEPER_JOSE2, BirdKeeperJose2SeenText, BirdKeeperJose2BeatenText, 0, .Script

.Script_W:
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

.AskedAlready_W:
	scall .AskNumber2
.AskForNumber_W:
	askforphonenumber PHONE_BIRDKEEPER_JOSE
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE2
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle_W:
	scall .Rematch
	winlosstext BirdKeeperJose2BeatenText, 0
	readmem wJoseFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2_W:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1_W:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0_W:
	loadtrainer BIRD_KEEPER, JOSE2
	startbattle
	reloadmapafterbattle
	loadmem wJoseFightCount, 1
	clearflag ENGINE_JOSE_READY_FOR_REMATCH
	end

.LoadFight1_W:
	loadtrainer BIRD_KEEPER, JOSE1
	startbattle
	reloadmapafterbattle
	loadmem wJoseFightCount, 2
	clearflag ENGINE_JOSE_READY_FOR_REMATCH
	end

.LoadFight2_W:
	loadtrainer BIRD_KEEPER, JOSE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOSE_READY_FOR_REMATCH
	end

.HasStarPiece_W:
	scall .Gift
	verbosegiveitem STAR_PIECE
	iffalse .NoRoom
	clearflag ENGINE_JOSE_HAS_STAR_PIECE
	sjump .NumberAccepted

.NoRoom_W:
	sjump .PackFull

.AskNumber1_W:
	jumpstd AskNumber1MScript
	end

.AskNumber2_W:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber_W:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted_W:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined_W:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull_W:
	jumpstd PhoneFullMScript
	end

.Rematch_W:
	jumpstd RematchMScript
	end

.Gift_W:
	jumpstd GiftMScript
	end

.PackFull_W:
	jumpstd PackFullMScript
	end

TrainerCooltrainermBlake_W:
	trainer COOLTRAINERM, BLAKE, EVENT_BEAT_COOLTRAINERM_BLAKE, CooltrainermBlakeSeenText, CooltrainermBlakeBeatenText, 0, .Script

.Script_W:
	endifjustbattled
	opentext
	writetext CooltrainermBlakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBrian_W:
	trainer COOLTRAINERM, BRIAN, EVENT_BEAT_COOLTRAINERM_BRIAN, CooltrainermBrianSeenText, CooltrainermBrianBeatenText, 0, .Script

.Script_W:
	endifjustbattled
	opentext
	writetext CooltrainermBrianAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfReena_W:
	trainer COOLTRAINERF, REENA1, EVENT_BEAT_COOLTRAINERF_REENA, CooltrainerfReenaSeenText, CooltrainerfReenaBeatenText, 0, .Script

.Script_W:
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

.AskedAlready_W:
	scall .AskNumber2
.AskForNumber_W:
	askforphonenumber PHONE_COOLTRAINERF_REENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle_W:
	scall .Rematch
	winlosstext CooltrainerfReenaBeatenText, 0
	readmem wReenaFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2_W:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1_W:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0_W:
	loadtrainer COOLTRAINERF, REENA1
	startbattle
	reloadmapafterbattle
	loadmem wReenaFightCount, 1
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.LoadFight1_W:
	loadtrainer COOLTRAINERF, REENA2
	startbattle
	reloadmapafterbattle
	loadmem wReenaFightCount, 2
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.LoadFight2_W:
	loadtrainer COOLTRAINERF, REENA3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.AskNumber1_W:
	jumpstd AskNumber1FScript
	end

.AskNumber2_W:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber_W:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted_W:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined_W:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull_W:
	jumpstd PhoneFullFScript
	end

.Rematch_W:
	jumpstd RematchFScript
	end

TrainerCooltrainerfMegan_W:
	trainer COOLTRAINERF, MEGAN, EVENT_BEAT_COOLTRAINERF_MEGAN, CooltrainerfMeganSeenText, CooltrainerfMeganBeatenText, 0, .Script

.Script_W:
	endifjustbattled
	opentext
	writetext CooltrainerfMeganAfterBattleText
	waitbutton
	closetext
	end

TohjoFallsSign_W:
	jumptext TohjoFallsSignText

Route27WTMSolarbeam_W:
	itemball TM_SOLARBEAM

Route27WRareCandy_W:
	itemball RARE_CANDY

Route27WFisherStepLeftTwiceMovement_W:
	step LEFT
	step LEFT
	step_end

Route27WFisherStepLeftOnceMovement_W:
	step LEFT
	step_end

Route27WFisherHeyText_W:
	text "Hey!"
	done

Route27WFisherText_W:
	text "Do you know what"
	line "you just did?"

	para "You've taken your"
	line "first step into"
	cont "KANTO."

	para "Check your #-"
	line "GEAR MAP and see."
	done

CooltrainermBlakeSeenText_W:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainermBlakeBeatenText_W:
	text "Yow!"
	done

CooltrainermBlakeAfterBattleText_W:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done

CooltrainermBrianSeenText_W:
	text "Hm? You're good,"
	line "aren't you?"
	done

CooltrainermBrianBeatenText_W:
	text "Just as I thought!"
	done

CooltrainermBrianAfterBattleText_W:
	text "A good trainer can"
	line "recognize other"
	cont "good trainers."
	done

CooltrainerfReenaSeenText_W:
	text "You shouldn't"
	line "underestimate the"

	para "wild #MON in"
	line "these parts."
	done

CooltrainerfReenaBeatenText_W:
	text "Oh! You're much"
	line "too strong!"
	done

CooltrainerfReenaAfterBattleText_W:
	text "You're just a kid,"
	line "but you're not to"

	para "be underestimated"
	line "either."
	done

CooltrainerfMeganSeenText_W:
	text "It's rare to see"
	line "anyone come here."

	para "Are you training"
	line "on your own?"
	done

CooltrainerfMeganBeatenText_W:
	text "Oh! You're really"
	line "strong!"
	done

CooltrainerfMeganAfterBattleText_W:
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

PsychicGilbertSeenText_W:
	text "Don't say a thing!"

	para "Let me guess what"
	line "you're thinking."

	para "Mmmmmmm…"

	para "I got it! You're"
	line "on the #MON"
	cont "LEAGUE challenge!"
	done

PsychicGilbertBeatenText_W:
	text "You're too much!"
	done

PsychicGilbertAfterBattleText_W:
	text "With your skills,"
	line "you'll do well at"
	cont "the LEAGUE."

	para "That's what my"
	line "premonition says."
	done

BirdKeeperJose2SeenText_W:
	text "Tweet! Tweet!"
	line "Tetweet!"
	done

BirdKeeperJose2BeatenText_W:
	text "Tweet!"
	done

BirdKeeperJose2AfterBattleText_W:
	text "BIRD KEEPERS like"
	line "me mimic bird"

	para "whistles to com-"
	line "mand #MON."
	done

TohjoFallsSignText_W:
	text "TOHJO FALLS"

	para "THE LINK BETWEEN"
	line "KANTO AND JOHTO"
	done

Route27W_MapEvents_W:
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
	object_event 60, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27WTMSolarbeam, EVENT_ROUTE_27_TM_SOLARBEAM
	object_event 53, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27WRareCandy, EVENT_ROUTE_27_RARE_CANDY
	object_event 21, 10, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 3, Route27WFisherScript, -1

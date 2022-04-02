	object_const_def
	const ROUTE26F_COOLTRAINER_M1
	const ROUTE26F_COOLTRAINER_M2
	const ROUTE26F_COOLTRAINER_F1
	const ROUTE26F_COOLTRAINER_F2
	const ROUTE26F_YOUNGSTER
	const ROUTE26F_FISHER
	const ROUTE26F_FRUIT_TREE
	const ROUTE26F_POKE_BALL

Route26F_MapScripts_W_F:
	def_scene_scripts

	def_callbacks

TrainerCooltrainermJake_W_F:
	trainer COOLTRAINERM, JAKE, EVENT_BEAT_COOLTRAINERM_JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, .Script

.Script_W_F:
	endifjustbattled
	opentext
	writetext CooltrainermJakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermGaven3_W_F:
	trainer COOLTRAINERM, GAVEN3, EVENT_BEAT_COOLTRAINERM_GAVEN, CooltrainermGaven3SeenText, CooltrainermGaven3BeatenText, 0, .Script

.Script_W_F:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERM_GAVEN
	endifjustbattled
	opentext
	checkflag ENGINE_GAVEN_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERM_GAVEN
	iftrue .NumberAccepted
	checkevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainermGavenAfterText
	promptbutton
	setevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready_W_F:
	scall .AskNumber2
.AskForNumber_W_F:
	askforphonenumber PHONE_COOLTRAINERM_GAVEN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN3
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle_W_F:
	scall .Rematch
	winlosstext CooltrainermGaven3BeatenText, 0
	readmem wGavenFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2_W_F:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1_W_F:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0_W_F:
	loadtrainer COOLTRAINERM, GAVEN3
	startbattle
	reloadmapafterbattle
	loadmem wGavenFightCount, 1
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.LoadFight1_W_F:
	loadtrainer COOLTRAINERM, GAVEN1
	startbattle
	reloadmapafterbattle
	loadmem wGavenFightCount, 2
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.LoadFight2_W_F:
	loadtrainer COOLTRAINERM, GAVEN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.AskNumber1_W_F:
	jumpstd AskNumber1MScript
	end

.AskNumber2_W_F:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber_W_F:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted_W_F:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined_W_F:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull_W_F:
	jumpstd PhoneFullMScript
	end

.Rematch_W_F:
	jumpstd RematchMScript
	end

TrainerCooltrainerfJoyce_W_F:
	trainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, .Script

.Script_W_F:
	endifjustbattled
	opentext
	writetext CooltrainerfJoyceAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfBeth1_W_F:
	trainer COOLTRAINERF, BETH1, EVENT_BEAT_COOLTRAINERF_BETH, CooltrainerfBeth1SeenText, CooltrainerfBeth1BeatenText, 0, .Script

.Script_W_F:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_BETH
	endifjustbattled
	opentext
	checkflag ENGINE_BETH_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_BETH
	iftrue .NumberAccepted
	checkevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainerfBethAfterText
	promptbutton
	setevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready_W_F:
	scall .AskNumber2
.AskForNumber_W_F:
	askforphonenumber PHONE_COOLTRAINERF_BETH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle_W_F:
	scall .Rematch
	winlosstext CooltrainerfBeth1BeatenText, 0
	readmem wBethFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2_W_F:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1_W_F:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0_W_F:
	loadtrainer COOLTRAINERF, BETH1
	startbattle
	reloadmapafterbattle
	loadmem wBethFightCount, 1
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.LoadFight1_W_F:
	loadtrainer COOLTRAINERF, BETH2
	startbattle
	reloadmapafterbattle
	loadmem wBethFightCount, 2
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.LoadFight2_W_F:
	loadtrainer COOLTRAINERF, BETH3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.AskNumber1_W_F:
	jumpstd AskNumber1FScript
	end

.AskNumber2_W_F:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber_W_F:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted_W_F:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined_W_F:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull_W_F:
	jumpstd PhoneFullFScript
	end

.Rematch_W_F:
	jumpstd RematchFScript
	end

TrainerPsychicRichard_W_F:
	trainer PSYCHIC_T, RICHARD, EVENT_BEAT_PSYCHIC_RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText, 0, .Script

.Script_W_F:
	endifjustbattled
	opentext
	writetext PsychicRichardAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherScott_W_F:
	trainer FISHER, SCOTT, EVENT_BEAT_FISHER_SCOTT, FisherScottSeenText, FisherScottBeatenText, 0, .Script

.Script_W_F:
	endifjustbattled
	opentext
	writetext FisherScottAfterBattleText
	waitbutton
	closetext
	end

Route26FSign_W_F:
	jumptext Route26FSignText

Route26FFruitTree_W_F:
	fruittree FRUITTREE_ROUTE_26

Route26FMaxElixer_W_F:
	itemball MAX_ELIXER

CooltrainermJakeSeenText_W_F:
	text "I'm making my"
	line "final preparations"

	para "for the #MON"
	line "LEAGUE."
	done

CooltrainermJakeBeatenText_W_F:
	text "I blew it!"
	done

CooltrainermJakeAfterBattleText_W_F:
	text "It's going to be"
	line "tough to win at"
	cont "the LEAGUE."

	para "I need to do some"
	line "more training."

	para "I hear that the"
	line "LEAGUE's ELITE"

	para "FOUR are tougher"
	line "than GYM LEADERS."
	done

CooltrainermGaven3SeenText_W_F:
	text "By experiencing"
	line "tough battles, you"
	cont "gain power."
	done

CooltrainermGaven3BeatenText_W_F:
	text "Gaah! Life is even"
	line "tougher!"
	done

CooltrainermGavenAfterText_W_F:
	text "To get to #MON"
	line "LEAGUE, you have"

	para "to get through"
	line "VICTORY ROAD."

	para "But VICTORY ROAD"
	line "is tough."

	para "Practically nobody"
	line "goes there!"
	done

CooltrainerfJoyceSeenText_W_F:
	text "Since you've come"
	line "this far, you must"
	cont "be good."

	para "I'm going to give"
	line "this battle every-"
	cont "thing I've got!"
	done

CooltrainerfJoyceBeatenText_W_F:
	text "No! I don't"
	line "believe this!"
	done

CooltrainerfJoyceAfterBattleText_W_F:
	text "I've defeated"
	line "eight GYM LEADERS,"

	para "so I was feeling"
	line "confident."

	para "I'll have to try"
	line "harder next time."
	done

CooltrainerfBeth1SeenText_W_F:
	text "I lost to a train-"
	line "er named <RIVAL>."

	para "He was really"
	line "strong, but…"

	para "It was as if he"
	line "absolutely had to"
	cont "win at any cost."

	para "I felt sorry for"
	line "his #MON."
	done

CooltrainerfBeth1BeatenText_W_F:
	text "#MON aren't"
	line "tools of war."
	done

CooltrainerfBethAfterText_W_F:
	text "#MON are in-"
	line "valuable, lifelong"
	cont "partners."
	done

PsychicRichardSeenText_W_F:
	text "Wow, look at all"
	line "those BADGES!"
	cont "I'm impressed."

	para "But you're not"
	line "satisfied by just"

	para "collecting them,"
	line "right?"
	done

PsychicRichardBeatenText_W_F:
	text "Good battle!"
	done

PsychicRichardAfterBattleText_W_F:
	text "People and #MON"
	line "grow from their"
	cont "experiences."

	para "Don't get lazy and"
	line "complacent."
	done

FisherScottSeenText_W_F:
	text "I'm feeling great"
	line "today!"

	para "I feel like I"
	line "could boot even"
	cont "the LEAGUE CHAMP!"
	done

FisherScottBeatenText_W_F:
	text "No! Not in this"
	line "battle!"
	done

FisherScottAfterBattleText_W_F:
	text "Just like in fish-"
	line "ing, it's all over"

	para "in #MON if you"
	line "give up."
	done

Route26FSignText_W_F:
	text "ROUTE 26"

	para "#MON LEAGUE"
	line "RECEPTION GATE"
	done

Route26F_MapEvents_W_F:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  5, VICTORY_ROAD_GATE, 3
	warp_event 15, 57, ROUTE_26_HEAL_HOUSE, 1
	warp_event  5, 71, DAY_OF_WEEK_SIBLINGS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  8,  6, BGEVENT_READ, Route26FSign

	def_object_events
	object_event 14, 24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermJake, -1
	object_event  9, 38, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermGaven3, -1
	object_event 10, 56, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJoyce, -1
	object_event  5,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfBeth1, -1
	object_event 13, 79, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicRichard, -1
	object_event 10, 92, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherScott, -1
	object_event 14, 54, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26FFruitTree, -1
	object_event  9, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route26FMaxElixer, EVENT_ROUTE_26_MAX_ELIXER

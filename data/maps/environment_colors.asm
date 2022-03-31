EnvironmentColorsPointers:
; entries correspond to environment constants (see constants/map_data_constants.asm)
	table_width 2, EnvironmentColorsPointers
	dw .OutdoorColors 		; unused
	dw .OutdoorColors 		; TOWN
	dw .OutdoorColors 		; ROUTE
	dw .IndoorColors  		; INDOOR
	dw .DungeonColors 		; CAVE
	dw .Env5Colors    		; ENVIRONMENT_5
	dw .IndoorColors  		; GATE
	dw .DungeonColors 		; DUNGEON
	dw .OutdoorColorsFall	; TOWN_FALL
	dw .OutdoorColorsFall	; ROUTE_FALL
	dw .OutdoorColorsWinter ; TOWN_WINTER
	dw .OutdoorColorsWinter ; ROUTE_WINTER
	dw .OutdoorColorsSpring	; TOWN_SPRING
	dw .OutdoorColorsSpring ; TOWN_SPRING
	assert_table_length NUM_ENVIRONMENTS + 1

; Valid indices: 
; Summer: 	$00 - $29 (see gfx/tilesets/bg_tiles.pal)
; Fall:		$30 - $47
; Winter:
; Spring:
.OutdoorColors:
	db $00, $01, $02, $28, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $28, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $29, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.IndoorColors:
	db $20, $21, $22, $23, $24, $25, $26, $07 ; morn
	db $20, $21, $22, $23, $24, $25, $26, $07 ; day
	db $10, $11, $12, $13, $14, $15, $16, $07 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $07 ; dark

.DungeonColors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.Env5Colors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark
	
.OutdoorColorsFall:
	db $30, $31, $32, $28, $34, $35, $36, $37 ; morn
	db $38, $39, $3a, $28, $3c, $3d, $3e, $3f ; day
	db $40, $41, $42, $29, $44, $45, $46, $47 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.OutdoorColorsWinter:
	db $00, $01, $02, $28, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $28, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $29, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark
	
.OutdoorColorsSpring:
	db $00, $01, $02, $28, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $28, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $29, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark
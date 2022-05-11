LoadSpecialMapPalette:
	ld a, [wMapTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_BATTLE_TOWER_INSIDE
	jr z, .battle_tower_inside
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion_mobile
	cp TILESET_JOHTO
	jr z, .season
	cp TILESET_JOHTO_MODERN
	jr z, .season
	cp TILESET_KANTO
	jr z, .season
	cp TILESET_PARK
	jr z, .season
	cp TILESET_FOREST
	jr z, .season
	cp TILESET_PORT
	jr z, .season
	jr .do_nothing

.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.battle_tower_inside
	call LoadBattleTowerInsidePalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret
		
.season
	ld a, [wCurrentSeason]
	cp SEASON_FALL
	jr z, .LoadFallPalette
	cp SEASON_WINTER
	jr z, .LoadWinterPalette
	and a
	ret

.LoadFallPalette
	ld a, [wTimeOfDay]
	and $7
	cp NITE_F
	jr z, .LoadFallNitePalette
	cp DAY_F
	jr z, .LoadFallDayPalette
	call LoadFallMornPalette
	scf
	ret
	
.LoadWinterPalette
	ld a, [wTimeOfDay]
	and $7
	cp NITE_F
	jr z, .LoadWinterNitePalette
	cp DAY_F
	jr z, .LoadWinterDayPalette
	call LoadWinterMornPalette
	scf
	ret
	

	
.LoadFallNitePalette
	call LoadFallNitePalette
	scf
	ret
	
.LoadFallDayPalette
	call LoadFallDayPalette
	scf
	ret
	
.LoadFallMornPalette
	call LoadFallMornPalette
	scf
	ret
	
.LoadWinterNitePalette
	call LoadWinterNitePalette
	scf
	ret
	
.LoadWinterDayPalette
	call LoadWinterDayPalette
	scf
	ret
	
.LoadWinterMornPalette
	call LoadWinterMornPalette
	scf
	ret
	
	

.do_nothing
	and a
	ret

LoadPokeComPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeComPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

PokeComPalette:
INCLUDE "gfx/tilesets/pokecom_center.pal"

LoadBattleTowerInsidePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, BattleTowerInsidePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

BattleTowerInsidePalette:
INCLUDE "gfx/tilesets/battle_tower_inside.pal"

LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

HousePalette:
INCLUDE "gfx/tilesets/house.pal"

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"

LoadFallDayPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, FallDayPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

FallDayPalette:
INCLUDE "gfx/tilesets/fall_day.pal"

LoadFallNitePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, FallNitePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

FallNitePalette:
INCLUDE "gfx/tilesets/fall_nite.pal"

LoadFallMornPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, FallMornPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

FallMornPalette:
INCLUDE "gfx/tilesets/fall_morn.pal"

LoadWinterDayPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, WinterDayPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

WinterDayPalette:
INCLUDE "gfx/tilesets/winter_day.pal"

LoadWinterNitePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, WinterNitePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

WinterNitePalette:
INCLUDE "gfx/tilesets/winter_nite.pal"

LoadWinterMornPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, WinterMornPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

WinterMornPalette:
INCLUDE "gfx/tilesets/winter_morn.pal"




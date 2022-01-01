incsrc "globals.asm"

; Hijack setting area
org $82de83
jsl DetermineSubArea
nop
nop

org $8ff000
DetermineSubArea: {

  ; Hijacked code (DO NOT MODIFY)
  and #$00ff
  sta $079f

  ; Use the builtin area as the default
  phx
  sta !SRAM_SubArea

  ldx.w #0

  .OuterLoop {
    lda SubAreaRooms,x
    inx
    inx

    cmp #$dead
    beq +
    tay

    .InnerLoop {
      lda SubAreaRooms,x
      inx
      inx

      cmp #$dead
      beq .OuterLoop

      cmp $079b
      bne .InnerLoop
      tya
      sta !SRAM_SubArea
    }
  }

+ plx
  rtl
}

SubAreaRooms: {

; 00 = Crateria (includes Blue Brinstar)
; 01 = Green Brinstar
; 02 = Upper Norfair
; 03 = Wrecked Ship (NA)
; 04 = East Maridia
; 05 = Tourian (NA)
; 06 = Ceres (NA)
; 07 = Debug (NA)
; 08 = Red Brinstar
; 09 = Kraid
; 0a = West Maridia
; 0b = Lower Norfair
; 0c = Croc

  .CrateriaRooms: {
    dw !Area_Crateria
    dw $91f8  ; Landing Site
    dw $92b3  ; Gauntlet East
    dw $92fd  ; Crateria Mainstreet
    dw $93aa  ; Landing Site PBs Cave
    dw $93d5  ; Crateria Save Station
    dw $948C  ; Pre moat room
    dw $95D4  ; Crateria pipe tunnel
    dw $95FF  ; Moat
    dw $965B  ; Gauntlet west
    dw $96BA  ; Old Tourian escape shaft
    dw $975C  ; Old Mother Brain room
    dw $97B5  ; Crateria -> Blue Brinstar elevator
    dw $9804  ; Bomb Torizo
    dw $9879  ; Pre Bomb Torizo hall
    dw $9800  ; Pre Crateria map station hall
    dw $990D  ; Crateria slope
    dw $9969  ; West Crateria kago hall
    dw $9994  ; Crateria map station
    dw $99BD  ; Crateria space pirate shaft
    dw $99F9  ; Crateria spike floor room
    dw $9A44  ; Crateria bomb block hall
    dw $9A90  ; Crateria chozo missile
    dw $9E9F  ; Morph ball room
    dw $9F11  ; Old Kraid entrance
    dw $9F64  ; Blue Brinstar ceiling e-tank hall
    dw $A107  ; Blue Brinstar missile room
    dw $A1AD  ; Blue Brinstar boulder room
    dw $A1D8  ; Blue Brinstar double missile room
    dw !EOL
  }

  .GreenBrinstarRooms: {
  ;   dw !Area_GreenBrinstar  ; Reuse "Brinstar" index to save space
  ;   dw $9938  ; Crateria -> Green Brinstar elevator
  ;   dw $9AD9  ; Green Brinstar mainstreet
  ;   dw $9B5B  ; Spore Spawn's super missile shaft
  ;   dw $9B9D  ; Pre Brinstar map room hall
  ;   dw $9BC8  ; Early supers room
  ;   dw $9C07  ; Brinstar reserve tank room
  ;   dw $9C35  ; Brinstar map station
  ;   dw $9C5E  ; Fireflea room
  ;   dw $9C89  ; Green Brinstar missile station
  ;   dw $9CB3  ; Dachora room
  ;   dw $9D19  ; Charge beam room
  ;   dw $9D9C  ; Pre Spore Spawn hall
  ;   dw $9DC7  ; Spore Spawn
  ;   dw $9E11  ; Brinstar false wall super-sidehopper power bomb room
  ;   dw $9E52  ; Brinstar diagonal room
  ;   dw $9FBA  ; n00b bridge
  ;   dw $9FE5  ; Brinstar false floor beetom room
  ;   dw $A011  ; Brinstar false floor spike hall
  ;   dw $A051  ; Brinstar post false floor super missiles
  ;   dw $A07B  ; Dachora energy station
  ;   dw $A0A4  ; Post Spore Spawn supers hall
  ;   dw $A0D2  ; Pink Brinstar flooded hall
  ;   dw $A130  ; Brinstar sidehopper wave-gate room
  ;   dw $A15B  ; Brinstar post side-hopper wave-gate energy tank
  ;   dw $A184  ; Pre Spore Spawn save station
  ;   dw $A201  ; Green Brinstar mainstreet save station
  ;   dw $A22A  ; Brinstar false floor save station
  ;   dw $dead
  }

  .UpperNorfairRooms: {
  ;   dw !Area_UpperNorfair
  ;   dw $A6A1  ; Kraid's lair entrance
  ;   dw $A75D  ; Post ice beam mockball hall
  ;   dw $A788  ; Norfair lava hidden missile room
  ;   dw $A7B3  ; First hot room
  ;   dw $A7DE  ; Norfair mainstreet
  ;   dw $A815  ; Ice beam mockball hall
  ;   dw $A865  ; Ice beam practice room
  ;   dw $A890  ; Ice beam room
  ;   dw $A8B9  ; Pre ice beam shaft
  ;   dw $A8F8  ; Crumble block platform shaft
  ;   dw $A923  ; Norfair slope
  ;   dw $A9E5  ; Hi-jump room
  ;   dw $AA0E  ; Norfair grapple ceiling room
  ;   dw $AA41  ; Pre hi-jump room
  ;   dw $AC5A  ; Bubble Norfair reserve tank room
  ;   dw $AC83  ; Bubble Norfair pre reserve tank room
  ;   dw $ACB3  ; Bubble Norfair mainstreet
  ;   dw $ACF0  ; Speed booster lavaquake
  ;   dw $AD1B  ; Speed booster room
  ;   dw $AD5E  ; Lower Norfair -> Bubble Norfair
  ;   dw $ADAD  ; Pre wave beam room
  ;   dw $ADDE  ; Wave beam room
  ;   dw $AE07  ; Norfair sinking kamer hall
  ;   dw $AE32  ; Norfair funes and lavaquake room
  ;   dw $AE74  ; Pre Lower Norfair entrance shaft
  ;   dw $AEB4  ; Norfair multiviola and lavamen hall
  ;   dw $AEDF  ; Pre "useless cave" shaft
  ;   dw $AF72  ; Norfair wave gate room
  ;   dw $AFA3  ; Norfair long lavaquake hall
  ;   dw $AFCE  ; Boring near-Crocomire hall
  ;   dw $AFFB  ; Norfair spike floor hall
  ;   dw $B026  ; Norfair energy station
  ;   dw $B051  ; "useless cave"
  ;   dw $B07A  ; Pre speed booster lavaquake room
  ;   dw $B0B4  ; Norfair map station
  ;   dw $B0DD  ; Bubble Norfair save station
  ;   dw $B106  ; Norfair speed blockade hall
  ;   dw $B139  ; Norfair stone zoomer shaft
  ;   dw $B167  ; Rock Norfair save station
  ;   dw $B192  ; Pre Crocomire save station
  ;   dw $dead
  }

  .EastMaridiaRooms: {
    ; dw !Area_EastMaridia
    ; dw $94CC  ; Crateria -> Maridia elevator
    ; dw $95A8  ; Post Crateria maze yellow door
    ; dw $D27E  ; Plasma beam puyo room
    ; dw $D2AA  ; Plasma beam room
    ; dw $D2D9  ; Sandy Maridia thin platform hall
    ; dw $D30B  ; Maridia -> Crateria elevator
    ; dw $D340  ; Sandy Maridia mainstreet
    ; dw $D387  ; Pre plasma beam shaft
    ; dw $D3DF  ; Sandy Maridia save station
    ; dw $D408  ; Maridia elevatube
    ; dw $D433  ; Sandy Maridia drowning sand pit room
    ; dw $D461  ; Sand falls west
    ; dw $D48E  ; Elevatube south
    ; dw $D4C2  ; Sand falls east
    ; dw $D4EF  ; Maridia reserve tank room
    ; dw $D51E  ; PB #66 room
    ; dw $D54D  ; Pre Maridia reserve tank room sand fall room
    ; dw $D57A  ; Pre PB #66 room sand fall room
    ; dw $D5A7  ; Snail room
    ; dw $D5EC  ; Sandy Maridia sand pit room
    ; dw $D617  ; Mochtroid room
    ; dw $D646  ; Pre Shaktool shaft
    ; dw $D69A  ; Pre Shaktool shaft section
    ; dw $D6D0  ; Springball room
    ; dw $D6FD  ; Sand falls sand pit
    ; dw $D72A  ; Maridia grapple room
    ; dw $D765  ; Snail room save station
    ; dw $D78F  ; Pre Draygon room
    ; dw $D7E4  ; Maridia speed blockade hall
    ; dw $D81A  ; Draygon save station
    ; dw $D845  ; Maridia missile station
    ; dw $D86E  ; Sandy Maridia sand falls room
    ; dw $D898  ; Sand falls
    ; dw $D8C5  ; Shaktool
    ; dw $D913  ; Maridia grapple wall shaft
    ; dw $D95E  ; Botwoon
    ; dw $D9AA  ; Space jump room
    ; dw $D9D4  ; Maridia energy station
    ; dw $D9FE  ; Plasma beam shortcut cacatac room
    ; dw $DA2B  ; Plasma beam shortcut spike room
    ; dw $DA60  ; Draygon
    ; dw $dead
  }

  .RedBrinstarRooms: {
    dw !Area_RedBrinstar
    dw $962A  ; Crateria -> Red Brinstar elevator
    dw $A253  ; Red Brinstar mainstreet
    dw $A293  ; Pre x-ray spike hall
    dw $A2CE  ; X-ray room
    dw $A2F7  ; Red Brinstar damage boost hall
    dw $A322  ; Red Brinstar -> Crateria elevator
    dw $A37C  ; Red Brinstar super-sidehopper power bomb floor room
    dw $A3AE  ; Early power bombs room
    dw $A3DD  ; Red Brinstar skree-duo hall
    dw $A408  ; Pre spazer room
    dw $A447  ; Spazer room
    dw $A618  ; Red Brinstar energy station
    dw $A734  ; Red Brinstar save station
    dw $CED2  ; n00b tube save station
    dw $CEFB  ; n00b tube
    dw $CF54  ; n00b tube west
    dw $CF80  ; n00b tube east
    dw !EOL
  }

  .KraidRooms: {
    dw !Area_Kraid
    dw $A471  ; Kraid BTS madness
    dw $A4B1  ; Kraid beetom room
    dw $A4DA  ; Kraid kihunter hall
    dw $A521  ; Fake Kraid's room
    dw $A56B  ; Pre Kraid room
    dw $A59F  ; Kraid
    dw $A641  ; Kraid refill station
    dw $A6E2  ; Varia suit room
    dw $A70B  ; Kraid save station
    dw $dead
  }

  .WestMaridiaRooms: {
    dw !Area_WestMaridia
    dw $CFC9  ; Maridia mainstreet
    dw $D017  ; Maridia space pirate room
    dw $D055  ; Maridia spinning turtle room
    dw $D08A  ; Maridia green gate hall
    dw $D0B9  ; Mt. Doom
    dw $D104  ; Maridia -> Red Brinstar room
    dw $D13B  ; Sandy Maridia missile and super missile room
    dw $D16D  ; Sandy Maridia memu room
    dw $D1A3  ; Maridia pink room
    dw $D1DD  ; Sandy Maridia unused passage to Sandy Maridia mainstreet
    dw $D21C  ; Maridia broken glass tube room
    dw $D252  ; Maridia broken glass tube room east
    dw $D3B6  ; Maridia map station
    dw $dead
  }

  .LowerNorfairRooms: {
    dw !Area_LowerNorfair
    dw $AF14  ; Lower Norfair entrance
    dw $AF3F  ; Norfair -> Lower Norfair elevator
    dw $B1BB  ; Pre Lower Norfair save station
    dw $B1E5  ; Golden chozo statue lava lake
    dw $B236  ; Lower Norfair mainstreet
    dw $B283  ; Golden Torizo
    dw $B2DA  ; Screw attack practice
    dw $B305  ; Lower Norfair energy station
    dw $B32E  ; Ridley
    dw $B37A  ; Pre Ridley hall
    dw $B3A5  ; Lower Norfair power bomb floor shaft
    dw $B40A  ; Lower Norfair multi-level one-way shaft
    dw $B457  ; Lower Norfair breakable pillars hall
    dw $B482  ; Lower Norfair holtz room
    dw $B4AD  ; Lower Norfair wall jumping space pirates shaft
    dw $B4E5  ; Lower Norfair lavaquake room
    dw $B510  ; Lower Norfair mini metal maze room
    dw $B55A  ; Lower Norfair crumble walls power bomb room
    dw $B585  ; Lower Norfair kihunter shaft
    dw $B5D5  ; Lower Norfair super desgeega hall
    dw $B62B  ; Elite pirate hall
    dw $B656  ; Impossible's x-ray room
    dw $B698  ; Ridley's energy tank
    dw $B6C1  ; Screw attack shaft
    dw $B6EE  ; Norfair rolling boulder shaft
    dw $B741  ; Lower Norfair save station
    dw $dead
  }

  .CrocomireRooms: {
    dw !Area_Crocomire
    dw $A98D  ; Crocomire
    dw $AA82  ; Post Crocomire room
    dw $AAB5  ; Post Crocomire save station
    dw $AADE  ; Post Crocomire power bombs room
    dw $AB07  ; Post Crocomire shaft
    dw $AB3B  ; Post Crocomire fluctuating acid missiles cave
    dw $AB64  ; Double lake grapple practice room
    dw $AB8F  ; Huge jump room
    dw $ABD2  ; Grapple practice shaft
    dw $AC00  ; Single lake grapple practice room
    dw $AC2B  ; Grapple room
    dw $dead
  }

  .EndOfRooms: {
    dw !EOL
  }
}

warnpc $8fffff
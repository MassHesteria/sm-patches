org $82eeda
db $1f

; Custom game play start function
org $80ff00

; *** Standard hijack to call custom code on game play start ***
pushpc
org $828067
jsl GameplayStart
pullpc

GameplayStart: {
  lda $7e0998   ; load game state in A
  cmp #$001f    ; Check if Game State is Setup New Game (Post Intro)
  bne +
  lda $7ed7e2   ; SRAM copy of $7e09c4 (Max Health of Samus)
  bne +

  lda $7e0952   ; load save slot in A
  jsl $818000   ; call the save code to save the game

+ lda #$0000    ; Zero out A
  rtl
}

macro SetCounts(EnergyTanks,MajorItems)
  db <EnergyTanks>
  db <MajorItems>
endmacro

; Use Vanilla Counts for testing
org $dfff10
%SetCounts(2+1,1+1) ; Crateria + Blue Brinstar
%SetCounts(1+2,0+1) ; Green Brinstar + Pink Brinstar
%SetCounts(1,4)     ; Upper Norfair
%SetCounts(1,1)     ; Wrecked Ship
%SetCounts(1,3)     ; East Maridia
%SetCounts(0,0)     ; Tourian
%SetCounts(0,0)     ; Ceres
%SetCounts(0,0)     ; Debug
%SetCounts(0,2)     ; RedBrinstar
%SetCounts(1,1)     ; Kraid
%SetCounts(1,0)     ; West Maridia
%SetCounts(2,1)     ; Lower Norfair
%SetCounts(1,1)     ; Crocomire
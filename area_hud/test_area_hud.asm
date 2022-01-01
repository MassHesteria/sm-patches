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
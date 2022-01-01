incsrc "counter.asm"
incsrc "sub_areas.asm"

; Disable the Minimap drawing routine
org $90a91b
rtl

org $8098bf
pushtable
table "font_yellow.tbl",rtl
dw "      "
skip 52
dw "      "
skip 52
dw "      "
skip 52
dw "      "
pulltable

org $8095fc
jml DrawHUD

macro DrawNextChar()

  ; Load the character
  lda AreaNames,x

  ; Move to the next character
  inx
  inx
  
  ; Save the value of X for later
  phx

  ; Move the tile position from Y to X
  tyx

  ; Write the tile to the screen
  sta $7ec608,x

  ; Move to the next tile position
  inx
  inx

  ; Move the next tile position into Y
  txy

  ; Restore the next character into X
  plx

endmacro

org $80d000
DrawHUD: {

  ;
  ldy.w #52

  ; Load the subarea in X
  lda !sub_area
  pha
  asl
  adc $01,s
  asl
  asl
  tax

  ; Lookup the area name
  ; lda AreaLookup,x
  ; tax

  %DrawNextChar()
  %DrawNextChar()
  %DrawNextChar()
  %DrawNextChar()
  %DrawNextChar()
  %DrawNextChar()

  pla

  ldy.w #122
  lda !count_crateria
  asl
  tax
  lda WhiteNumbers,x
  tyx
  sta $7ec608,x

  ; *** HIJACKED CODE (DO NOT MODIFY) ***
  ply
  plx
  pla
  pld
  plb
  rti
}

; hex_map:
;dw $0c09,$0c00,$0c01,$0c02,$0c03,$0c04,$0c05,$0c06,$0c07,$0c08,$0ce0,$0ce1,$0ce2,$0ce3,$0ce4,$0ce5
pushtable
table "font_white.tbl",rtl
WhiteNumbers: {
  dw "0123456789ABCDEF"
}
pulltable

pushtable
table "font_yellow.tbl",rtl
AreaNames: {
  dw "CRATER" ; 0
  dw "BRIN  " ; 1
  dw "NORFAI" ; 2
  dw "W SHIP" ; 3
  dw "MARID " ; 4
  dw "TOUR  " ; 5
  dw "CERES " ; 6
  dw "DEBUG " ; 7
  dw "G BRIN" ; 8
  dw "R BRIN" ; 9
  dw "KRAID " ; a
  dw "W MAR " ; b
  dw "E MAR " ; c
  dw "U NORF" ; d
  dw "L NORF" ; e
  dw "CROC  " ; f
}
pulltable

org $90a8ef
rtl

; Hijack HUD loading routine
org $809b3d
jsl $809b44 ; *** HIJACKED CODE (DO NOT MODIFY) ***

; Runs after minimap grid has been drawn
org $90a80a
lda $179c
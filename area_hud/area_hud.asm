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

macro DrawSingleNumber(cursorPos)
  ldy.w <cursorPos>
  and #$000f
  asl
  tax
  lda WhiteNumbers,x
  tyx
  sta $7ec608,x
endmacro

org $80d000
DrawHUD: {

  ; Set the cursor position for drawing
  ldy.w #52

  ; Load the subarea
  lda !SRAM_SubArea

  ; Multiply by 12 and move to X
  pha
  asl
  adc $01,s
  asl
  asl
  tax

  %DrawNextChar()
  %DrawNextChar()
  %DrawNextChar()
  %DrawNextChar()
  %DrawNextChar()
  %DrawNextChar()

  pla

  ; Load the counter for the current sub area
  %LoadCounter()

  ; Draw the energy tank count (lo byte)
  pha
  %DrawSingleNumber(#122)

  ; Draw the item count (hi byte)
  pla
  xba
  %DrawSingleNumber(#126)

  ; *** HIJACKED CODE (DO NOT MODIFY) ***
  ply
  plx
  pla
  pld
  plb
  rti
}

pushtable
table "font_white.tbl",rtl
WhiteNumbers: {
  dw "0123456789ABCDEF"
}
pulltable

pushtable
table "font_yellow.tbl",rtl
AreaNames: {
  dw "CRATER" ; 0 (includes Blue Brinstar)
  dw "G BRIN" ; 1 (Brinstar)
  dw "U NORF" ; 2 (Norfair)
  dw "W SHIP" ; 3
  dw "E MAR " ; 4 (Maridia)
  dw "TOUR  " ; 5
  dw "CERES " ; 6
  dw "DEBUG " ; 7
  dw "R BRIN" ; 8
  dw "KRAID " ; 9
  dw "W MAR " ; a
  dw "U NORF" ; b
  dw "CROC  " ; c
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
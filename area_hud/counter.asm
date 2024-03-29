incsrc "globals.asm"

;
!Counters = $7edcba

;
macro LoadCounter()

  phx

  ; Load the count for the current sub area
  lda !SRAM_SubArea
  asl
  tax
  lda !Counters,x

  plx

endmacro

; HUD Initialization Code
org $809b3d
jsl InitializeCounters

; Beam Collection Code
org $8488eb
jsl DecrementItem

; Equipment Collection Code
org $848912
jsl DecrementItem

; Grapple Collection Code
org $84893a
jsl DecrementItem

; X-Ray Collection Code
org $848961
jsl DecrementItem

; Energy Tank Collection Code
org $84897f
jsl DecrementTank

; *** Custom code ***
org $84f000

InitializeCounters: {

  ;
  pha
  phx
  php

  lda $7e0998   ; load game state in A
  cmp #$001f    ; Check if Game State is Setup New Game (Post Intro)
  bne +
  lda $7ed7e2   ; SRAM copy of $7e09c4 (Max Health of Samus)
  bne +

  lda.w #$00
  tax

  .Loop {
    cpx #$001a
    beq +
    lda $dfff10,x           ;
    sta !Counters,x
    inx
    inx
    bra .Loop
  }

  ;
+ plp
  plx
  pla

  ; HIJACKED CODE (DO NOT MODIFY)
  jsl $809b44

  ;
  rtl
}

DecrementItem: {

  ; HIJACKED CODE (DO NOT MODIFY)
  jsl $858080

  ;
  php
  pha
  phx

  ; Load the count for the current sub area
  lda !SRAM_SubArea
  asl
  tax
  lda !Counters,x

  ; Swap the hi and lo bytes
  xba

  ; Switch to 8-bit mode
  php
  sep #$20

  ; Decrement the item count
  dec

  ; Restore the status register (back to 16-bit mode)
  plp

  ; Swap the hi and lo bytes (again)
  xba

  ; Store the updated value
  sta !Counters,x

  ;
  plx
  pla
  plp
  rtl
}

DecrementTank: {

  ; HIJACKED CODE (DO NOT MODIFY)
  jsl $858080

  ;
  php
  pha
  phx

  ; Load the count for the current sub area
  lda !SRAM_SubArea
  asl
  tax
  lda !Counters,x

  ; Switch to 8-bit mode
  php
  sep #$20

  ; Decrement the tank count
  dec

  ; Restore the status register
  plp 

  ; Store the updated value
  sta !Counters,x

  ;
  plx
  pla
  plp
  rtl
}

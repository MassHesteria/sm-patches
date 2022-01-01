;
!count_crateria = $701700

; !item_count = $7ef702
!tank_count = $7ef704

org $828063
jsl InitializeCounters

; org $84896b
; jsl IncrementTank

org $8ffd00
incsrc "locations.asm"

; *** Custom code ***
org $84f000

InitializeCounters: {
  jsl $809a79

  lda $7e0998   ; load game state in A
  cmp #$001f    ; Check if Game State is Setup New Game (Post Intro)
  bne +
  ; lda $7ed7e2   ; SRAM copy of $7e09c4 (Max Health of Samus)
  ; bne +

  phb : pea $8f00 : plb : plb

  ldy.w #0
  ldx.w #0

  .Loop {
    lda.w CrateriaLocations,x
    inx
    inx

    cmp #$dead
    beq .EndLoop

    phy
    tay
    lda.w $00,y
    ply
    
    cmp #$eed7
    beq .FoundTank

    cmp #$ef7f
    beq .FoundTank

    cmp #$ef2b
    beq .FoundTank

    bra .Loop

    .FoundTank {
      iny
      bra .Loop
    }
  }

  .EndLoop {
    tya
    sta !count_crateria
  }

  plb

  ; lda.w #0
  ; sta !item_count
  ; sta !tank_count
+ rtl
}

macro Increment(type)
  pha
  lda <type>
  inc
  sta <type>
  pla
endmacro

IncrementTank: {
  clc
  adc $0000,y
  %Increment(!tank_count)
  rtl
}

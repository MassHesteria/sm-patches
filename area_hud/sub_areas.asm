; Address where the sub area value is stored
!sub_area = $701600

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
  sta !sub_area

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
      sta !sub_area
    }
  }

+ plx
  rtl
}

SubAreaRooms: {

; 08 = Green Brinstar
; 09 = Red Brinstar
; 0a = Kraid
; 0b = West Maridia
; 0c = East Maridia
; 0d = Upper Norfair
; 0e = Lower Norfair
; 0f = Croc

  .LowerNorfairRooms:
  dw $000d,$b69e,$dead

  .GreenBrinstarRooms:
  dw $0008,$9ad9,$dead

  .TestRooms:
  dw $000a,$92fd,$dead

  .EndOfRooms:
  dw $dead
}
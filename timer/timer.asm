include "../include/snes.asm"

// Minimap drawing routine
seek($90A91B)
rtl

// End of NMI
seek($8095fc)
jml draw_timer

macro draw_nums(define num, define per) {
   define i = $7ec608
   define j = 0
   define val = $0ce0
   
   lda.w #{val}

   evaluate end_addr = $7ec608 + ({num} * 2)
   //print "end_addr=",hex:{end_addr},"\n"

   while {i} < {end_addr} {

      if {j} >= {per} {
         evaluate val = {val} + 1
         evaluate j = 0
         lda.w #{val}
      }

      sta {i}
      //print "i=",hex:{i}," j=",{j}," val=",{val},"\n"

      evaluate i = {i} + 2
      evaluate j = {j} + 1
   }
}

macro print_byte(define value) {
   if {value} < $10 {
      print "0"
   }
   print hex:{value}
}

macro print_word(define fileAddr, define romAddr) {
   define lo = read({fileAddr})
   define hi = read({fileAddr}+1)
   print hex:{romAddr},"="
   print_byte({hi})
   print_byte({lo})
   print "\n"
}

//seek($80988b)
//while pc() < $8098cb {
  //print_word(origin(),pc())
  //ds 2
//}

map ' ',$2c0f
map 'A',$0ce0,26
map '0',$0c09

seek($8098bf)
dw "      "
ds 52

//seek($8098ff)
dw "TIMER "
ds 52
dw " 0000 "
ds 52
dw "      "

map 0,0,256

seek($dfe000)

// A = Value (00-99), Y = Relative HUD tile position for first digit
function draw_time {

  // Divide by 10
  ldx.w #$000a
  sta $004204
  sep #$20
  txa
  sta $004206
  pha; pla; pha; pla; rep #$20

  // Load the remainder in A
  lda $004216

  // Load the tile from the array
  asl
  tax
  lda hex_map,x

  // Write the tile to the screen
  tyx
  sta $7ec60a,x

  // Load the quotient in A
  lda $004214

  // Load the tile from the array
  asl
  tax
  lda hex_map,x

  // Write the tile to the screen
  tyx
  sta $7ec608,x

  rts
}

function draw_timer {

  // *** Frames ***
  lda $7ffc00
  inc
  cmp #60
  bne +
  lda #0; +
  php
  sta $7ffc00
  plp
  bne end

  // *** Seconds (00-59) ***
  lda $7ffc02
  inc
  cmp #60
  bne +
  lda #0; +

  php
  sta $7ffc02

  ldy.w #122
  jsr draw_time

  plp
  bne end

  // *** Minutes (00-99) ***
  lda $7ffc04
  inc
  cmp #100
  bne +
  lda #0; +

  php
  sta $7ffc04

  ldy.w #118
  jsr draw_time

  plp
  bne end

end:
  //print hex:pc(),"\n"
  //draw_nums(96,1)

  // *** HIJACKED CODE (DO NOT MODIFY) ***
  ply
  plx
  pla
  pld
  plb
  rti
}

hex_map:
dw $0c09,$0c00,$0c01,$0c02,$0c03,$0c04,$0c05,$0c06,$0c07,$0c08,$0ce0,$0ce1,$0ce2,$0ce3,$0ce4,$0ce5

// Minimap update during HUD loading
seek($90A8EF)
lda.w #$0000
sta $7ffc00
sta $7ffc02
sta $7ffc04
sta $7ffc06
//stz $7ffc00
rtl

// Runs after minimap grid has been drawn
seek($90A80A)
lda $179c
architecture wdc65816

macro seek(variable offset) {
  origin ((offset & $7F0000) >> 1) | (offset & $7FFF)
  base offset
}

macro check(define name, variable addr) {
   if pc() != addr {
      print {name}, " INCORRECT!\n"
      print "  is: ",hex:pc(),"\n"
      print "  should be: ",hex:addr,"\n"
   }
}

macro insert_nop(define num) {
   define i = {num}
   while {i} > 0 {
      nop
      evaluate i = {i} - 1
   }
}

macro warnpc(variable addr) {
   if (pc() > addr) {
      error "warnpc! exceeded: ",hex:addr
   }
}
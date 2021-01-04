macro load_font(define base_addr) {
   map 'A',{base_addr},26
   map '.',{base_addr}+$1A
   map ',',{base_addr}+$1B
   map '_',{base_addr}+$1C
   map '\'',{base_addr}+$1D
   map ':',{base_addr}+$1E
   map '!',{base_addr}+$1F
   map ' ',$007F
}

macro yellow() {
   load_font($0400)
}

macro cyan() {
   load_font($0800)
}

macro green() {
   load_font($0C00)
}

macro pink() {
   load_font($1000)
}

macro blue() {
   load_font($1400)
}

macro orange() {
   load_font($1800)
}

macro purple() {
   load_font($1C00)
}

macro big() {
   map ' ',$007F
   map '&',$007B
   map '~',$007C
   map '!',$007D
   map '|',$007E
   map 'A',$0020,16
   map 'a',$0030,16
   map 'Q',$0040,10
   map '\'',$004a
   map '^',$004b
   map '_',$004f
   map 'q',$0050,10
   map '.',$005a
   map '0',$0060,10
   map '%',$006a
   map '}',$0070
   map '!',$0071
   map '@',$0072
   map '#',$0073
   map '$',$0074
   map '%',$0075
   map '&',$0076
   map '/',$0077
   map '(',$0078
   map ')',$0079
   map '>',$007a
   map ':',$001e
}

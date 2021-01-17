include "../include/snes.asm"

seek($82eeda)
db $1f

seek($828067)
jsl introskip

seek($80ff00)
function introskip {
lda $7e0998
cmp.w #$001f
bne ret

// Check if samus saved energy is 00, if it is, run startup code
lda $7ed7e2
bne ret
    
// Set construction zone and red tower elevator doors to blue
//lda $7ed8b6       // 4
//ora.w #$0004      // 3
//sta $7ed8b6       // 4

// 
//lda $7ed8b2       // 4
//ora.w #$0001      // 3
//sta $7ed8b2       // 4

// Call the save code to create a new file
//lda $7e0952       // 4
//jsl $818000       // 4

// Set End of Game (Timebomb) flag
//lda #$000e         // 3
//jsl $80818e        // 4
//lda $7ed820,x      // 4
//ora $05e7          // 3
//sta $7ed820,x      // 4

lda.w #199
sta $7e09c2
sta $7e09c4

ret:
lda #$0000
rtl
}

warnpc($80ffC0)
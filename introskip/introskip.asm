include "../include/snes.asm"

// Override cinematic function used at game start
//seek($82eedf)
//lda #$a395    // Intro cinematic
//lda #$c11b    // Ceres explodes / landing on Zebes
//lda #$c100    // Start on Ceres

// Skip intro and start on Zebes
seek($82eeda)
db $1f

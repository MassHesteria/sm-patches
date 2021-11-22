include "snes.asm"

define button_B = #$8000
define button_Y = #$4000
define button_Select = #$2000
define button_Start = #$1000
define button_A = #$0080
define button_X = #$0040
define button_L = #$0020
define button_R = #$0010

define Shoot = $7e09b2
define Jump = $7e09b4
define Dash = $7e09b6
define ItemCancel = $7e09b8
define ItemSelect = $7e09ba
define AimDown = $7e09bc
define AimUp = $7e09be

macro bind(define action, define button) {
  lda {button}
  sta {action}
}

macro setup_controller() {

  // Save the status register state
  php

  // Enable 16-bit mode
  rep #$20

  // Setup the controller scheme
  bind({Shoot},{button_X})
  bind({AimUp},{button_R})
  bind({AimDown},{button_L})
  bind({ItemSelect},{button_A})
  bind({Jump},{button_B})
  bind({Dash},{button_Y})
  bind({ItemCancel},{button_Select})

  // Restore the status register state
  plp
}
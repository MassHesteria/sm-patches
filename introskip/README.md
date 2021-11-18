__Notes__

    $7e0998: Game state
    {
        0: Reset/start
        1: Opening. Cinematic
        2: Game options menu
        3: Nothing (RTS)
        4: Save game menus
        5: Loading game map view
        6: Loading game data
        7: Setting game up after loading the game
        8: Main gameplay
        9: Hit a door block
        Ah: Loading next room
        Bh: Loading next room
        Ch: Pausing, normal gameplay but darkening
        Dh: Pausing, loading pause screen
        Eh: Paused, loading pause screen
        Fh: Paused, map and item screens
        10h: Unpausing, loading normal gameplay
        11h: Unpausing, loading normal gameplay
        12h: Unpausing, normal gameplay but brightening
        13h: Samus ran out of health
        14h: Samus ran out of health, black out surroundings
        15h: Samus ran out of health, black out surroundings
        16h: Samus ran out of health, starting death animation
        17h: Samus ran out of health, flashing
        18h: Samus ran out of health, explosion
        19h: Samus ran out of health, black out (also cut to by time up death)
        1Ah: Game over screen
        1Bh: Reserve tanks auto
        1Ch: Unused. Does JMP ($0DEA) ($0DEA is never set to a pointer)
        1Dh: Debug game over menu (end/continue)
        1Eh: Intro. Cinematic. Set up entirely new game with cutscenes
        1Fh: Set up new game. Post-intro
        20h: Made it to Ceres elevator
        21h: Blackout from Ceres
        22h: Ceres goes boom, Samus goes to Zebes. Cinematic
        23h: Time up
        24h: Whiting out from time up
        25h: Ceres goes boom with Samus. Cinematic
        26h: Samus escapes from Zebes. Transition from main gameplay to ending and credits
        27h: Ending and credits. Cinematic
        28h: Transition to demo
        29h: Transition to demo
        2Ah: Playing demo
        2Bh: Transition from demo
        2Ch: Transition from demo
    }
    
    $82EBC1 dw EBDB, ; 0:  
               EC11, ; 1: Loading options screen  
               ECE4, ; 2: Fading in options screen  
               ED42, ; 3: Options screen  
               EEB4, ; 4: Start game  
               EF18, ; 5: Dissolve out screen  
               EFDB, ; 6: Dissolve in screen  
               F159, ; 7: Controller settings  
               F024, ; 8: Special settings  
               F271, ; 9: Scroll controller settings down  
               F285, ; Ah: Scroll controller settings up  
               EE6A, ; Bh: Transition back to file selection  
               EE92  ; Ch: Fading out options screen to start game

$82EBAD = calling function

$82EEB4 = called from the Start Menu every time the game starts (intro, ceres, zebes, saved game)
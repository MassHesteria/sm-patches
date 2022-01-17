This patch disables rendering of the minimap in Super Metroid and replaces it with a HUD showing the current area, the number of major items in that area, and the number of energy tanks in that area.  
 
The areas shown are more specific than the default areas within the game. For example, the HUD will display Upper Norfair and Lower Norfair instead of just simply showing Norfair. These are referred to as Subareas through the patch code. The subareas used by this patch match those used by the Varia Randomizer for things like Area Randomization. The goal is to standardize to make it easier on players.  

Additionally, the idea of showing the number of major items within each zone also came from the Varia Randomizer. This is used in their Full Randomization with Countdown mode. The main differences between this patch and what is already provided in these Varia seeds is that the counts are shown in place of the minimap and that the energy tank count is also shown.  

Using this patch requires that the counts for each zone be written to the ROM at $dfff10 with two bytes per area. Byte 1 = Energy Tank Count, Byte 2 = Major Item Count. The order of the areas is:  

0 = Crateria (includes Blue Brinstar)  
1 = Green Brinstar (includes Pink Brinstar)  
2 = Upper Norfair  
3 = Wrecked Ship  
4 = East Maridia  
5 = Tourian  
6 = Ceres  
7 = Debug  
8 = Red Brinstar  
9 = Kraid  
A = West Maridia  
B = Lower Norfair  
C = Crocomire
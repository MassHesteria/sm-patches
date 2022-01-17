@echo off

set VANILLA=..\tools\SuperMetroid.sfc

echo Copying Vanilla ROM
copy ..\tools\SuperMetroid.sfc area_hud.sfc

echo Applying Primary Patch
..\tools\win\asar.exe --fix-checksum=off area_hud.asm area_hud.sfc

echo Generating IPS File
..\tools\win\flips.exe --create --ips %VANILLA% area_hud.sfc area_hud.ips

@REM echo Patching Rando ROM
@REM copy DASH_v10_SF_40400.sfc rando_with_HUD.sfc
@REM ..\tools\win\bip.exe -n %VANILLA% area_hud.ips rando_with_HUD.sfc

echo Applying Testing Patch
..\tools\win\asar.exe test_area_hud.asm area_hud.sfc
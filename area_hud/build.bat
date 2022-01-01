@echo off

echo Copying Vanilla ROM
copy ..\tools\SuperMetroid.sfc area_hud.sfc

echo Applying Primary Patch
..\tools\win\asar.exe area_hud.asm area_hud.sfc

echo Applying Testing Patch
..\tools\win\asar.exe test_area_hud.asm area_hud.sfc
echo off
set GAME_FOLDER=C:\Users\Jezuz\Desktop\BlackOps2
set OAT_BASE=C:\Users\Jezuz\Desktop\OpenAssetTools
set MOD_BASE=%cd%
set MOD_NAME=mp_player_model_pack
"%OAT_BASE%\Linker.exe" ^
-v ^
--load "%GAME_FOLDER%\zone\all\zm_tomb.ff" ^
--load "%GAME_FOLDER%\zone\all\so_zencounter_zm_prison.ff" ^
--load "%GAME_FOLDER%\zone\all\so_zclassic_zm_prison.ff" ^
--load "%GAME_FOLDER%\zone\all\so_zsurvival_zm_transit.ff" ^
--load "%GAME_FOLDER%\zone\all\so_zclassic_zm_transit.ff" ^
--base-folder "%OAT_BASE%" ^
--asset-search-path "%MOD_BASE%" ^
--source-search-path "%MOD_BASE%\zone_source" ^
--output-folder "%MOD_BASE%\zone" mod

set err=%ERRORLEVEL%

if %err% EQU 0 (
XCOPY "%MOD_BASE%\zone\mod.ff" "%LOCALAPPDATA%\Plutonium-staging\storage\t6\mods\%MOD_NAME%\mod.ff" /Y
) ELSE (
COLOR C
echo FAIL!
)
pause
echo off
set GAME_FOLDER=C:\Users\Jezuz\Desktop\BlackOps2
set OAT_BASE=C:\Users\Jezuz\Desktop\OpenAssetTools
set MOD_BASE=%cd%

"%OAT_BASE%\Linker.exe" ^
-v ^
--load "%GAME_FOLDER%\zone\all\zm_tomb.ff" ^
--load "%GAME_FOLDER%\zone\all\so_zsurvival_zm_transit.ff" ^
--load "%GAME_FOLDER%\zone\all\so_zclassic_zm_transit.ff" ^
--load "%GAME_FOLDER%\zone\all\zm_prison.ff" ^
--base-folder "%OAT_BASE%" ^
--asset-search-path "%MOD_BASE%" ^
--source-search-path "%MOD_BASE%\zone_source" ^
--output-folder "%MOD_BASE%\zone" mod_2

pause
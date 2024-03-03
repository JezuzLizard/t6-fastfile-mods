echo off
set GAME_FOLDER=C:\Users\Jezuz\Desktop\BlackOps2
set OAT_BASE=C:\Users\Jezuz\Desktop\OpenAssetTools
set MOD_BASE=%cd%

"%OAT_BASE%\Linker.exe" ^
-v ^
--load "%GAME_FOLDER%\zone\all\zm_highrise.ff" ^
--load "%GAME_FOLDER%\zone\all\zm_buried.ff" ^
--load "%GAME_FOLDER%\zone\all\so_zclassic_zm_buried.ff" ^
--load "%GAME_FOLDER%\zone\all\zm_nuked.ff" ^
--base-folder "%OAT_BASE%" ^
--asset-search-path "%MOD_BASE%" ^
--source-search-path "%MOD_BASE%\zone_source" ^
--output-folder "%MOD_BASE%\zone" mod_1

pause
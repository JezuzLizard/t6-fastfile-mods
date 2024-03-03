@echo off
setlocal enabledelayedexpansion
set MOD_BASE=%cd%

set "executable_path=C:\Users\Jezuz\Desktop\OpenAssetTools\iwi_dds_fast_converter.exe"
set "directory_path=%MOD_BASE%\images"

for %%F in ("%directory_path%\*") do (
    if /I "%%~xF"==".dds" (
        echo Processing file: "%%~dpnxF"
        echo 1 | "%executable_path%" "%%~dpnxF"
    )
)

endlocal
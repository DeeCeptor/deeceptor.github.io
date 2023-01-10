@echo off

:: COMMENT, get all paths for subfolders
>path_to_all_voicelines.txt (
  forfiles /s /m *.ogg /c "cmd /c echo @path"
)

echo Got paths, now stripping

:: COMMENT, strip out unneeded absolute path to reduce file size
SET mypath=%~dp0
echo %mypath%

call:DoReplace "%mypath%" "" path_to_all_voicelines.txt path_to_all_voicelines.txt
exit /b

:DoReplace
echo ^(Get-Content "%3"^) ^| ForEach-Object { $_.replace(%1,%2) } ^| Set-Content %4>Rep.ps1
Powershell.exe -executionpolicy ByPass -File Rep.ps1
if exist Rep.ps1 del Rep.ps1

echo Finished all

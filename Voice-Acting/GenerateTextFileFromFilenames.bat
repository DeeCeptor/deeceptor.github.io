@echo off
>path_to_all_voicelines.txt (
  forfiles /s /m *.mp3 /c "cmd /c echo @path"
)
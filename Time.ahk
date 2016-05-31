; This script uses CMDTIME3 to synchronize the computer's date&time
; via Internet Time Servers.
; Get CMDTIME from: www.softshape.com/download
; The script writes the output of CMDTIME3 to a file CMDTIME.TXT
; in the machine's TEMP directory.

#SingleInstance

; Full name and path to cmdtime3 -> CUSTOMIZE AS NEEDED
cmdtimepath=cmdtime3.exe ; assume in same directory as this script by default

Sleep, 5000 ; optional 10 sec sleep - e.g. wait until after computer is done booting up


; Check if CMDTIME3.EXE exists in the given path
Ifnotexist, %cmdtimepath%
  {
  Msgbox, Unable to find CMDTIME in:`n%A_ScriptDir%
  Exitapp
  }

Loop, 20 ; arbitrary maximum to prevent infinite loop if some unforseen problem occurs
  {
  ; Delete previous CDMTIME.TXT temp file
  FileDelete, %temp%\CMDTIME3_temp.txt

  ; Run the CMDTIME3 command -> CUSTOMIZE SERVER AS NEEDED
  ; see http://support.microsoft.com/default.aspx?scid=kb;EN-US;q262680#top for other servers too
  RunWait, cmd /c "%cmdtimepath%" /M:480 /Q SYNC>time.nist.gov>%temp%\CMDTIME.txt,,hide

  ; Read the CMDTIME.TXT temp file
  FileRead, cmdtime_result, %temp%\CMDTIME.txt

  ; If the file does not contain "Error" nor "Cannot", then everything was OK
  If cmdtime_result not contains Error,Cannot
    Break

  ; Otherwise, it probably means that the computer is still starting up...
  Sleep, 10000
  }

Time_Is_Set_To__Start_Pos := InStr(cmdtime_result, "Time is set to")
Time_Is_Set_To__End_Pos := InStr(cmdtime_result, " succesfully", false, Time_Is_Set_To__Start_Pos)
Time_Is_Set_To__Count := Time_Is_Set_To__End_Pos - Time_Is_Set_To__Start_Pos
StringMid, Time_Is_Set_To, cmdtime_result, %Time_Is_Set_To__Start_Pos%, Time_Is_Set_To__Count
StringReplace, Time_Is_Set_To, Time_Is_Set_To,Time is set to ,Time set to  :
StringReplace, Time_Is_Set_To, Time_Is_Set_To,Successfully,

Inaccuracy__Start_Pos := InStr(cmdtime_result, "Inaccuracy     : ")
Inaccuracy__End_Pos := InStr(cmdtime_result, "`n", false, Inaccuracy__Start_Pos)
Inaccuracy__Count := Inaccuracy__End_Pos - Inaccuracy__Start_Pos
StringMid, Inaccuracy, cmdtime_result, %Inaccuracy__Start_Pos%, Inaccuracy__Count
StringReplace, Inaccuracy, Inaccuracy,Inaccuracy,Adjusted

TrayTip, Time:, %Inaccuracy%`n%Time_Is_Set_To%
Sleep, 10000 ; give a chance to read traytip before exiting
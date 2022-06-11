#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

sleepSpreadSheetTraversal := 50
widthOfSpreadSheet := 8

^+!`::
WinWait ahk_exe chrome.exe
WinActivate
Sleep sleepSpreadSheetTraversal 
Loop, %widthOfSpreadSheet%
  {
    Send, {Left}
    Sleep sleepSpreadSheetTraversal 
  }

Sleep 300
Send ^c
Sleep 50

WinWait FormCallAssistance ahk_exe UCS_Client.exe
WinActivate
Sleep sleepSpreadSheetTraversal 
Send, 1
Sleep sleepSpreadSheetTraversal 
Send, 0
Sleep sleepSpreadSheetTraversal 
Send, ^v
Sleep sleepSpreadSheetTraversal 
Send, {enter}
Sleep sleepSpreadSheetTraversal 
WinWait ahk_exe chrome.exe
WinActivate
Sleep 200
Loop % widthOfSpreadSheet-1
  {
    Send, {Right}
    Sleep sleepSpreadSheetTraversal 
  }
Sleep 300
Send {Enter}
Sleep 50
Send, {Space}
Sleep 50
;Type the date
FormatTime, TimeString,, h:mm
Send, %TimeString%
Sleep 50
Send {enter}
Send {up}
Send {right}


;Shortcut to be used when a call has gone to answer phone
^]::
Send, {Enter}
Send, AP
Send, {Enter}
Sleep 10
Send {LCtrl Down}{LShift Down}{LAlt Down}~{LAlt Up}{LCtrl Up}{LShift Up}


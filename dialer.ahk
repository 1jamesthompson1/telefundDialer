#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#singleInstance Force ; Skips the prompt of starting a new instance

sleepSpreadSheetTraversal := 50
widthOfSpreadSheet = %2%
callerName = %1%

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

Loop % widthOfSpreadSheet-2
  {
    Send, {Right}
    Sleep sleepSpreadSheetTraversal 
  }
Sleep sleepSpreadSheetTraversal 
Send %callerName%
Sleep sleepSpreadSheetTraversal 
Send {Enter}
Sleep sleepSpreadSheetTraversal 
Send {Right}
Sleep sleepSpreadSheetTraversal 
Send {Up}

Sleep sleepSpreadSheetTraversal 
Send {Enter}
Sleep sleepSpreadSheetTraversal 
Send, {Space}
Sleep sleepSpreadSheetTraversal 
;Type the date
FormatTime, TimeString,, dd/MM/yy h:mm
Send, %TimeString%
Sleep sleepSpreadSheetTraversal 
Send {enter}
Send {up}
Send {right}
return


;Shortcut to be used when a call has gone to answer phone
^]::
Send, {Enter}
Send, AP
Send, {Enter}
Sleep 10
Send {LCtrl Down}{LShift Down}{LAlt Down}~{LAlt Up}{LCtrl Up}{LShift Up}


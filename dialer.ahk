#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#singleInstance Force ; Skips the prompt of starting a new instance

loop 
{
  if !FileExist("config.txt")
  {
    InputBox, userName, Name, What is your first name?
    FileAppend, %userName%, config.txt
    FileAppend, `n1, config.txt
  }
  else 
  {
    InputBox, widthOfSpreadSheet, Width, What is the width
    FileReadLine, callerName, config.txt, 1
    FileReadLine, preNumber, config.txt, 2
    break
  }
}

sleepSpreadSheetTraversal := 100

^+!`::
WinWait ahk_exe chrome.exe
WinActivate
Sleep sleepSpreadSheetTraversal 
Loop, %widthOfSpreadSheet%
  {
    Send, {Left}
    Sleep sleepSpreadSheetTraversal 
  }

Sleep sleepSpreadSheetTraversal 
Send ^c
Sleep sleepSpreadSheetTraversal 

WinWait FormCallAssistance ahk_exe UCS_Client.exe
WinActivate
Sleep sleepSpreadSheetTraversal 
Send, %preNUmber%
Sleep sleepSpreadSheetTraversal 
Send, ^v
Sleep sleepSpreadSheetTraversal 
Send, {enter}
Sleep sleepSpreadSheetTraversal 
WinWait ahk_exe chrome.exe
WinActivate
Sleep sleepSpreadSheetTraversal 

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
Sleep sleepSpreadSheetTraversal  
Send {up}
Sleep sleepSpreadSheetTraversal 
Send {right}
return


;Shortcut to be used when a call has gone to answer phone
^]::
Send, {Enter}
Send, AP
Send, {Enter}
Sleep Sleep sleepSpreadSheetTraversal 
Send {LCtrl Down}{LShift Down}{LAlt Down}~{LAlt Up}{LCtrl Up}{LShift Up}


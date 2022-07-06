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

Rctrl::F14

;Default shortcut for dial
F14::
Gosub dial
return

;Shortcut to be used when a call has gone to answer phone
^]::
Send, {Enter}
Send, AP
Send, {Enter}
Sleep Sleep sleepSpreadSheetTraversal 
Gosub, dial
return

^[::
Gosub, printNameAndDateTime
return


dial:
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
	firstCharacter = Substr(%clipboard%,1,1)
	if (firstCharacter != "0")
	{	
 		Send, 0
	}
	Sleep sleepSpreadSheetTraversal
	Sleep sleepSpreadSheetTraversal 
	Send, %clipboard%
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
	Gosub, printNameAndDateTime
	return

printNameAndDateTime:
      ;Name
	Sleep sleepSpreadSheetTraversal 
	Send, %callerName%
	Sleep sleepSpreadSheetTraversal 
	Send, {Enter}
	Sleep sleepSpreadSheetTraversal
	Send, {Right}
	Sleep sleepSpreadSheetTraversal
	Send, {Up}
	;DateTime
	Sleep sleepSpreadSheetTraversal
	FormatTime, TimeString,, dd/MM/yy h:mm
	Send, %TimeString%
	Sleep sleepSpreadSheetTraversal 
	Send, {Enter}
	Sleep sleepSpreadSheetTraversal
	Send, {Right}
	Sleep sleepSpreadSheetTraversal
	Send, {Up}
	return

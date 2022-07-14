#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#singleInstance Force ; Skips the prompt of starting a new instance

Menu, Tray, Icon, % A_WinDir "\system32\ddores.dll", 7

programName := "Dialer v1.0.2"
sleepSpreadSheetTraversal := 100
widthOfSpreadSheet := 0


;----Intro loop that will either retrive name and width or just width---------
loop
{
  if !FileExist("config.ini")
  {
    InputBox, userName, %programName%, What is your first name?
    if ErrorLevel
      ExitApp
    IniWrite, %userName%, config.ini, Settings, userName
    IniWrite, 1, config.ini, Settings, preNumber
    IniWrite, #, config.ini, Settings, postNumber
    IniWrite, chrome.exe, config.ini, Settings, browser
  }
  else
  {
    InputBox, widthOfSpreadSheet, %programName%, What is the width
    if ErrorLevel
      ExitApp
    IniRead, callerName, config.ini, Settings, userName
    IniRead, preNumber, config.ini, Settings, preNumber
    IniRead, postNumber, config.ini, Settings, postNumber
    IniRead, browser, config.ini, Settings, browser
    break
  }
}

;--------Subroutine and function defintions--------------
/*
* This will focus on the browser then move across width number of cells then copy and paste it into UCS.
* With or without an additional leading zero.
*/
dial(width)
{
  global
	;Get right window active
	WinWait ahk_exe %browser%
	WinActivate

	;Move to the phoneNumber column
	Sleep sleepSpreadSheetTraversal
	Loop %width%
	  {
	    Send, {Left}
	    Sleep sleepSpreadSheetTraversal
	  }

	Sleep sleepSpreadSheetTraversal
	Send ^c
	Sleep sleepSpreadSheetTraversal

	;Paste number in UCS and dial
	WinWait FormCallAssistance ahk_exe UCS_Client.exe
	WinActivate

	Sleep sleepSpreadSheetTraversal
	Send, %preNumber%
	Sleep sleepSpreadSheetTraversal
	firstCharacter := Substr(clipboard,1,1)
	if (%firstCharacter% != "0")
	{
 		Send, 0
	}
	Sleep sleepSpreadSheetTraversal
	Send, %clipboard%
	Sleep sleepSpreadSheetTraversal
	Send, {%postNumber%}
	Sleep sleepSpreadSheetTraversal
	Send, {enter}
	Sleep sleepSpreadSheetTraversal

	;Move back to the caller column and print name and Date
	WinWait ahk_exe %browser%
	WinActivate
	Sleep sleepSpreadSheetTraversal

	Loop % width - 2
	  {
 	   Send, {Right}
 	   Sleep sleepSpreadSheetTraversal
	  }
	printNameAndDateTime()

	return
}
/*
* Simply print name and date in cells side by side one another.
*/

printNameAndDateTime()
{
  global
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
}
;-------Shortcut definitions---------------

;Bound the Rctrl to F14 so that it can be more easily work with and prevent unforeseen effects in apps.
Rctrl::F14

;Default shortcut for dial
F14::
dial(widthOfSpreadSheet)
return

;Shortcut to be used when a call has gone to answer phone
^]::
Send, {Enter}
Send, AP
Send, {Enter}
Sleep Sleep sleepSpreadSheetTraversal
dial(widthOfSpreadSheet)
return

;Print name and DateTime
^[::
printNameAndDateTime()
return

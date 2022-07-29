#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#singleInstance Force ; Skips the prompt of starting a new instance

Menu, Tray, Icon, % A_WinDir "\system32\ddores.dll", 7

programName := "Dialer v1.1.1"
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
	Iniwrite, 100, config.ini, Settings, sleepTime
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
	IniRead, sleepTime, config.ini, Settings, sleepTime
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
	;-----Get right window active------
	WinWait ahk_exe %browser%
	WinActivate

	;----Move to the phoneNumber column-----

  ;Check to see if it is ap or on the wrong row.
  sleep()
  Send, ^c
  sleep()
  clipboard := StrReplace(clipboard, "`r`n")
  if (clipboard != "") { ;If cell is not empty
    Send, {Down}
  } else { ;If cell is empty
    Send, {Left}
    sleep()
    Send, ^c
    sleep()
    clipboard := StrReplace(clipboard, "`r`n")
    Send, {Right}
    if (clipboard != "") { ;If cell is not empty
      sleep()
      Send, AP
      sleep()
      Send, {Enter}
    }
  }
	Loop %width%
	  {
	    Send, {Left}
	    sleep()
	  }

	sleep()
	Send ^c
	sleep()

	;----Paste number in UCS and dial-----
	WinWait FormCallAssistance ahk_exe UCS_Client.exe
	WinActivate

	sleep()
	Send, %preNumber%
	sleep()
	firstCharacter := Substr(clipboard,1,1)
	if (%firstCharacter% != "0")
	{
 		Send, 0
	}
	sleep()
	Send, %clipboard%
	sleep()
	Send, {%postNumber%}
	sleep()
	Send, {enter}
	sleep()

	;----Move back to the caller column and print name and Date------
	WinWait ahk_exe %browser%
	WinActivate
	sleep()

	Loop % width - 2
	  {
 	   Send, {Right}
 	   sleep()
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
	sleep()
	Send, %callerName%
	sleep()
	Send, {Tab}
	;DateTime
	sleep()
	FormatTime, TimeString,, dd/MM/yy h:mm
	Send, %TimeString%
	sleep()
	Send, {Tab}
	return
}

sleep() {
  global
  Sleep, sleepTime
}
;-------Shortcut definitions---------------

;Bound the Rctrl to F14 so that it can be more easily work with and prevent unforeseen effects in apps.
Rctrl::F14

;Default shortcut for dial
F14::
dial(widthOfSpreadSheet)
return

;Left modifer to get hte number to the left
~Left & Rctrl::
Send {Right}
width := widthOfSpreadsheet + 1
dial(width)
return
;Right modifier
~Right & Rctrl::
Send {Left}
width := widthOfSpreadsheet - 1
dial(width)
return

;Print name and DateTime
+F14::
printNameAndDateTime()
return

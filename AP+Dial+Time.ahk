#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^]::
Send, {Enter}
Send, AP
Send, {Enter}
Sleep 10
Send {LCtrl Down}{LShift Down}{LAlt Down}~{LAlt Up}{LCtrl Up}{LShift Up}
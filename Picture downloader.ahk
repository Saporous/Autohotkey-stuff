;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;^ is Ctrl key
;# is window
;+ is Shift
;! is Alt key

Download(count)
{
Loop %count%
{
Click 400, 400 		;enlarge the picture
Sleep 100
Click right 390, 390 	;right click to bring up menu
Sleep 200
Click 400, 400 		;click "download" picture
Sleep 1000
Send {Enter}
Sleep 200
Send ^w			;close tab
Sleep 1000
}
Return
}

;loop once
!1::
Click 400, 400 		;enlarge the picture
Sleep 100
Click right 390, 390 	;right click to bring up menu
Sleep 100
Click 400, 400 		;click "download" picture
Sleep 250
Send {Enter}
Sleep 200
Send ^w			;close tab
Sleep 200
Return

!2::
InputBox, x, Loop Amount, Enter amount of loops,  ,200,120
Download(x)
Return


;in case anything goes wrong...
F12::
Sleep 20000
Return

;In case something BAD happens
^q::Exit

;when editing, use this to reload
^!r::Reload
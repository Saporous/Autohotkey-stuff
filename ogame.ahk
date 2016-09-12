#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;RELOAD
!1::
Reload
Return

;loop once
!2::
Click 1292, 160 	;Click "Login"
Sleep 500
Click 1250, 225 		;Click pulldown menu
Sleep 500
Click 1190, 365		;click Hydra
Sleep 500
Click 1176, 273		;click Username
Sleep 500
Send 
Sleep 500
Send {Tab}		;click password
Send 
Sleep 500
Click 1250, 360		;click login
Return

;Click 2x with delay
!Mbutton::
Click right
Sleep 100
Click right
Sleep 100
Click right
Sleep 100
Click right
Sleep 100
Click right
Sleep 100
Click right
Sleep 100
Return

^Mbutton::
Click
Sleep 100
Click
Sleep 100
Click
Sleep 100
Click
Sleep 100
Click
Sleep 100
Return

;spamming "A"
!3:: 
Send A
Send {Enter}
Send A
Sleep 30
Send {Enter}
Send A
Sleep 30
Send {Enter}
Send A
Sleep 30
Send {Enter}
Send A
Sleep 30
Send {Enter}
Send A
Sleep 30
Send {Enter}
Send A
Sleep 30
Send {Enter}
Send A
Sleep 30
Send {Enter}
Send A
Sleep 30
Send {Enter}
Send A
Sleep 30
Send {Enter}
Return

!4::
While GetKeyState("4")
{
	Send A
	Sleep 50
	Send {Enter}
}
Return

CapsLock::
Send ^2
Return

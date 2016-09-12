#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;RELOAD
^1::Reload

ESC::ExitApp

^2::

SetMouseDelay, 100
counter2 := 0
While counter2 < 1500
{
	counter := 0
	
	While counter < 15
	{
		Click 400, 375
		SendEvent {Click 600, 375}
		SendEvent {Click 800, 375}
		;MouseMove, 300, 0, 100, R
		Sleep 500
		counter := counter + 1
	}
	Click 485, 815
	Sleep 100
	Click 890, 775
	Sleep 100
}
counter2 := counter2 + 1
Return
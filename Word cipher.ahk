#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Open up a text program, activate the script, then type the message into a 
; messagebox, which will then be typed into the chosen text editing program

;The program will then convert everything within it using a ROT-13 cipher
; including a replacement of spaces with "$" signs, then using a scrambling 
; algorithm that swaps every other pair of two characters

;Step 1, utilizing the messagebox that outputs everything typed into it into a word
; editing program
Inputbox, input, Enter text, Enter something
temp := input

;Open the text editing program, then output the stuff the user inputted
Run Notepad

;Write to Notepad the string that the user entered
;Send %input%

;Alter the input to include the cipher

;Flip every other two letters
while StrLen(temp) > 1
{
	a := SubStr(temp, 1, 1)
	if( StrLen(temp) > 1)
	{
		b := SubStr(temp, 2, 1)
	}
	Send %b%%a%
	temp := SubStr(temp, 3)
}

if (StrLen(input) > 3)
SendInput {Enter}The input is longer than 3 letters

;for( int i = 0; i < temp.size(); i+=2)

;Quit the program
Escape::
Sleep, 20000
Return
;Reload the script
^r::Reload
Return
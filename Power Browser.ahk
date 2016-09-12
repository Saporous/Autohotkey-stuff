; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

;#z::Run www.autohotkey.com

;^!n::
;IfWinExist Untitled - Notepad
;	WinActivate
;else
;	Run Notepad
;return

SetKetDelay [50, 100]

F12::
Suspend
return

F11::
Reload
return

Alt::
Click Middle
return

r::
Send ^{PgDn}
return

e::
Send ^{PgUp}
return

w::
Send ^{w}
return

q::
Send ^+{t}
return

d::
Send {PgUp}
return

f::
Send {PgDn}
return

5::
Send ^{r}
return

2::
Send ^{t}
return

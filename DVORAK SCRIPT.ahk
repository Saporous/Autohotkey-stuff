#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Convert Dvorak keystrokes to their correct letters on a QWERTY-configured OS
;Script instructions:
;Capslock toggles QWERTY or Dvorak mode
;Shift-Caps works like regular Caps
;Ctrl-Alt-Esc quits this script
;Made by BinarySplit <binarysplit at gmail>

#SingleInstance force
#MaxHotkeysPerInterval 100
#UseHook
Process, Priority,, Realtime
SetKeyDelay -1 

Capslock::Suspend, Toggle
^Capslock::Capslock

-::[
=::]
q::'
w::,
e::.
r::p
t::y
y::f
u::g
i::c
o::r
p::l
[::/
]::=
a::a
s::o
d::e
f::u
g::i
h::d
j::h
k::t
l::n
`;::s
'::-
z::`;
x::q
c::j
v::k
b::x
n::b
m::m
,::w
.::v
/::z
Enter::Enter
;Space::Space	;Uncomment in Vista because AHK can lag, which can make letters and spaces go out of sync if AHK doesn't handle space.

^+Esc::
Run, "C:\Windows\System32\taskmgr.exe"
Process, Priority, taskmgr.exe, Realtime
Return

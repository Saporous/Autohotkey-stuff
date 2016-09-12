`::
While true
{
	BlockInput, Mousemove  ;Block mousemovement
	Click down right
	
	GetKeyState, state, Control
	if state = D
	{
		BlockInput, MousemoveOff ;Enable mousemovement
		Click up right
		Return
	}
}

~::
While true
{
	BlockInput, Mousemove  ;Block mousemovement
	Click down left
	
	GetKeyState, state, Control
	if state = D
	{
		BlockInput, MousemoveOff ;Enable mousemovement
		Click up left
		Return
	}
}

-::
While true
{
	BlockInput, Mousemove  	;Block mousemovement
	SendRaw, 2		;Select block
	Click down right	;Place block twice
	Sleep 500	
	Click up right	
	SendRaw, R		;Refill block from inventory
	SendRaw, 1		;Select hammer
	Click down left		;Break both blocks
	Sleep 2500
	Click up right
	
	GetKeyState, state, Control
	if state = D
	{
		BlockInput, MousemoveOff ;Enable mousemovement
		Click up left
		Click up right
		Return
	}
}

=::Reload

F12::Suspend
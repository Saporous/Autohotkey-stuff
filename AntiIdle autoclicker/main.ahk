#Include %A_ScriptDir%\functions.ahk
#SingleInstance force
Process,Priority,,Realtime

;; User edited values - you should read this and edit if necessary
MyBrowser := "Chrome"

;; List of known Images
img_redButton := A_WorkingDir . "\images\redButton.png"
img_orangeButton := A_WorkingDir . "\images\orangeButton.png"
img_orange2 := A_WorkingDir . "\images\orange2.png"
img_loadBattery := A_WorkingDir . "\images\loadBattery.png"
img_treeHarvest := A_WorkingDir . "\images\treeHarvest.png"
img_damagedButton := A_WorkingDir . "\images\buttonAboutToCrash.png"
img_repairButton := A_WorkingDir . "\images\repairButton.png"
img_zeroTrees := A_WorkingDir . "\images\noTrees.png"
img_worldButtonIndicator := A_WorkingDir . "\images\worldButtonIndicator.png"
img_gardenButton := A_WorkingDir . "\images\gardenButton.png"
img_basicTree :=  A_WorkingDir . "\images\basicTreeButton.png"
img_blueTree :=  A_WorkingDir . "\images\blueTree.png"
img_plantAllButton := A_WorkingDir . "\images\plantAllButton.png"
img_buttonButton := A_WorkingDir . "\images\buttonButton.png"
img_idleModeOn := A_WorkingDir . "\images\idleModeOn.png"
img_battery := A_WorkingDir . "\images\battery.png"
img_ants := A_WorkingDir . "\images\ants.png"
img_destroyAllTrees := A_WorkingDir . "\images\destroyAllTrees.png"
img_battleArenaLeftArrow := A_WorkingDir . "\images\battleArenaLeftArrow.png"
img_petButton :=  A_WorkingDir . "\images\petButton.png"
img_feedPet :=  A_WorkingDir . "\images\feedPet.png"
img_closePet := A_WorkingDir . "\images\closePet.png"
img_usePetManaEffect := A_WorkingDir . "\images\usePetManaEffect.png"



timeToFeedPet := 0
antsPreviousX := 0
antsPreviousY := 0
orangeButtonPreviousX := 0
orangeButtonPreviousY := 0 
treeHarvestPreviousX := 0
treeHarvestPreviousY := 0
loadBatteryPreviousX := 0
loadBatteryPreviousY := 0
timeForBreak := 0
fasterTreeRenewal := 0
treeRenewalCount := 0
battleArenaMoveFromX := 0
battleArenaMoveFromY := 0


^t:: ;; t as test. All test code goes here
SetTitleMatchMode, RegEx   ;RegEx = sets title matching mode to regular expressions ( 1 = exact 2 = anywhere inside )
WinActivate, .* %MyBrowser% ;window's name ends with the browser name ( %MyBrowser% )
WinGetPos, , , windowSizeX, windowSizeY , A
Sleep, 400
feedThePet()
return

^r::Reload

^a::
SetTitleMatchMode, RegEx   ;RegEx = sets title matching mode to regular expressions ( 1 = exact 2 = anywhere inside )
WinActivate, .* %MyBrowser% ;window's name ends with the browser name ( %MyBrowser% )
WinGetPos, , , windowSizeX, windowSizeY , A
Sleep, 400
firstBatteryClick()
MouseMove, 300, 300
;SetKeyDelay, -1, -1
;Thread, interrupt, 0  ; Make all threads always-interruptible.
;SetTimer, pressZ, -2000
Loop {
  battleArenaLoot(490)
  batteryCheck()
  antsCheck()
  Sleep, 102
}
return

pressZ:
;SendInput, z
;SendPlay, z
;Send, z
Loop, 3
{
  Send, {z Down}
  ;Sleep, 110
  Sleep, 42
  Send {z Up}
  ;Sleep, 55
  Sleep, 15
  Sleep, 2000
}
return

^j::
SetTitleMatchMode, RegEx   ;RegEx = sets title matching mode to regular expressions ( 1 = exact 2 = anywhere inside )
WinActivate, .* %MyBrowser% ;window's name ends with the browser name ( %MyBrowser% )
WinGetPos, , , windowSizeX, windowSizeY , A
firstBatteryClick()
Loop
{  
  
  batteryCheck()
  treeCheck()
  antsCheck()
  Sleep, 2000 ;; dmn why it doesnt work !!
}
return

^w::

Sleep, 200

;; Programmer's Code
SetTitleMatchMode, RegEx   ;RegEx = sets title matching mode to regular expressions ( 1 = exact 2 = anywhere inside )
WinActivate, .* %MyBrowser% ;window's name ends with the browser name ( %MyBrowser% )
WinGetPos, , , windowSizeX, windowSizeY , A

MouseMove, 200, 200
activateFasterRenewal() ;; you can comment this if you don't want this
turnIdleModeOff()
firstBatteryClick()
treeCheck()
;goToButton() ; I think it is unnecessary here
MouseMove, 200, 200
searchAndClick(img_redButton, 35, 34) ;; x=34 x=35 excellent y= ?
MouseGetPos, mouseX, mouseY
orangeButtonPreviousX := mouseX
orangeButtonPreviousY := mouseY
MouseMove, mouseX + 26, mouseY
  
timeToCheck := 0
Loop
{  
  ;searchAndClickNear(img_orangeButton, 10, 49) ;; x=9 y=49 theorietical calulation x=10 y = 49 super perfect
  ;timeToCheck  := timeToCheck  + 1
  searchAndClickNear(img_orange2, 22, -2) ;; -1 excellent -2 some perfects -3 excellent
  MouseGetPos, mouseX, mouseY
  MouseMove, mouseX + 26, mouseY, 0
  sleep, 100
}

MsgBox, "Skrypt sie skonczyl poprawnie"
return

^f::ExitApp

^q::
Loop, 100
{
  MouseClick
}
return
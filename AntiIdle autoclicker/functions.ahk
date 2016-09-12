battleArenaLoot(howfar) {
  global battleArenaMoveFromX
  global battleArenaMoveFromY
  global windowSizeX
  global windowSizeY
  global img_battleArenaLeftArrow 

  If (battleArenaMoveFromX = 0) {
    ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *35 %img_battleArenaLeftArrow%
    lastError := ErrorLevel
  } else {
    ImageSearch, myszX, myszY, battleArenaMoveFromX - 20, battleArenaMoveFromY - 20, battleArenaMoveFromX + 50, battleArenaMoveFromY + 30, *35 %img_battleArenaLeftArrow%
    lastError := ErrorLevel
  }  
  if (lastError = 0) {
    battleArenaMoveFromX := myszX
    battleArenaMoveFromY := myszY
    MouseMove, myszX + howfar, myszY - 33, 18
    MouseMove, myszX + 78, myszY - 33, 36
    Sleep, 100
  }
}

plantTrees() {
  global windowSizeX
  global windowSizeY
  global img_basicTree
  global img_blueTree 
  global img_plantAllButton
  global treeRenewalCount
  global timeToFeedPet
  
  ;;MouseMove, 100, 100 ;; not necessary because mouse is at the "Garden" button
  treeRenewalCount := 0 ;;in case it started with already set garden.
  firstBatteryClick()
  
  goToGarden()
  destroyTheTrees() ;; it destroys the trees but only if necessary
  setTreeColor(img_basicTree)
  SearchAndClick(img_plantAllButton)
  Sleep, 150  
  if (timeToFeedPet > 100) {
    timeToFeedPet := 0
    feedThePet()
  }
}

feedThePet() {
  global img_petButton 
  global img_feedPet 
  global img_closePet 
  global img_usePetManaEffect
  global windowSizeX
  global windowSizeY 
  
  SearchAndClick(img_petButton)
  Sleep, 400
  SearchAndClick(img_feedPet)
  Sleep, 200
  ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *5 %img_usePetManaEffect%
  if (ErrorLevel = 0) {
    MouseMove, myszX, myszY
    Sleep, 100
    MouseClick
    Sleep, 203
  }
  SearchAndClick(img_closePet)
  Sleep, 400
}


destroyTheTrees() {
  global img_destroyAllTrees
  global windowSizeX
  global windowSizeY
  global fasterTreeRenewal
  
  MouseMove, 200, 200
  Sleep, 130
  if (fasterTreeRenewal = 1) {
    ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *15 %img_destroyAllTrees%
    MouseMove, myszX, myszY
    Sleep, 50
    Send, {LShift Down}
    Sleep, 50
    MouseClick
    Sleep, 50
    Send, {LShift Up}
    Sleep, 31
  }
}


activateFasterRenewal() {
  global fasterTreeRenewal
  
  fasterTreeRenewal := 1
}

goToGarden() {
  global img_worldButtonIndicator
  global windowSizeX
  global windowSizeY
  global img_gardenButton

  ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *10 %img_worldButtonIndicator%
  MouseMove, myszX - 20, myszY
  Sleep, 300
  SearchAndClick(img_gardenButton)
  Sleep, 400
}

setTreeColor(img_tree) {
  global timeToFeedPet
  global img_basicTree
  global img_blueTree 
  
  if (img_tree = img_basicTree) 
    timeToFeedPet := timeToFeedPet + 15
  if (img_tree = img_blueTree) 
    timeToFeedPet := timeToFeedPet + 55
  global img_blueTree 
  SearchAndClick(img_tree, 2, 1)
  Sleep, 500  
}

turnIdleModeOff() {
  global img_idleModeOn
  global windowSizeX
  global windowSizeY  
  
  ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *30 %img_idleModeOn%
  if (ErrorLevel = 0) {
    searchAndClick(img_idleModeOn, 3, 1)
  }
}

firstBatteryClick() {
  global img_battery
 
  searchAndClick(img_battery, 9)
}

goToButton() {
  global windowSizeX
  global windowSizeY  
  global img_worldButtonIndicator
  global img_buttonButton
  global orangeButtonPreviousX
  global rangeButtonPreviousY
  
  ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *15 %img_worldButtonIndicator%
  MouseMove, myszX - 20, myszY
  Sleep, 500 
  SearchAndClick(img_buttonButton)
  Sleep, 300
  orangeButtonPreviousX := 0
  orangeButtonPreviousY := 0
}

searchAndClick(imageToSearch, xOffset=0, yOffset=0) {
  searchAgainAfter := 2 ; Default amount of miliseconds to wait between image searches in case of failure
  clickAfter := 2 ; Default amount of miliseconds to wait between mouse move and mouse click
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  WinGetPos, , , windowSizeX, windowSizeY , A
  ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *15 %imageToSearch%
  imgExist := ErrorLevel
  counter := 0
  while imgExist > 0
  {
   Sleep, %searchAgainAfter%
   ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *40 %imageToSearch%
    imgExist := ErrorLevel
   counter := counter + 1
   if (counter > 25) {
        MsgBox, "search and click nie znalazl obrazka ktorym byl" . %imageToSearch%
      ExitApp
   }
  }
  myszX := myszX + xOffset
  myszY := myszY + yOffset
  MouseMove, myszX , myszY
  Sleep, %clickAfter%
  MouseClick   
}

searchAndClickNear(imageToSearch, xOffset=0, yOffset=0) {
  static checkVarious := 0
  searchAgainAfter := 3 ; Default amount of miliseconds to wait between image searches in case of failure
  clickAfter := 1 ; Default amount of miliseconds to wait between mouse move and mouse click
  global orangeButtonPreviousX
  global orangeButtonPreviousY
  global timeForBreak
  global img_redButton
  global timeToCheck
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  WinGetPos, , , windowSizeX, windowSizeY , A
  If (orangeButtonPreviousX = 0) {
    ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *15 %imageToSearch%
  } else {
    ImageSearch, myszX, myszY, orangeButtonPreviousX - 100, orangeButtonPreviousY - 90, orangeButtonPreviousX + 100, orangeButtonPreviousY + 90, *15 %imageToSearch%
  }
  imgExist := ErrorLevel
  counter := 0
  while imgExist > 0
  {
   Sleep, %searchAgainAfter%
    If (orangeButtonPreviousX = 0) {
      ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *52 %imageToSearch%
    } else {
      ImageSearch, myszX, myszY, orangeButtonPreviousX - 100, orangeButtonPreviousY - 90, orangeButtonPreviousX + 100, orangeButtonPreviousY + 90, *52 %imageToSearch%
    }
    imgExist := ErrorLevel
   counter := counter + 1
   if (counter > 35) {
      if (imgExist = 2) {
        MsgBox "imageSearch syntax is wrong! Check your code! Exiting."
          ExitApp
       } else {
          MouseMove, 300, 300, 0
          Sleep, 70
          searchAndClick(img_redButton, 35, 34)
        ;MsgBox "Image NOT found. Exiting script."         
      }
   }
  }
  orangeButtonPreviousX := myszX
  orangeButtonPreviousY := myszY
  myszX := myszX + xOffset
  myszY := myszY + yOffset
  MouseMove, myszX , myszY, 0
  Sleep, %clickAfter%
  MouseClick   
  Sleep, 1
  timeForBreak := timeForBreak + 1
  if (timeForBreak > 12) {
    timeForBreak := 0
    checkVarious := checkVarious + 1
    if (checkVarious = 2) {
      checkVarious := 0
      treeCheck()
      batteryCheck()
      antsCheck()
    }
    ;that or sleep 250
    ;sleep, 100
    MouseGetPos, mouseX, mouseY
    MouseMove, mouseX + 26, mouseY, 0
    ;Sleep, 80 ; very wrong idea
    searchAndClickNear(imageToSearch, 23, -3) 
    ;Sleep, 413
    ;MouseClick
  }
  ;Sleep, %clickAfter%
}

batteryCheck() 
{
  global img_loadBattery
  global loadBatteryPreviousX
  global loadBatteryPreviousY
  global windowSizeX
  global windowSizeY
  
  If (loadBatteryPreviousX = 0) {
    ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *41 %img_loadBattery%
    lastError := ErrorLevel
  } else {
    ImageSearch, myszX, myszY, loadBatteryPreviousX - 50, loadBatteryPreviousY - 30, loadBatteryPreviousX + 50, loadBatteryPreviousY + 30, *41 %img_loadBattery%
    lastError := ErrorLevel
  }  
  if (lastError = 0) {
    loadBatteryPreviousX := myszX
    loadBatteryPreviousY := myszY
    MouseGetPos, mouseX, mouseY
    MouseMove, myszX, myszY
    Sleep, 25
    MouseClick
    Sleep, 25
    MouseMove, mouseX, mouseY
    Sleep, 10
  }
}

antsCheck() 
{
  global img_ants
  global antsPreviousX
  global antsPreviousY
  global windowSizeX
  global windowSizeY
  
  If (antsPreviousX = 0) {
    ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *15 %img_ants%
    lastError := ErrorLevel
  } else {
    ImageSearch, myszX, myszY, loadBatteryPreviousX - 140, loadBatteryPreviousY - 20, loadBatteryPreviousX + 10, loadBatteryPreviousY + 20, *25 %img_ants%
    lastError := ErrorLevel
  }  
  if (lastError = 0) {
    antsPreviousX := myszX
    antsPreviousY := myszY
    MouseGetPos, mouseX, mouseY
    MouseMove, myszX + 68, myszY + 15
    Sleep, 25
    MouseClick
    Sleep, 25
    MouseMove, mouseX, mouseY
    Sleep, 10
  }
}


damagedCheck() 
{
  global img_damagedButton ;;yeah
  global img_repairButton ;;
  WinGetPos, , , windowSizeX, windowSizeY , A
  ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *10 %img_damaggedButton%
  if (ErrorLevel = 0) {
    MouseGetPos, mouseX, mouseY
    ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *10 %img_repairButton%
    MouseClick, Left, myszX, myszY
    MouseMove, mouseX, mouseY
    Sleep, 70
  }
}

treeCheck() 
{
  global img_treeHarvest
  global treeHarvestPreviousX
  global treeHarvestPreviousY
  global windowSizeX
  global windowSizeY
  global img_zeroTrees
  
  pureTreeCheck() ;; checks if there are trees to harvest
  If (treeHarvestPreviousX = 0) { ;; now's the part to check if there are 0 trees planted (so we can plant more trees)
    ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *25 %img_zeroTrees%
    lastError := ErrorLevel
  } else {
    ImageSearch, myszX, myszY, treeHarvestPreviousX - 50, treeHarvestPreviousY - 20, treeHarvestPreviousX + 140, treeHarvestPreviousY + 20, *35 %img_zeroTrees%
    lastError := ErrorLevel
  }  
  if (lastError = 0) {
    treeHarvestPreviousX := myszX
    treeHarvestPreviousY := myszY
    plantTrees()
    goToButton() ;; not yet implemented
  }
  Sleep, 65 ;; coz it blinks that's why there is 2nd check here :)
  pureTreeCheck()
  Sleep, 25
  pureTreeCheck()
  ;Sleep, 65
  ;pureTreeCheck()
}

pureTreeCheck() {
  global img_treeHarvest
  global treeHarvestPreviousX
  global treeHarvestPreviousY
  global windowSizeX
  global windowSizeY
  global fasterTreeRenewal
  global treeRenewalCount
  
  If (treeHarvestPreviousX = 0) {
    ImageSearch, myszX, myszY, 1, 1, windowSizeX, windowSizeY, *35 %img_treeHarvest%
    lastError := ErrorLevel
  } else {
    ImageSearch, myszX, myszY, treeHarvestPreviousX - 100, treeHarvestPreviousY - 30, treeHarvestPreviousX + 40, treeHarvestPreviousY + 30, *35 %img_treeHarvest%
    lastError := ErrorLevel
  }  
  if (lastError = 0) {
    treeHarvestPreviousX := myszX
    treeHarvestPreviousY := myszY
    MouseGetPos, mouseX, mouseY
    MouseMove, myszX + 15, myszY + 2
    Sleep, 25
    MouseClick
    Sleep, 25
    MouseMove, mouseX, mouseY
    Sleep, 10
    if (fasterTreeRenewal = 1) {
      treeRenewalCount := treeRenewalCount + 1
      if (treeRenewalCount = 3) {
        treeRenewalCount := 0
        plantTrees()
        goToButton()
      }
    }
  }  
}
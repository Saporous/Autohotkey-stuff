-- TREE FARM
-- For use with felling turtles for tree farm
-- one turtle per tree type
-- turtle is disabled on redstone signal on behind

-- BLOCK REQUIREMENTS
-- 	Chest on left of turtle
--	OPTIONAL: Redstone on back of turtle to disable

-- Inventory space use:
--		Slot 0: bonemeal
--		Slot 1: saping of tree
--		Slot 2-15: logs or other drops

-- Check inventory contents; if no bonemeal, toggle noBonemeal, if no saplings error out
function checkInventory()
	
-- Dump inventory into chest below
function dumpInventory()
	for i = 16,2,-1 do
		turtle.select(i)
		if turtle.dropDown()
		else error("Inventory full!")
	end
end

i = 0
while true do
        while redstone.getInput("top" or "bottom" or "back" or "left" or "right" or "front") do
                turtle.attack()
                sleep(.1)
                i = i+1
                if i > 300 then
                        for j = 16, 1, -1 do
                                turtle.select(j)
                                turtle.dropDown()
                        end
                        i = 0
                end
        end
        sleep(1)
end
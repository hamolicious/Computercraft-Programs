function emptyInv()
	for i = 1, 16 do -- loop through the slots
		turtle.select(i) -- change to the slot
		if not turtle.refuel(0) then -- if it's not a valid fuel
			turtle.drop()
		end
	end
end

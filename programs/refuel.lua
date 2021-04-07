function refuel()
	local saveSelecedSlot = turtle.select()
	for i = 1, 16 do -- loop through the slots
		turtle.select(i) -- change to the slot
		if turtle.refuel(0) then -- if it's valid fuel
			local halfStack = math.ceil(turtle.getItemCount(i)/2) -- work out half of the amount of fuel in the slot
			turtle.refuel(halfStack) -- consume half the stack as fuel
			return -- once fueled up, break out of the function
		end
	end
end

refuel()

function refuel()
	for i = 1, 16 do -- loop through the slots
		turtle.select(i) -- change to the slot
		if turtle.refuel(0) then -- if it's valid fuel
			local halfStack = math.ceil(turtle.getItemCount(i)/2) -- work out half of the amount of fuel in the slot
			turtle.refuel(halfStack) -- consume half the stack as fuel
			return
		end
	end
end

function emptyInv()
	for i = 1, 16 do -- loop through the slots
		turtle.select(i) -- change to the slot
		if not turtle.refuel(0) then -- if it's not a valid fuel
			turtle.drop()
		end
	end
end

depth = 0
while true do
	refuel()

	turtle.digDown()
	turtle.down()
	depth = depth + 1

	for i = 0, 3 do
		turtle.dig()
		turtle.forward()
		turtle.turnRight()
	end

	if depth >= 4 then
		for i = 0, depth do
			turtle.up()
		end

		for i = 0, 3 do
			turtle.forward()
		end
		emptyInv()

		break
	end
end





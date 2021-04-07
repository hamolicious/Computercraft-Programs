function refuel()
	if turtle.getFuelLevel() > 50 then -- only refuel if the fuel is low
		return
	end

	for i = 1, 16 do -- loop through the slots
		turtle.select(i) -- change to the slot

		if turtle.refuel(0) then -- if it's valid fuel
			local halfStack = math.ceil(turtle.getItemCount(i)/2) -- work out half of the amount of fuel in the slot
			turtle.refuel(halfStack) -- consume half the stack as fuel
			break -- once fueled up, break out of the function
		end
	end

	turtle.select(1) -- default to slot 1
end

function emptyInv()
	for i = 1, 16 do -- loop through the slots
		turtle.select(i) -- change to the slot
		if not turtle.refuel(0) then -- if it's not a valid fuel
			turtle.drop()
		end
	end
end

function digSlice(size)
	isTurnRight = true

	for x = 1, size do
		for y = 1, size do
			turtle.dig()
			turtle.forward()
		end

		if x == size then
			break
		end

		if isTurnRight then
			turtle.turnRight()
			turtle.dig()
			turtle.forward()
			turtle.turnRight()
		else
			turtle.turnLeft()
			turtle.dig()
			turtle.forward()
			turtle.turnLeft()
		end

		isTurnRight = not isTurnRight
	end

	returnHome(isTurnRight, size)
end

function returnHome(isTurnRight, size)
	if isTurnRight then
		turtle.turnRight()

		for i = 0, size do
			turtle.forward()
		end

		turtle.turnRight()
	else
		turtle.turnLeft()

		for i = 0, size do
			turtle.forward()
		end

		turtle.turnLeft()
	end
end

size = 5
maxDepth = 5
depth = 0
while true do
	refuel()

	turtle.digDown()
	turtle.down()
	digSlice(size)

	depth = depth + 1

	if depth >= maxDepth then
		for i = 0, depth-1 do
			turtle.up()
		end

		for i = 0, 5 do
			turtle.forward()
		end
		emptyInv()

		break
	end
end





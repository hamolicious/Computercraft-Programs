local function get(paste)
    write( "Connecting to github.com... " )
    local response = http.get(
        "https://raw.githubusercontent.com/hamolicious/Computercraft-Programs/master/programs/"..textutils.urlEncode( paste )..".lua"
    )

    if response then
        print( "Success." )

        local sResponse = response.readAll()
        response.close()
        return sResponse
    else
        print( "Failed." )
    end
end

local tArgs = { ... }
local sCode = tArgs[1]
local sFile = "prog"
local sPath = shell.resolve( sFile )
if fs.exists( sPath ) then
	fs.delete(sPath)
end

-- GET the contents from pastebin
local res = get(sCode)
if res then
	local file = fs.open( sPath, "w" )
	file.write( res )
	file.close()

	print( "Downloaded as "..sFile )
end

os.run({}, sPath)

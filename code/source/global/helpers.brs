' focus
function gameFocus(game)

    game.getFocusGroup = function()
		return m.focusGroup
	end function

	game.setFocusGroup = function(focusGroup)
		m.focusGroup = focusGroup
	end function

	game.getFocusTarget = function()
		return m.focusTarget
	end function

	game.setFocusTarget = function(focusTarget)
		m.focusTarget = focusTarget
	end function
    
end function

' xy
function gameXY(ver) as object
    m.xy = {

        get2DOffsetX: xy_get2DOffsetX
        set2DOffsetX: xy_set2DOffsetX

        get2DOffsetY: xy_get2DOffsetY
        set2DOffsetY: xy_set2DOffsetY

		config: invalid
	}

	m.xy.config = gameLoad("xy")
    m.xy.build = "1.0.0"

	if m.xy.config = invalid OR m.xy.config.version <> ver
        gameSave(invalid, "xy")

		m.xy.config = {
			offset: {
				x: 0,
				y: 0
			}

			version: ver
		}

        gameSave(m.config, "xy")

	end if

	return m.xy

end function

function xy_get2DOffsetX() as integer
    return m.config.offset.x
end function

sub xy_set2DOffsetX(x as integer)
    m.config.offset.x = x
    gameSave(m.config, "xy")
end sub

function xy_get2DOffsetY() as integer
    return m.config.offset.y
end function

sub xy_set2DOffsetY(y as integer)
    m.config.offset.y = y
    gameSave(m.config, "xy")
end sub


' save & load functions - fix stas

function gameLoad(save as string) as dynamic
	json = getRegistryString(save)
	if json <> ""
		data = parseJSON(json)

		if save = "char"
			if data <> invalid and data.char <> invalid
				return data.char
			end if
		end if

		if save = "xy"
			if data <> invalid and data.xy <> invalid
				return data.xy
			end if
		end if

	end if
	return invalid
end function

sub gameSave(config as object, save as string)
	if save = "char" then saveRegistryString(save, formatJSON({char: config}, 1))
	if save = "xy" then saveRegistryString(save, formatJSON({xy: config}, 1))
end Sub

' registry functions

sub saveRegistryString(key As String, value As String)
	sec = createObject("roRegistrySection", "PoP")
	sec.write(key, value)
	sec.flush()
end sub

function getRegistryString(key as String, default = "") as string
	sec = createObject("roRegistrySection", "PoP")
	if sec.exists(key)
		return sec.read(key)
	end if
	return default
end function
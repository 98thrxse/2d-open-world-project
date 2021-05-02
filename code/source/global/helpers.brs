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

' save & load functions - fix stas

function gameLoad() as dynamic
	json = getRegistryString("char")
	if json <> ""
		data = parseJSON(json)
		if data <> invalid and data.char <> invalid
			return data.char
		end if
	end if
	return invalid
end function

sub gameSave(config as object)
	saveRegistryString("char", formatJSON({char: config}, 1))
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
function doFocus(game)

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

function doLoad() as dynamic
	json = doGetRegistryString("char")
	if json <> ""
		data = parseJSON(json)
		if data <> invalid and data.char <> invalid
			return data.char
		end if
	end if
	return invalid
end function

sub doSave(config as object)
	doSaveRegistryString("char", formatJSON({char: config}, 1))
end Sub

sub doSaveRegistryString(key As String, value As String)
	sec = createObject("roRegistrySection", "PoP")
	sec.write(key, value)
	sec.flush()
end sub

function doGetRegistryString(key as String, default = "") as string
	sec = createObject("roRegistrySection", "PoP")
	if sec.exists(key)
		return sec.read(key)
	end if
	return default
end function
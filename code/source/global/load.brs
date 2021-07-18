function globalLoad(save as string) as dynamic
	json = getRegistryString(save)
	if json <> ""
		data = parseJSON(json)

		if save = "char"
			if data <> invalid and data.char <> invalid
				return data.char
			end if
		end if

	end if
	return invalid
end function


function getRegistryString(key as String, default = "") as string
	sec = createObject("roRegistrySection", "PoP")
	if sec.exists(key)
		return sec.read(key)
	end if
	return default
end function
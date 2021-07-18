sub globalSave(config as object, save as string)
	if save = "char" then saveRegistryString(save, formatJSON({char: config}, 1))
end Sub

sub saveRegistryString(key As String, value As String)
	sec = createObject("roRegistrySection", "PoP")
	sec.write(key, value)
	sec.flush()
end sub
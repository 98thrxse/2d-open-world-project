function initHelpers(game)

	' focus
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
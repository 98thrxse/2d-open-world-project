function global_focus(game)

    game.getFocusGroup = function()
		return m.focusGroup
	end function

	game.setFocusGroup = function(focusGroup)
		m.prevFocusGroup = m.focusGroup
		m.focusGroup = focusGroup
	end function

	game.getPrevFocusGroup = function()
		return m.prevFocusGroup
	end function

	game.getFocusTarget = function()
		return m.focusTarget
	end function

	game.setFocusTarget = function(focusTarget)
		m.prevfocusTarget = m.focusTarget
		m.focusTarget = focusTarget
	end function

	game.getPrevFocusTarget = function()
		return m.prevFocusTarget
	end function
    
end function
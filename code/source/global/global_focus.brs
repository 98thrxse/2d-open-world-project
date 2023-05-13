sub global_focus(game as object)

    game.getFocusGroup = function() as string
		return m.focusGroup
	end function

	game.setFocusGroup = sub(focusGroup as string)
		m.prevFocusGroup = m.focusGroup
		m.focusGroup = focusGroup
	end sub

	game.getPrevFocusGroup = function() as string
		return m.prevFocusGroup
	end function

	game.getFocusTarget = function() as integer
		return m.focusTarget
	end function

	game.setFocusTarget = sub(focusTarget as integer)
		m.prevfocusTarget = m.focusTarget
		m.focusTarget = focusTarget
	end sub

	game.getPrevFocusTarget = function() as integer
		return m.prevFocusTarget
	end function
    
end sub
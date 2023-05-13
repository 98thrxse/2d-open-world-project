function interact_char_interface(object)

    object.onButton = function(code as integer)

        ' pressed
        if code = 10 ' info
            m.focusChange()
        end if

    end function

    object.focusChange = function()
        if m.game.getFocusGroup() <> "interface"
            m.game.setFocusGroup("interface")
            m.game.setFocusTarget(0)
        else
            m.game.setFocusGroup(m.game.getPrevFocusGroup())
            m.game.setFocusTarget("")
        end if
    end function

end function
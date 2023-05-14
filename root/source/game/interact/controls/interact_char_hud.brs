sub interact_char_hud(object)

    object.onButton = sub(code as integer)

        ' pressed
        if code = 10 ' info
            m.focusChange()
        end if

    end sub

    object.focusChange = sub()
        if m.game.getFocusGroup() <> "hud"
            m.game.setFocusGroup("hud")
            m.game.setFocusTarget(0)
        else
            m.game.setFocusGroup(m.game.getPrevFocusGroup())
            m.game.setFocusTarget(0)
        end if
    end sub

end sub
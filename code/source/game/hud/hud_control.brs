sub hud_control(object)

    object.onButton = sub(code as integer)

        ' pressed
        if code = 4 ' left
            if m.game.getFocusGroup() = "hud"
                m.hudLeftTarget()
            end if
        else if code = 5 ' right
            if m.game.getFocusGroup() = "hud"
                m.hudRightTarget()
            end if
        end if

    end sub

    object.hudLeftTarget = sub()
        if m.game.getFocusTarget() <= 0
            m.game.setFocusTarget(m.game.hud.config.menu.Count() - 1)
        else
            m.game.setFocusTarget(m.game.getFocusTarget() - 1)
        end if
    end sub

    object.hudRightTarget = sub()
        if m.game.getFocusTarget() >= m.game.hud.config.menu.Count() - 1
            m.game.setFocusTarget(0)
        else
            m.game.setFocusTarget(m.game.getFocusTarget() + 1)
        end if
    end sub
    
end sub
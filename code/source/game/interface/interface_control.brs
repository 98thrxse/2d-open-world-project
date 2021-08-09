function interface_control(object)

    object.onCreate = function(args)

    end function

    object.onButton = function(code as integer)

        ' pressed
        if code = 10 ' info
            m.focusChange()
        else if code = 4 ' left
            if m.game.getFocusGroup() = "interface"
                m.interfaceLeftTarget()
            end if
        else if code = 5 ' right
            if m.game.getFocusGroup() = "interface"
                m.interfaceRightTarget()
            end if
        end if

    end function

    object.interfaceLeftTarget = function()
        if m.game.getFocusTarget() <= 0
            m.game.setFocusTarget(m.game.interface.config.menu.Count() - 1)
        else
            m.game.setFocusTarget(m.game.getFocusTarget() - 1)
        end if
    end function

    object.interfaceRightTarget = function()
        if m.game.getFocusTarget() >= m.game.interface.config.menu.Count() - 1
            m.game.setFocusTarget(0)
        else
            m.game.setFocusTarget(m.game.getFocusTarget() + 1)
        end if
    end function
    
    object.focusChange = function()
        if m.game.getFocusGroup() = "char"
            m.game.setFocusGroup("interface")
            m.game.setFocusTarget(0)
        else if m.game.getFocusGroup() = "interface"
            m.game.setFocusGroup("char")
            m.game.setFocusTarget("")
        end if
    end function

end function
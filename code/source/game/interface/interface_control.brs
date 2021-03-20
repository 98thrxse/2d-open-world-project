function interface_control(object)

    object.onCreate = function(args)

    end function

    object.onButton = function(code as integer)

        ' pressed
        if code = 10 ' info
            if m.game.getFocusGroup() = "char"
                m.game.setFocusGroup("interface")
                m.game.setFocusTarget(m.game.interface.config.focus.menu[0].id)
            else if m.game.getFocusGroup() = "interface"
                m.game.setFocusGroup("char")
                m.game.setFocusTarget(0)
            end if
        else if code = 4 ' left
            if m.game.getFocusGroup() = "interface"
                if m.game.getFocusTarget() <= 0
                    m.game.setFocusTarget(m.game.interface.config.focus.menu.Count() - 1)
                else
                    m.game.setFocusTarget(m.game.getFocusTarget() - 1)
                end if
            end if
        else if code = 5 ' right
            if m.game.getFocusGroup() = "interface"
                if m.game.getFocusTarget() >= m.game.interface.config.focus.menu.Count() - 1
                    m.game.setFocusTarget(m.game.interface.config.focus.menu[0].id)
                else
                    m.game.setFocusTarget(m.game.getFocusTarget() + 1)
                end if
            end if
        end if

    end function

end function
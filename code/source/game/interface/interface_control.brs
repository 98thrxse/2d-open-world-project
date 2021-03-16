function interface_control(object)

    object.onCreate = function(args)

    end function

    object.onButton = function(code as integer)

        if code = 10 ' info
            if m.game.getFocusGroup() = "char"
                m.game.setFocusGroup("interface")
                m.game.setFocusTarget("exit")
            else if m.game.getFocusGroup() = "interface"
                m.game.setFocusGroup("char")
                m.game.setFocusTarget("")
            end if
            
        end if

    end function

end function
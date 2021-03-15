function interface_control(object)

    object.onCreate = function(args)

    end function

    object.onButton = function(code as integer)

        ' pressed
        if code = 10 ' info
            if m.game.interface.getMMToggle()
                m.game.data.setFocus("char")
                m.game.interface.setMMToggle(false)
            else
                m.game.data.setFocus("interface")
                m.game.interface.setMMToggle(true)
            end if
        end if

    end function

end function
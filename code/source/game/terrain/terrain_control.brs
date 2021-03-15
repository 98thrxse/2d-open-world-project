function terrain_control(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.entity_wnd = m.game.getInstanceByName("terrain_entity")
        ' m.col_wnd = m.game.getInstanceByName("terrain_col")

    end function
    

    ' fix stas
    object.charXY = function()

        m.game.char.setEntityPosX(m.game.screen.GetWidth() / 2 - m.entity_wnd.x)
        m.game.char.setEntityPosY(m.game.screen.GetHeight() / 2 - m.entity_wnd.y)

        ' m.game.char.setEntityPosX(m.game.screen.GetWidth() / 2 - m.col_wnd.x)
        ' m.game.char.setEntityPosY(m.game.screen.GetHeight() / 2 - m.col_wnd.y)

    end function


    object.onUpdate = function(dt as float)

        m.charXY()

    end function


    object.onButton = function(code as integer)

        ' held
        if code = 1002 ' up

            if m.game.char.getUpCol() = false and m.game.data.getFocus() = "char"
                m.entity_wnd.y += m.game.char.getUpSpeed()

            end if
                        
		else if code = 1003 ' down

            if m.game.char.getDownCol() = false and m.game.data.getFocus() = "char"
                m.entity_wnd.y -= m.game.char.getDownSpeed()

            end if
            
		else if code = 1004 ' left

            if m.game.char.getLeftCol() = false and m.game.data.getFocus() = "char"
                m.entity_wnd.x += m.game.char.getLeftSpeed()

            end if
            
        else if code = 1005 ' right

            if m.game.char.getRightCol() = false and m.game.data.getFocus() = "char"
                m.entity_wnd.x -= m.game.char.getRightSpeed()

            end if
            
        end if

    end function
    
end function
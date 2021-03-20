function char_control(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.entity_wnd = m.game.getInstanceByName("char_entity")
    m.col_wnd = m.game.getInstanceByName("char_col")

    m.loadXY()

  end function


  object.saveXY = function()

    m.game.char.setEntityPosX(m.game.screen.GetWidth() / 2 - m.entity_wnd.xy.offset_x)
    m.game.char.setEntityPosY(m.game.screen.GetHeight() / 2 - m.entity_wnd.xy.offset_y)

  end function


  object.loadXY = function()

    ' position
    m.entity_wnd.xy.offset_x = m.game.screen.GetWidth() / 2 - m.game.char.getEntityPosX()
    m.entity_wnd.xy.offset_y = m.game.screen.GetHeight() / 2 - m.game.char.getEntityPosY()

  end function


  object.onUpdate = function(dt as float)

    m.saveXY()

  end function


  object.onButton = function(code as integer)

		' pressed
    if code = 2 ' up
      if m.game.getFocusGroup() = "char"
        if m.entity_wnd.entity.scale_x <> 1.0
          m.entity_wnd.entity.offset_x -= m.game.char.getEntityW()
          
        end if
      m.entity_wnd.entity.scale_x = 1.0

      end if

    else if code = 3 ' down
      if m.game.getFocusGroup() = "char"

        if m.entity_wnd.entity.scale_x <> 1.0
          m.entity_wnd.entity.offset_x -= m.game.char.getEntityW()

        end if
        m.entity_wnd.entity.scale_x = 1.0
      
      end if

    else if code = 4 ' left
      if m.game.getFocusGroup() = "char"
        if m.entity_wnd.entity.scale_x <> -1.0
          m.entity_wnd.entity.offset_x += m.game.char.getEntityW()
          m.entity_wnd.entity.scale_x = -1.0

        end if

      end if

		else if code = 5 ' right
      if m.game.getFocusGroup() = "char"
        if m.entity_wnd.entity.scale_x <> 1.0
          m.entity_wnd.entity.offset_x -= m.game.char.getEntityW()
          m.entity_wnd.entity.scale_x = 1.0

        end if

      end if

    ' held
    else if code = 1002 ' up
      if m.game.getFocusGroup() = "char"
        if m.game.char.getUpCol() = false
          m.entity_wnd.xy.offset_y += m.game.char.getUpSpeed()

        end if

      end if
                      
    else if code = 1003 ' down
      if m.game.getFocusGroup() = "char"
        if m.game.char.getDownCol() = false
          m.entity_wnd.xy.offset_y -= m.game.char.getDownSpeed()

        end if
      
      end if
        
    else if code = 1004 ' left
      if m.game.getFocusGroup() = "char"
        if m.game.char.getLeftCol() = false
          m.entity_wnd.xy.offset_x += m.game.char.getLeftSpeed()

        end if

      end if
            
    else if code = 1005 ' right
      if m.game.getFocusGroup() = "char"
        if m.game.char.getRightCol() = false
          m.entity_wnd.xy.offset_x -= m.game.char.getRightSpeed()

        end if

      end if
      
		end if

	end function
    
end function
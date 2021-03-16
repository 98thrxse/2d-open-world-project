function char_control(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.entity_wnd = m.game.getInstanceByName("char_entity")
    m.col_wnd = m.game.getInstanceByName("char_col")

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
      
		end if

	end function
    
end function
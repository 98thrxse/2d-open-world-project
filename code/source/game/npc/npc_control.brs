function npc_control(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.entity_wnd = m.game.getInstanceByName("npc_entity")
    m.col_wnd = m.game.getInstanceByName("npc_col")

  end function

  
  object.onButton = function(code as integer)

    ' held
    if code = 1002 ' up

      if m.game.char.getUpCol() = false
        m.entity_wnd.y += m.game.char.getUpSpeed()
        m.col_wnd.y += m.game.char.getUpSpeed()

      end if
                    
    else if code = 1003 ' down

      if m.game.char.getDownCol() = false
        m.entity_wnd.y -= m.game.char.getDownSpeed()
        m.col_wnd.y -= m.game.char.getDownSpeed()

      end if
        
        
    else if code = 1004 ' left

      if m.game.char.getLeftCol() = false
        m.entity_wnd.x += m.game.char.getLeftSpeed()
        m.col_wnd.x += m.game.char.getLeftSpeed()

      end if
        
    else if code = 1005 ' right

      if m.game.char.getRightCol() = false
        m.entity_wnd.x -= m.game.char.getRightSpeed()
        m.col_wnd.x -= m.game.char.getRightSpeed()

      end if
        
    end if

    ' released
    if code = 102
      m.game.char.setNPCCol(invalid)

    else if code = 103
      m.game.char.setNPCCol(invalid)

    else if code = 104
      m.game.char.setNPCCol(invalid)


    else if code = 105
      m.game.char.setNPCCol(invalid)

    end if

  end function
      
end function
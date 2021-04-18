function npc_control(object)

  object.onCreate = function(args)


  end function

  
  object.onButton = function(code as integer)

    ' released
    if code = 102
      if m.game.getFocusGroup() = "char"
        m.game.char.setNPCCol(invalid)
      
      end if

    else if code = 103
      if m.game.getFocusGroup() = "char"
        m.game.char.setNPCCol(invalid)

      end if

    else if code = 104
      if m.game.getFocusGroup() = "char"
        m.game.char.setNPCCol(invalid)

      end if

    else if code = 105
      if m.game.getFocusGroup() = "char"
        m.game.char.setNPCCol(invalid)

      end if
      
    end if

  end function
      
end function
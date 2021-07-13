function npc_control(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.entity_wnd = m.game.getInstanceByName("npc_entity")
    m.col_wnd = m.game.getInstanceByName("npc_col")

  end function

  object.controlXY = function()

    ' entity position
    m.entity_wnd.x = m.game.xy.get2DOffsetX()
    m.entity_wnd.y = m.game.xy.get2DOffsetY()

    ' col position
    m.col_wnd.x = m.game.xy.get2DOffsetX()
    m.col_wnd.y = m.game.xy.get2DOffsetY()

  end function

  object.onUpdate = function(dt as float)

      m.controlXY()

  end function
      
end function
function char_col(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.entity_wnd = m.game.getInstanceByName("char_entity")
    
    m.onSpawn()

  end function

  
  object.onSpawn = function()

    ' addColliderRectangle
    m.addColliderRectangle("char_col_up", m.entity_wnd.entity.offset_x + 3, m.entity_wnd.entity.offset_y, m.game.char.getEntityW() - 6, 1)
    m.addColliderRectangle("char_col_down", m.entity_wnd.entity.offset_x + 3, m.entity_wnd.entity.offset_y + m.game.char.getEntityH(), m.game.char.getEntityW() - 6, 1)
    m.addColliderRectangle("char_col_left", m.entity_wnd.entity.offset_x, m.entity_wnd.entity.offset_y + 3, 1, m.game.char.getEntityH() - 6)
    m.addColliderRectangle("char_col_right", m.entity_wnd.entity.offset_x + m.game.char.getEntityW() - 1, m.entity_wnd.entity.offset_y + 3, 1, m.game.char.getEntityH() - 6)
  
  end function


  ' object.onDrawEnd = function(canvas)

  '   canvas.DrawRect(m.entity.offset_x + 3, m.entity.offset_y, m.game.char.getEntityW() - 6, 1, &hFFFFFFFF)
  '   canvas.DrawRect(m.entity.offset_x + 3, m.entity.offset_y + m.game.char.getEntityH(), m.game.char.getEntityW() - 6, 1, &hFFFFFFFF)
  '   canvas.DrawRect(m.entity.offset_x, m.entity.offset_y + 3, 1, m.game.char.getEntityH() - 6, &hFFFFFFFF)
  '   canvas.DrawRect(m.entity.offset_x + m.game.char.getEntityW() - 1, m.entity.offset_y + 3, 1, m.game.char.getEntityH() - 6, &hFFFFFFFF)

  ' end function
    
end function
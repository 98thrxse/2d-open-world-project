function char_col(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.entity_wnd = m.game.getInstanceByName("char_entity")
    
    m.colGen()

  end function

  
  object.colGen = function()

    ' addColliderRectangle
    m.addColliderRectangle(m.game.char.getColUpName(), m.game.char.getColOffsetX() + 3, m.game.char.getColOffsetY(), m.game.char.getColW() - 6, 1)
    m.addColliderRectangle(m.game.char.getColDownName(), m.game.char.getColOffsetX() + 3, m.game.char.getColOffsetY() + m.game.char.getColH(), m.game.char.getColW() - 6, 1)
    m.addColliderRectangle(m.game.char.getColLeftName(), m.game.char.getColOffsetX(), m.game.char.getColOffsetY() + 3, 1, m.game.char.getColH() - 6)
    m.addColliderRectangle(m.game.char.getColRightName(), m.game.char.getColOffsetX() + m.game.char.getColW() - 1, m.game.char.getColOffsetY() + 3, 1, m.game.char.getColH() - 6)
  
  end function


  ' object.onDrawEnd = function(canvas)

  '   canvas.DrawRect(m.game.char.getColOffsetX() + 3, m.game.char.getColOffsetY(), m.game.char.getEntityW() - 6, 1, &hFFFFFFFF)
  '   canvas.DrawRect(m.game.char.getColOffsetX() + 3, m.game.char.getColOffsetY() + m.game.char.getEntityH(), m.game.char.getEntityW() - 6, 1, &hFFFFFFFF)
  '   canvas.DrawRect(m.game.char.getColOffsetX(), m.game.char.getColOffsetY() + 3, 1, m.game.char.getEntityH() - 6, &hFFFFFFFF)
  '   canvas.DrawRect(m.game.char.getColOffsetX() + m.game.char.getEntityW() - 1, m.game.char.getColOffsetY() + 3, 1, m.game.char.getEntityH() - 6, &hFFFFFFFF)

  ' end function
    
end function
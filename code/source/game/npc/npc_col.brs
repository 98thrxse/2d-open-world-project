function npc_col(object)

  object.onCreate = function(args)


  end function


  object.colXY = function()

    ' position
    m.x = m.game.char.getZeroOffsetX()
    m.y = m.game.char.getZeroOffsetY()

  end function


  object.colGen = function()

    ' loading map config to create npc
    for i = 0 to m.game.npc.config.Count() - 1

      if m.colliders[m.game.npc.getEntityName(i).toStr() + "_" + i.toStr()] = invalid
        ' addColliderRectangle
        m.addColliderRectangle(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr(), m.game.npc.getColOffsetX(i), m.game.npc.getColOffsetY(i), m.game.npc.getColW(i), m.game.npc.getColH(i))
      end if

    end for

  end function


  object.onUpdate = function(dt as float)

    m.colXY()
    m.colGen()

  end function

  object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

    if other_collider_name = "char_col_up"
      m.game.char.setNPCCol(collider_name)

    else if other_collider_name = "char_col_down"
      m.game.char.setNPCCol(collider_name)

    else if other_collider_name = "char_col_left"
      m.game.char.setNPCCol(collider_name)

    else if other_collider_name = "char_col_right"
      m.game.char.setNPCCol(collider_name)

    end if

  end function
      
end function
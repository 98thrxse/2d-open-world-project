function npc_col(object)

  object.onCreate = function(args)

    m.colXY()

  end function


  object.colXY = function()
    ' position
    m.x = m.game.screen.GetWidth() / 2 - m.game.char.getEntityPosX()
    m.y = m.game.screen.GetHeight() / 2 - m.game.char.getEntityPosY()
  end function


  object.colGen = function()

    ' loading map config to create npc
    for i = 0 to m.game.npc.config.Count() - 1

      if m.colliders[m.game.npc.config[i].col.name.toStr() + "_" + m.game.npc.config[i].id.toStr()] = invalid
        ' addColliderRectangle
        m.addColliderRectangle(m.game.npc.config[i].col.name.toStr() + "_" + m.game.npc.config[i].id.toStr(), m.game.npc.getColPosX(i), m.game.npc.getColPosY(i), m.game.npc.getColW(i), m.game.npc.getColH(i))
      end if

    end for

  end function


  object.onUpdate = function(dt as float)

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
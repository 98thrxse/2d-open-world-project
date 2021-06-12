function npc_col(object)

  object.onCreate = function(args)

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

    m.colGen()

  end function

  object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

    if other_collider_name = m.game.char.getColUpName()
      m.game.char.setNPCCol(collider_name)

    else if other_collider_name = m.game.char.getColDownName()
      m.game.char.setNPCCol(collider_name)

    else if other_collider_name = m.game.char.getColLeftName()
      m.game.char.setNPCCol(collider_name)

    else if other_collider_name = m.game.char.getColRightName()
      m.game.char.setNPCCol(collider_name)

    end if

  end function
      
end function
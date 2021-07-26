function npc_view(object)

  object.funcName = "npc_view"

  object.onCreate = function(args)

  end function


  object.entityLoad = function(i)

    m.npc_regions = []

    for j = 0 to m.game.npc.config[i].entity.reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr()) = invalid
        ' loadBitmap
        m.game.loadBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr(), "pkg:/media/npc/sprites/" + m.game.npc.getRegElement(i, j).toStr() + ".png")
      end if
      
      ' getBitmap
      npc_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr())
  
      ' roRegion
      npc_region = CreateObject("roRegion", npc_bitmap, 0, 0, npc_bitmap.GetWidth(), npc_bitmap.GetHeight())

      m.npc_regions.push(npc_region)

    end for
    
  end function

  object.entityUnload = function(i)

    for j = 0 to m.game.npc.config[i].entity.reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr()) <> invalid
        ' unloadBitmap
        m.game.unloadBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr())
      end if

    end for

  end function


  object.entityGen = function()

    ' load & add
    for i = 0 to m.game.npc.config.Count() - 1
      if - m.game.map.getEntityOffsetX() <= m.game.npc.getEntityOffsetX(i) + m.game.npc.getEntityW(i) and - m.game.map.getEntityOffsetX() + m.game.screen.GetWidth() >= m.game.npc.getEntityOffsetX(i) and - m.game.map.getEntityOffsetY() <= m.game.npc.getEntityOffsetY(i) + m.game.npc.getEntityH(i) and - m.game.map.getEntityOffsetY() + m.game.screen.GetHeight() >= m.game.npc.getEntityOffsetY(i)
        if m.getImage(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr()) = invalid

          ' load
          m.entityLoad(i)

          ' add
          m.addAnimatedImage(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr(), m.npc_regions, { index: m.game.npc.getIndex(i)
            offset_x: m.game.npc.getEntityOffsetX(i),
            offset_y: m.game.npc.getEntityOffsetY(i)
            scale_x: m.game.npc.getScaleX(i)
            scale_y: m.game.npc.getScaleY(i)
          })
  
        end if

      ' unload & remove
      else if m.getImage(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr()) <> invalid

        ' unload
        m.entityUnload(i)

        ' remove
        m.removeImage(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr())

      end if
      
    end for

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

  object.onUpdate = function(dt as float)

    m.entityGen()
    m.colGen()

  end function
      
end function
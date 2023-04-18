function npc_view(object)

  object.funcName = "npc_view"

  object.onCreate = function(args)

  end function


  object.loadEntity = function(i)

    m.npc_regions = []

    for j = 0 to m.game.npc.config[i].reg.Count() - 1

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

  object.unloadEntity = function(i)

    for j = 0 to m.game.npc.config[i].reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr()) <> invalid
        ' unloadBitmap
        m.game.unloadBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr())
      end if

    end for

  end function

  object.genEntity = function()
    if m.game.npc.config.Count() <> 0

      ' load & add
      for i = 0 to m.game.npc.config.Count() - 1
        if - m.game.map.getOffsetX() <= m.game.npc.getOffsetX(i) + m.game.npc.getSizeW(i) * abs(m.game.npc.getScaleX(i)) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.npc.getOffsetX(i) and - m.game.map.getOffsetY() <= m.game.npc.getOffsetY(i) + m.game.npc.getSizeH(i) * abs(m.game.npc.getScaleY(i)) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.npc.getOffsetY(i)
          if m.getImage(m.game.npc.getName(i).toStr() + "_" + i.toStr()) = invalid

            ' load
            m.loadEntity(i)

            ' add
            m.addAnimatedImage(m.game.npc.getName(i).toStr() + "_" + i.toStr(), m.npc_regions, { index: m.game.npc.getIndex(i)
              offset_x: m.game.npc.getOffsetX(i),
              offset_y: m.game.npc.getOffsetY(i)
              scale_x: m.game.npc.getScaleX(i)
              scale_y: m.game.npc.getScaleY(i)
            })
    
          end if

        ' unload & remove
        else if m.getImage(m.game.npc.getName(i).toStr() + "_" + i.toStr()) <> invalid

          ' remove
          m.removeImage(m.game.npc.getName(i).toStr() + "_" + i.toStr())

          ' unload
          m.unloadEntity(i)

        end if
        
      end for
    end if

  end function


  object.genCol = function()
    if m.game.npc.config.Count() <> 0

      ' add
      for i = 0 to m.game.npc.config.Count() - 1
        if - m.game.map.getOffsetX() <= m.game.npc.getOffsetX(i) + m.game.npc.getSizeW(i) * abs(m.game.npc.getScaleX(i)) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.npc.getOffsetX(i) and - m.game.map.getOffsetY() <= m.game.npc.getOffsetY(i) + m.game.npc.getSizeH(i) * abs(m.game.npc.getScaleY(i)) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.npc.getOffsetY(i)

          if m.getCollider(m.game.npc.getName(i).toStr() + "_" + i.toStr()) = invalid
            ' addColliderRectangle
            m.addColliderRectangle(m.game.npc.getName(i).toStr() + "_" + i.toStr(), m.game.npc.getOffsetX(i), m.game.npc.getOffsetY(i), m.game.npc.getSizeW(i) * abs(m.game.npc.getScaleX(i)), m.game.npc.getSizeH(i) * abs(m.game.npc.getScaleY(i)))
          end if

        ' remove
        else if m.getCollider(m.game.npc.getName(i).toStr() + "_" + i.toStr()) <> invalid

          m.removeCollider(m.game.npc.getName(i).toStr() + "_" + i.toStr())

        end if
        
      end for
    end if

  end function

  object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

    if m.game.getFocusGroup() = "char"
      if other_collider_name = m.game.char.getColUpName()
        m.game.char.setNPCCol(collider_name)

      else if other_collider_name = m.game.char.getColDownName()
        m.game.char.setNPCCol(collider_name)

      else if other_collider_name = m.game.char.getColLeftName()
        m.game.char.setNPCCol(collider_name)

      else if other_collider_name = m.game.char.getColRightName()
        m.game.char.setNPCCol(collider_name)

      end if

    else if m.game.getFocusGroup() = "veh"
      if other_collider_name = m.game.veh.getColUpName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
        m.game.veh.setNPCCol(m.game.char.getVeh().split("_").peek().toInt(), collider_name)

      else if other_collider_name = m.game.veh.getColDownName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
        m.game.veh.setNPCCol(m.game.char.getVeh().split("_").peek().toInt(), collider_name)

      else if other_collider_name = m.game.veh.getColLeftName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
        m.game.veh.setNPCCol(m.game.char.getVeh().split("_").peek().toInt(), collider_name)

      else if other_collider_name = m.game.veh.getColRightName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
        m.game.veh.setNPCCol(m.game.char.getVeh().split("_").peek().toInt(), collider_name)
      end if
    end if

  end function

  object.onUpdate = function(dt as float)

    m.genEntity()
    m.genCol()

  end function
      
end function
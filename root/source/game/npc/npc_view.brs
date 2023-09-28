sub npc_view(object)

  object.funcName = "npc_view"

  object.loadEntity = sub(i as integer)

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
    
  end sub

  object.loadAllEntity = sub()

    if m.npc_regions = invalid then 
      m.npc_regions = []

      for i = 0 to m.game.npc.config.Count() - 1

        m.npc_regions.push(i)
        m.npc_regions[i] = []

        for j = 0 to m.game.npc.config[i].reg.Count() - 1

          if m.game.getBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr()) = invalid
            ' loadBitmap
            m.game.loadBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr(), "pkg:/media/npc/sprites/" + m.game.npc.getRegElement(i, j).toStr() + ".png")
          end if
          
          ' getBitmap
          npc_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr())
      
          ' roRegion
          npc_region = CreateObject("roRegion", npc_bitmap, 0, 0, npc_bitmap.GetWidth(), npc_bitmap.GetHeight())

          m.npc_regions[i].push(npc_region)

        end for
      end for
    end if
    
  end sub

  object.unloadEntity = sub(i as integer)

    for j = 0 to m.game.npc.config[i].reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr()) <> invalid
        ' unloadBitmap
        m.game.unloadBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr())
      end if

    end for

  end sub

  object.unloadAllEntity = sub()
    for i = 0 to m.game.npc.config.Count() - 1
      for j = 0 to m.game.npc.config[i].reg.Count() - 1

        if m.game.getBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr()) <> invalid
          ' unloadBitmap
          m.game.unloadBitmap(m.funcName + "_" + m.game.npc.getRegElement(i, j).toStr())
        end if

      end for
    end for

    m.npc_regions = invalid
  end sub

  object.genEntity = sub()
    if m.game.npc.config.Count() <> 0

      ' load & add
      for i = 0 to m.game.npc.config.Count() - 1
        if - m.game.map.getOffsetX() <= m.game.npc.getOffsetX(i) + m.game.npc.getSizeW(i) * abs(m.game.npc.getScaleX(i)) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.npc.getOffsetX(i) and - m.game.map.getOffsetY() <= m.game.npc.getOffsetY(i) + m.game.npc.getSizeH(i) * abs(m.game.npc.getScaleY(i)) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.npc.getOffsetY(i)
          if m.getImage(m.game.npc.getName(i).toStr() + "_" + i.toStr()) = invalid

            ' load (dynamic)
            ' m.loadEntity(i)

            ' add (dynamic)
            ' m.addAnimatedImage(m.game.npc.getName(i).toStr() + "_" + i.toStr(), m.npc_regions, { index: m.game.npc.getIndex(i)
            '   offset_x: m.game.npc.getOffsetX(i),
            '   offset_y: m.game.npc.getOffsetY(i)
            '   scale_x: m.game.npc.getScaleX(i)
            '   scale_y: m.game.npc.getScaleY(i)
            ' })

            ' add (all)
            m.addAnimatedImage(m.game.npc.getName(i).toStr() + "_" + i.toStr(), m.npc_regions[i], { index: m.game.npc.getIndex(i)
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
          ' m.unloadEntity(i)

        end if
        
      end for
    end if

  end sub


  object.genCol = sub()
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

  end sub

  object.onCollision = sub(collider_name as string, other_collider_name as string, other_instance as object)

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

  end sub

  object.onUpdate = sub(dt as float)
    m.loadAllEntity()
    m.genEntity()
    m.genCol()
  end sub

  object.onDestroy = sub()
    m.unloadAllEntity()
  end sub
      
end sub
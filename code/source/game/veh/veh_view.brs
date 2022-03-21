function veh_view(object)

  object.funcName = "veh_view"

  object.onCreate = function(args)
  
  end function


  object.entityLoad = function(i)

    m.veh_regions = []

    for j = 0 to m.game.veh.config[i].reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.veh.getRegElement(i, j).toStr()) = invalid
        ' loadBitmap
        m.game.loadBitmap(m.funcName + "_" + m.game.veh.getRegElement(i, j).toStr(), "pkg:/media/veh/sprites/" + m.game.veh.getRegElement(i, j).toStr() + ".png")
      end if
      
      ' getBitmap
      veh_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.veh.getRegElement(i, j).toStr())
  
      ' roRegion
      veh_region = CreateObject("roRegion", veh_bitmap, 0, 0, veh_bitmap.GetWidth(), veh_bitmap.GetHeight())

      m.veh_regions.push(veh_region)

    end for
    
  end function

  object.entityUnload = function(i)

    for j = 0 to m.game.veh.config[i].reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.veh.getRegElement(i, j).toStr()) <> invalid
        ' unloadBitmap
        m.game.unloadBitmap(m.funcName + "_" + m.game.veh.getRegElement(i, j).toStr())
      end if

    end for

  end function

  object.entityGen = function()

    if m.game.veh.config.Count() <> 0
      ' load & add
      for i = 0 to m.game.veh.config.Count() - 1
        if m.game.veh.getScaleX(i) < 0.0
          if - m.game.map.getOffsetX() <= m.game.veh.getEntityX(i) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() + m.game.veh.getEntityW(i) * abs(m.game.veh.getScaleX(i)) >= m.game.veh.getEntityX(i) and - m.game.map.getOffsetY() <= m.game.veh.getEntityY(i) + m.game.veh.getEntityH(i) * abs(m.game.veh.getScaleY(i)) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.veh.getEntityY(i)
            if m.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()) = invalid
              ' load
              m.entityLoad(i)

              ' add
              m.addAnimatedImage(m.game.veh.getName(i).toStr() + "_" + i.toStr(), m.veh_regions, { index: m.game.veh.getIndex(i)
                offset_x: m.game.veh.getEntityX(i),
                offset_y: m.game.veh.getEntityY(i)
                scale_x: m.game.veh.getScaleX(i)
                scale_y: m.game.veh.getScaleY(i)
                alpha: m.game.veh.getAlpha(i)
              })
      
            end if

          ' unload & remove
          else if m.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()) <> invalid

            ' remove
            m.removeImage(m.game.veh.getName(i).toStr() + "_" + i.toStr())

            ' unload
            m.entityUnload(i)

          end if

        else
          if - m.game.map.getOffsetX() <= m.game.veh.getEntityX(i) + m.game.veh.getEntityW(i) * abs(m.game.veh.getScaleX(i)) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.veh.getEntityX(i) and - m.game.map.getOffsetY() <= m.game.veh.getEntityY(i) + m.game.veh.getEntityH(i) * abs(m.game.veh.getScaleY(i)) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.veh.getEntityY(i)
            if m.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()) = invalid

              ' load
              m.entityLoad(i)

              ' add
              m.addAnimatedImage(m.game.veh.getName(i).toStr() + "_" + i.toStr(), m.veh_regions, { index: m.game.veh.getIndex(i)
                offset_x: m.game.veh.getEntityX(i)
                offset_y: m.game.veh.getEntityY(i)
                scale_x: m.game.veh.getScaleX(i)
                scale_y: m.game.veh.getScaleY(i)
                alpha: m.game.veh.getAlpha(i)
              })
      
            end if

          ' unload & remove
          else if m.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()) <> invalid

            ' remove
            m.removeImage(m.game.veh.getName(i).toStr() + "_" + i.toStr())

            ' unload
            m.entityUnload(i)

          end if
        end if
        
      end for
    end if

  end function


  object.colGen = function()
    if m.game.veh.config.Count() <> 0

      for i = 0 to m.game.veh.config.Count() - 1
      ' load & add
        if - m.game.map.getOffsetX() <= m.game.veh.getColX(i) + m.game.veh.getColW(i) * abs(m.game.veh.getScaleX(i)) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.veh.getColX(i) and - m.game.map.getOffsetY() <= m.game.veh.getColY(i) + m.game.veh.getColH(i) * abs(m.game.veh.getScaleY(i)) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.veh.getColY(i) and m.game.char.getVeh() <> m.game.veh.getName(i).toStr() + "_" + i.toStr()
          
          if m.colliders[m.game.veh.getName(i).toStr() + "_" + i.toStr()] = invalid
            ' addColliderRectangle
            m.addColliderRectangle(m.game.veh.getName(i).toStr() + "_" + i.toStr(), m.game.veh.getColX(i), m.game.veh.getColY(i), m.game.veh.getColW(i), m.game.veh.getColH(i))
          end if

        ' unload & remove
        else if m.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()) <> invalid or m.game.char.getVeh() = m.game.veh.getName(i).toStr() + "_" + i.toStr()

          m.removeCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr())

        end if

      end for
    end if

  end function

  object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)
    
    if other_collider_name = m.game.char.getColUpName()
      m.game.char.setVehCol(collider_name)
      m.game.char.setColUp(true)

    else if other_collider_name = m.game.char.getColDownName()
      m.game.char.setVehCol(collider_name)
      m.game.char.setColDown(true)

    else if other_collider_name = m.game.char.getColLeftName()
      m.game.char.setVehCol(collider_name)
      m.game.char.setColLeft(true)

    else if other_collider_name = m.game.char.getColRightName()
      m.game.char.setVehCol(collider_name)
      m.game.char.setColRight(true)

    end if

  end function

  object.onUpdate = function(dt as float)

    m.entityGen()
    m.colGen()

  end function

end function
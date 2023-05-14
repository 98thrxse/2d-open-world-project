sub veh_view(object)

  object.funcName = "veh_view"

  object.loadEntity = sub(i as integer)

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
    
  end sub

  object.unloadEntity = sub(i as integer)

    for j = 0 to m.game.veh.config[i].reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.veh.getRegElement(i, j).toStr()) <> invalid
        ' unloadBitmap
        m.game.unloadBitmap(m.funcName + "_" + m.game.veh.getRegElement(i, j).toStr())
      end if

    end for

  end sub

  object.genEntity = sub()

    if m.game.veh.config.Count() <> 0
      ' load & add
      for i = 0 to m.game.veh.config.Count() - 1
        if m.game.veh.getScaleX(i) < 0.0
          if - m.game.map.getOffsetX() <= m.game.veh.getEntityX(i) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() + m.game.veh.getEntityW(i) * abs(m.game.veh.getScaleX(i)) >= m.game.veh.getEntityX(i) and - m.game.map.getOffsetY() <= m.game.veh.getEntityY(i) + m.game.veh.getEntityH(i) * abs(m.game.veh.getScaleY(i)) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.veh.getEntityY(i)
            if m.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()) = invalid
              ' load
              m.loadEntity(i)

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
            ' m.unloadEntity(i)

          end if

        else
          if - m.game.map.getOffsetX() <= m.game.veh.getEntityX(i) + m.game.veh.getEntityW(i) * abs(m.game.veh.getScaleX(i)) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.veh.getEntityX(i) and - m.game.map.getOffsetY() <= m.game.veh.getEntityY(i) + m.game.veh.getEntityH(i) * abs(m.game.veh.getScaleY(i)) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.veh.getEntityY(i)
            if m.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()) = invalid

              ' load
              m.loadEntity(i)

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
            ' m.unloadEntity(i)

          end if
        end if
        
      end for
    end if

  end sub


  object.genCol = sub()
    if m.game.veh.config.Count() <> 0

      for i = 0 to m.game.veh.config.Count() - 1
      ' load & add
        if - m.game.map.getOffsetX() <= m.game.veh.getColX(i) + m.game.veh.getColW(i) * abs(m.game.veh.getScaleX(i)) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.veh.getColX(i) and - m.game.map.getOffsetY() <= m.game.veh.getColY(i) + m.game.veh.getColH(i) * abs(m.game.veh.getScaleY(i)) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.veh.getColY(i)
          
          if m.game.char.getVeh() <> m.game.veh.getName(i).toStr() + "_" + i.toStr()

            if m.getCollider(m.game.veh.getColUpName(i).toStr() + "_" + i.toStr()) <> invalid
              m.removeCollider(m.game.veh.getColUpName(i).toStr() + "_" + i.toStr())
            end if
            
            if m.getCollider(m.game.veh.getColDownName(i).toStr() + "_" + i.toStr()) <> invalid
              m.removeCollider(m.game.veh.getColDownName(i).toStr() + "_" + i.toStr())
            end if
            
            if m.getCollider(m.game.veh.getColLeftName(i).toStr() + "_" + i.toStr()) <> invalid
              m.removeCollider(m.game.veh.getColLeftName(i).toStr() + "_" + i.toStr())
            end if

            if m.getCollider(m.game.veh.getColRightName(i).toStr() + "_" + i.toStr()) <> invalid
              m.removeCollider(m.game.veh.getColRightName(i).toStr() + "_" + i.toStr())
            end if

            if m.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()) = invalid
              ' addColliderRectangle
              m.addColliderRectangle(m.game.veh.getName(i).toStr() + "_" + i.toStr(), m.game.veh.getColX(i), m.game.veh.getColY(i), m.game.veh.getColW(i), m.game.veh.getColH(i))
            end if

          else

            if m.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()) <> invalid
              m.removeCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr())
            end if

            ' addColliderRectangle
            if m.getCollider(m.game.veh.getColUpName(i).toStr() + "_" + i.toStr()) = invalid
              m.addColliderRectangle(m.game.veh.getColUpName(i).toStr() + "_" + i.toStr(), m.game.veh.getColX(i) + (m.game.veh.getUpSpeed(i) + 1), m.game.veh.getColY(i), m.game.veh.getColW(i) * abs(m.game.veh.getScaleX(i)) - (m.game.veh.getDownSpeed(i) + 1) * 2, m.game.veh.getUpSpeed(i) + 1)
            end if
            
            if m.getCollider(m.game.veh.getColDownName(i).toStr() + "_" + i.toStr()) = invalid
              m.addColliderRectangle(m.game.veh.getColDownName(i).toStr() + "_" + i.toStr(), m.game.veh.getColX(i) + (m.game.veh.getDownSpeed(i) + 1), m.game.veh.getColY(i) + m.game.veh.getColH(i) * abs(m.game.veh.getScaleY(i)) - (m.game.veh.getDownSpeed(i) + 1), m.game.veh.getColW(i) * abs(m.game.veh.getScaleX(i)) - (m.game.veh.getDownSpeed(i) + 1) * 2, m.game.veh.getDownSpeed(i) + 1)
            end if
            
            if m.getCollider(m.game.veh.getColLeftName(i).toStr() + "_" + i.toStr()) = invalid
              m.addColliderRectangle(m.game.veh.getColLeftName(i).toStr() + "_" + i.toStr(), m.game.veh.getColX(i), m.game.veh.getColY(i) + (m.game.veh.getLeftSpeed(i) + 1), m.game.veh.getLeftSpeed(i) + 1, m.game.veh.getColH(i) * abs(m.game.veh.getScaleY(i)) - (m.game.veh.getLeftSpeed(i) + 1) * 2)
            end if

            if m.getCollider(m.game.veh.getColRightName(i).toStr() + "_" + i.toStr()) = invalid
              m.addColliderRectangle(m.game.veh.getColRightName(i).toStr() + "_" + i.toStr(), m.game.veh.getColX(i) + m.game.veh.getColW(i) * abs(m.game.veh.getScaleX(i)) - (m.game.veh.getRightSpeed(i) + 1), m.game.veh.getColY(i) + (m.game.veh.getRightSpeed(i) + 1), m.game.veh.getRightSpeed(i) + 1, m.game.veh.getColH(i) * abs(m.game.veh.getScaleY(i)) - (m.game.veh.getRightSpeed(i) + 1) * 2)
            end if
          end if

        ' unload & remove
        else if m.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()) <> invalid

          m.removeCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr())
          
        end if

      end for
    end if

  end sub

  object.onSelfCollision = sub()
    if m.game.char.getVeh() <> invalid
      for i = 0 to m.game.veh.config.Count() - 1
        if m.game.char.getVeh() <> m.game.veh.getName(i).toStr() + "_" + i.toStr()

          if (m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) >= m.game.veh.getColX(i) and m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) <= m.game.veh.getColX(i) + m.game.veh.getColW(i)) or (m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getColW(m.game.char.getVeh().split("_").peek().toInt()) >= m.game.veh.getColX(i) and m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) <= m.game.veh.getColX(i) + m.game.veh.getColW(i))
            if m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) - (m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) > m.game.veh.getColY(i) and m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) - (m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) < m.game.veh.getColY(i) + m.game.veh.getColH(i)
              m.game.veh.setColUp(m.game.char.getVeh().split("_").peek().toInt(), true)
            else if m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getColH(m.game.char.getVeh().split("_").peek().toInt()) + (m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) > m.game.veh.getColY(i) and m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getColH(m.game.char.getVeh().split("_").peek().toInt()) + (m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) < m.game.veh.getColY(i) + m.game.veh.getColH(i)
              m.game.veh.setColDown(m.game.char.getVeh().split("_").peek().toInt(), true)
            end if
          end if

          if (m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) >= m.game.veh.getColY(i) and m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) <= m.game.veh.getColY(i) + m.game.veh.getColH(i)) or (m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getColH(m.game.char.getVeh().split("_").peek().toInt()) >= m.game.veh.getColY(i) and m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) <= m.game.veh.getColY(i) + m.game.veh.getColH(i))
            if m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) - (m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) > m.game.veh.getColX(i) and m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) - (m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) < m.game.veh.getColX(i) + m.game.veh.getColW(i)
              m.game.veh.setColLeft(m.game.char.getVeh().split("_").peek().toInt(), true)
            else if m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getColW(m.game.char.getVeh().split("_").peek().toInt()) + (m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) > m.game.veh.getColX(i) and m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getColW(m.game.char.getVeh().split("_").peek().toInt()) + (m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) < m.game.veh.getColX(i) + m.game.veh.getColW(i)
              m.game.veh.setColRight(m.game.char.getVeh().split("_").peek().toInt(), true)
            end if
          end if

        end if
      end for
    end if
  end sub

  object.onCollision = sub(collider_name as string, other_collider_name as string, other_instance as object)
    
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

  end sub

  object.onUpdate = sub(dt as float)

    m.genEntity()
    m.genCol()
    m.onSelfCollision()

  end sub

  object.onDestroy = sub()
    for i = 0 to m.game.veh.config.Count() - 1
      m.unloadEntity(i)
    end for
    
  end sub

end sub
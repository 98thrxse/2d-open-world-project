function veh_view(object)

  object.funcName = "veh_view"

  object.onCreate = function(args)

    ' ' loadFont
    ' m.game.loadFont("VT323-21", "VT323", 21, false, false)

    ' ' getFont
    ' m.veh_font = m.game.getFont("VT323-21")
  
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
          if - m.game.map.getOffsetX() <= m.game.veh.getOffsetX(i) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() + m.game.veh.getSizeW(i) * abs(m.game.veh.getScaleX(i)) >= m.game.veh.getOffsetX(i) and - m.game.map.getOffsetY() <= m.game.veh.getOffsetY(i) + m.game.veh.getSizeH(i) * abs(m.game.veh.getScaleY(i)) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.veh.getOffsetY(i)
            if m.getImage(m.game.veh.getEntityName(i).toStr() + "_" + i.toStr()) = invalid
              ' load
              m.entityLoad(i)

              ' add
              m.addAnimatedImage(m.game.veh.getEntityName(i).toStr() + "_" + i.toStr(), m.veh_regions, { index: m.game.veh.getIndex(i)
                offset_x: m.game.veh.getOffsetX(i),
                offset_y: m.game.veh.getOffsetY(i)
                scale_x: m.game.veh.getScaleX(i)
                scale_y: m.game.veh.getScaleY(i)
              })
      
            end if

          ' unload & remove
          else if m.getImage(m.game.veh.getEntityName(i).toStr() + "_" + i.toStr()) <> invalid

            ' remove
            m.removeImage(m.game.veh.getEntityName(i).toStr() + "_" + i.toStr())

            ' unload
            m.entityUnload(i)

          end if

        else
          if - m.game.map.getOffsetX() <= m.game.veh.getOffsetX(i) + m.game.veh.getSizeW(i) * abs(m.game.veh.getScaleX(i)) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.veh.getOffsetX(i) and - m.game.map.getOffsetY() <= m.game.veh.getOffsetY(i) + m.game.veh.getSizeH(i) * abs(m.game.veh.getScaleY(i)) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.veh.getOffsetY(i)
            if m.getImage(m.game.veh.getEntityName(i).toStr() + "_" + i.toStr()) = invalid

              ' load
              m.entityLoad(i)

              ' add
              m.addAnimatedImage(m.game.veh.getEntityName(i).toStr() + "_" + i.toStr(), m.veh_regions, { index: m.game.veh.getIndex(i)
                offset_x: m.game.veh.getOffsetX(i),
                offset_y: m.game.veh.getOffsetY(i)
                scale_x: m.game.veh.getScaleX(i)
                scale_y: m.game.veh.getScaleY(i)
              })
      
            end if

          ' unload & remove
          else if m.getImage(m.game.veh.getEntityName(i).toStr() + "_" + i.toStr()) <> invalid

            ' remove
            m.removeImage(m.game.veh.getEntityName(i).toStr() + "_" + i.toStr())

            ' unload
            m.entityUnload(i)

          end if
        end if
        
      end for
    end if

  end function


  object.colGen = function()
    if m.game.veh.config.Count() <> 0

      ' add
      for i = 0 to m.game.veh.config.Count() - 1
        if - m.game.map.getOffsetX() <= m.game.veh.getOffsetX(i) + m.game.veh.getSizeW(i) * abs(m.game.veh.getScaleX(i)) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.veh.getOffsetX(i) and - m.game.map.getOffsetY() <= m.game.veh.getOffsetY(i) + m.game.veh.getSizeH(i) * abs(m.game.veh.getScaleY(i)) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.veh.getOffsetY(i)

          ' addColliderRectangle
          if m.colliders[m.game.veh.getColUpName(i).toStr() + "_" + i.toStr()] = invalid
            m.addColliderRectangle(m.game.veh.getColUpName(i).toStr() + "_" + i.toStr(), m.game.veh.getOffsetX(i) + (m.game.veh.getUpSpeed(i) + 1), m.game.veh.getOffsetY(i), m.game.veh.getSizeW(i) * abs(m.game.veh.getScaleX(i)) - (m.game.veh.getUpSpeed(i) + 1) * 2, m.game.veh.getUpSpeed(i) + 1)
          end if

          if m.colliders[m.game.veh.getColDownName(i).toStr() + "_" + i.toStr()] = invalid
            m.addColliderRectangle(m.game.veh.getColDownName(i).toStr() + "_" + i.toStr(), m.game.veh.getOffsetX(i) + (m.game.veh.getDownSpeed(i) + 1), m.game.veh.getOffsetY(i) + m.game.veh.getSizeH(i) * abs(m.game.veh.getScaleY(i)) - (m.game.veh.getDownSpeed(i) + 1), m.game.veh.getSizeW(i) * abs(m.game.veh.getScaleX(i)) - (m.game.veh.getDownSpeed(i) + 1) * 2, m.game.veh.getDownSpeed(i) + 1)
          end if

          if m.colliders[m.game.veh.getColLeftName(i).toStr() + "_" + i.toStr()] = invalid
            m.addColliderRectangle(m.game.veh.getColLeftName(i).toStr() + "_" + i.toStr(), m.game.veh.getOffsetX(i), m.game.veh.getOffsetY(i) + (m.game.veh.getLeftSpeed(i) + 1), m.game.veh.getLeftSpeed(i) + 1, m.game.veh.getSizeH(i) * abs(m.game.veh.getScaleY(i)) - (m.game.veh.getLeftSpeed(i) + 1) * 2)
          end if

          if m.colliders[m.game.veh.getColRightName(i).toStr() + "_" + i.toStr()] = invalid
            m.addColliderRectangle(m.game.veh.getColRightName(i).toStr() + "_" + i.toStr(), m.game.veh.getOffsetX(i) + m.game.veh.getSizeW(i) * abs(m.game.veh.getScaleX(i)) - (m.game.veh.getRightSpeed(i) + 1), m.game.veh.getOffsetY(i) + (m.game.veh.getRightSpeed(i) + 1), m.game.veh.getRightSpeed(i) + 1, m.game.veh.getSizeH(i) * abs(m.game.veh.getScaleY(i)) - (m.game.veh.getRightSpeed(i) + 1) * 2)
          end if

        ' remove
        else
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

        end if

      end for
    end if

  end function

  object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

    if m.game.getFocusGroup() = "char"

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

    end if

    ' if m.game.getFocusGroup() = "veh"

    '   for i = 0 to m.game.veh.config.Count() - 1
    '     print m.game.veh.getColUpName(i).toStr() + "_" + i.toStr()
    '     print collider_name

    '     if collider_name = m.game.veh.getColUpName(i).toStr() + "_" + i.toStr()
    '       m.game.veh.setColUp(m.game.char.getVeh().split("_").peek().toInt(), true)
    '       print "stas"

    '     else if collider_name = m.game.veh.getColDownName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
    '       m.game.veh.setColDown(m.game.char.getVeh().split("_").peek().toInt(), true)
    '       print "stas"

    '     else if collider_name = m.game.veh.getColLeftName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
    '       m.game.veh.setColLeft(m.game.char.getVeh().split("_").peek().toInt(), true)
    '       print "stas"

    '     else if collider_name = m.game.veh.getColRightName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
    '       m.game.veh.setColRight(m.game.char.getVeh().split("_").peek().toInt(), true)
    '       print "stas"

    '     end if
    '   end for
    ' end if

  end function

  object.onUpdate = function(dt as float)

    m.entityGen()
    m.colGen()

  end function

  object.onDrawEnd = function(canvas)
      
    ' test
    for i = 0 to m.game.veh.config.Count() - 1
      canvas.DrawRect(m.game.veh.getOffsetX(i) + m.game.map.getOffsetX() + (m.game.veh.getUpSpeed(i) + 1), m.game.veh.getOffsetY(i) + m.game.map.getOffsetY(), m.game.veh.getSizeW(i) * abs(m.game.veh.getScaleX(i)) - (m.game.veh.getUpSpeed(i) + 1) * 2, m.game.veh.getUpSpeed(i) + 1, &hFFFFFFFF)
      canvas.DrawRect(m.game.veh.getOffsetX(i) + m.game.map.getOffsetX() + (m.game.veh.getDownSpeed(i) + 1), m.game.veh.getOffsetY(i) + m.game.veh.getSizeH(i) * abs(m.game.veh.getScaleY(i)) + m.game.map.getOffsetY() - (m.game.veh.getDownSpeed(i) + 1), m.game.veh.getSizeW(i) * abs(m.game.veh.getScaleX(i)) - (m.game.veh.getDownSpeed(i) + 1) * 2, m.game.veh.getDownSpeed(i) + 1, &hFFFFFFFF)
      canvas.DrawRect(m.game.veh.getOffsetX(i) + m.game.map.getOffsetX(), m.game.veh.getOffsetY(i) + m.game.map.getOffsetY() + (m.game.veh.getLeftSpeed(i) + 1), m.game.veh.getLeftSpeed(i) + 1, m.game.veh.getSizeH(i) * abs(m.game.veh.getScaleY(i)) - (m.game.veh.getLeftSpeed(i) + 1) * 2, &hFFFFFFFF)
      canvas.DrawRect(m.game.veh.getOffsetX(i) + m.game.veh.getSizeW(i) * abs(m.game.veh.getScaleX(i)) + m.game.map.getOffsetX() - (m.game.veh.getRightSpeed(i) + 1), m.game.veh.getOffsetY(i) + m.game.map.getOffsetY() + (m.game.veh.getRightSpeed(i) + 1), m.game.veh.getRightSpeed(i) + 1, m.game.veh.getSizeH(i) * abs(m.game.veh.getScaleY(i)) - (m.game.veh.getRightSpeed(i) + 1) * 2, &hFFFFFFFF)
    end for

  end function

end function
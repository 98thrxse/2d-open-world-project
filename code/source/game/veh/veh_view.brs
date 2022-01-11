function veh_view(object)

  object.funcName = "veh_view"

  object.onCreate = function(args)

    ' loadFont
    m.game.loadFont("VT323-21", "VT323", 21, false, false)

    ' getFont
    m.veh_font = m.game.getFont("VT323-21")
  
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
        if - m.game.map.getOffsetX() <= m.game.veh.getOffsetX(i) + m.game.veh.getSizeW(i) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.veh.getOffsetX(i) and - m.game.map.getOffsetY() <= m.game.veh.getOffsetY(i) + m.game.veh.getSizeH(i) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.veh.getOffsetY(i)
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
          
          ' unload
          m.entityUnload(i)

          ' remove
          m.removeImage(m.game.veh.getEntityName(i).toStr() + "_" + i.toStr())

        end if
        
      end for
    end if

  end function


  object.colGen = function()
    if m.game.veh.config.Count() <> 0

      ' add
      for i = 0 to m.game.veh.config.Count() - 1
        if - m.game.map.getOffsetX() <= m.game.veh.getOffsetX(i) + m.game.veh.getSizeW(i) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.veh.getOffsetX(i) and - m.game.map.getOffsetY() <= m.game.veh.getOffsetY(i) + m.game.veh.getSizeH(i) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.veh.getOffsetY(i)

          ' addColliderRectangle
          if m.colliders[m.game.veh.getColUpName(i).toStr() + "_" + i.toStr()] = invalid
            m.addColliderRectangle(m.game.veh.getColUpName(i).toStr() + "_" + i.toStr(), m.game.veh.getOffsetX(i), m.game.veh.getOffsetY(i), m.game.veh.getSizeW(i), 5)
          end if

          if m.colliders[m.game.veh.getColDownName(i).toStr() + "_" + i.toStr()] = invalid
            m.addColliderRectangle(m.game.veh.getColDownName(i).toStr() + "_" + i.toStr(), m.game.veh.getOffsetX(i), m.game.veh.getOffsetY(i) + m.game.veh.getSizeH(i), m.game.veh.getSizeW(i), 5)
          end if

          if m.colliders[m.game.veh.getColLeftName(i).toStr() + "_" + i.toStr()] = invalid
            m.addColliderRectangle(m.game.veh.getColLeftName(i).toStr() + "_" + i.toStr(), m.game.veh.getOffsetX(i), m.game.veh.getOffsetY(i), 5, m.game.veh.getSizeH(i))
          end if

          if m.colliders[m.game.veh.getColRightName(i).toStr() + "_" + i.toStr()] = invalid
            m.addColliderRectangle(m.game.veh.getColRightName(i).toStr() + "_" + i.toStr(), m.game.veh.getOffsetX(i) + m.game.veh.getSizeW(i), m.game.veh.getOffsetY(i), 5, m.game.veh.getSizeH(i))
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

  object.onDrawEnd = function(canvas)
      
    if m.game.veh.config.Count() <> 0 and m.game.char.getVehCol() <> invalid and m.game.getFocusGroup() <> "veh"
      if m.game.veh.getScaleX(m.game.char.getVehCol().split("_").peek().toInt()) <> 1.0
        DrawText(canvas, "ENTER?", m.game.veh.getOffsetX(m.game.char.getVehCol().split("_").peek().toInt()) + m.game.map.getOffsetX() - m.game.veh.getSizeW(m.game.char.getVehCol().split("_").peek().toInt()) / 2 + 3, m.game.veh.getOffsetY(m.game.char.getVehCol().split("_").peek().toInt()) + m.game.map.getOffsetY() + m.game.veh.getSizeH(m.game.char.getVehCol().split("_").peek().toInt()) / 3 + 3, m.veh_font, "center", &h000000FF)
        DrawText(canvas, "ENTER?", m.game.veh.getOffsetX(m.game.char.getVehCol().split("_").peek().toInt()) + m.game.map.getOffsetX() - m.game.veh.getSizeW(m.game.char.getVehCol().split("_").peek().toInt()) / 2, m.game.veh.getOffsetY(m.game.char.getVehCol().split("_").peek().toInt()) + m.game.map.getOffsetY() + m.game.veh.getSizeH(m.game.char.getVehCol().split("_").peek().toInt()) / 3, m.veh_font, "center", &hFF0000FF)
      else
        DrawText(canvas, "ENTER?", m.game.veh.getOffsetX(m.game.char.getVehCol().split("_").peek().toInt()) + m.game.map.getOffsetX() + m.game.veh.getSizeW(m.game.char.getVehCol().split("_").peek().toInt()) / 2 + 3, m.game.veh.getOffsetY(m.game.char.getVehCol().split("_").peek().toInt()) + m.game.map.getOffsetY() + m.game.veh.getSizeH(m.game.char.getVehCol().split("_").peek().toInt()) / 3 + 3, m.veh_font, "center", &h000000FF)
        DrawText(canvas, "ENTER?", m.game.veh.getOffsetX(m.game.char.getVehCol().split("_").peek().toInt()) + m.game.map.getOffsetX() + m.game.veh.getSizeW(m.game.char.getVehCol().split("_").peek().toInt()) / 2, m.game.veh.getOffsetY(m.game.char.getVehCol().split("_").peek().toInt()) + m.game.map.getOffsetY() + m.game.veh.getSizeH(m.game.char.getVehCol().split("_").peek().toInt()) / 3, m.veh_font, "center", &hFF0000FF)
      end if
    end if

    ' test
    for i = 0 to m.game.veh.config.Count() - 1
      canvas.DrawRect(m.game.veh.getOffsetX(i) + m.game.map.getOffsetX(), m.game.veh.getOffsetY(i) + m.game.map.getOffsetY(), m.game.veh.getSizeW(i), 1, &hFFFFFFFF)
      canvas.DrawRect(m.game.veh.getOffsetX(i) + m.game.map.getOffsetX(), m.game.veh.getOffsetY(i) + m.game.veh.getSizeH(i) + m.game.map.getOffsetY(), m.game.veh.getSizeW(i), 1, &hFFFFFFFF)
      canvas.DrawRect(m.game.veh.getOffsetX(i) + m.game.map.getOffsetX(), m.game.veh.getOffsetY(i) + m.game.map.getOffsetY(), 1, m.game.veh.getSizeH(i), &hFFFFFFFF)
      canvas.DrawRect(m.game.veh.getOffsetX(i) + m.game.veh.getSizeW(i) + m.game.map.getOffsetX(), m.game.veh.getOffsetY(i) + m.game.map.getOffsetY(), 1, m.game.veh.getSizeH(i), &hFFFFFFFF)
    end for

  end function

end function
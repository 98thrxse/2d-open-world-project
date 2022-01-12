function marker_transition(object)

  object.funcName = "marker_transition"

  object.onCreate = function(args)

    ' loadFont
    m.game.loadFont("VT323-21", "VT323", 21, false, false)
    
    ' getFont
    m.transition_font = m.game.getFont("VT323-21")

  end function

  object.entityLoad = function(i)

    m.marker_regions = []

    for j = 0 to m.game.marker.config[i].reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.marker.getRegElement(i, j).toStr()) = invalid
        ' loadBitmap
        m.game.loadBitmap(m.funcName + "_" + m.game.marker.getRegElement(i, j).toStr(), "pkg:/media/marker/sprites/" + m.game.marker.getRegElement(i, j).toStr() + ".png")
      end if

      ' getBitmap
      marker_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.marker.getRegElement(i, j).toStr())
  
      ' roRegion
      marker_region = CreateObject("roRegion", marker_bitmap, 0, 0, marker_bitmap.GetWidth(), marker_bitmap.GetHeight())

      m.marker_regions.push(marker_region)

    end for

  end function

  object.entityUnload = function(i)

    for j = 0 to m.game.marker.config[i].reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.marker.getRegElement(i, j).toStr()) <> invalid
        ' unloadBitmap
        m.game.unloadBitmap(m.funcName + "_" + m.game.marker.getRegElement(i, j).toStr())
      end if

    end for
  
  end function

  object.entityGen = function()

    if m.game.marker.config.Count() <> 0

      ' load & add
      for i = 0 to m.game.marker.config.Count() - 1
        if - m.game.map.getOffsetX() <= m.game.marker.getOffsetX(i) + m.game.marker.getSizeW(i) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.marker.getOffsetX(i) and - m.game.map.getOffsetY() <= m.game.marker.getOffsetY(i) + m.game.marker.getSizeH(i) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.marker.getOffsetY(i)
          if m.getImage(m.game.marker.getName(i).toStr() + "_" + i.toStr()) = invalid
                  
            ' load
            m.entityLoad(i)

            ' add
            m.addAnimatedImage(m.game.marker.getName(i).toStr() + "_" + i.toStr(), m.marker_regions, { index: m.game.marker.getIndex(i)
                offset_x: m.game.marker.getOffsetX(i),
                offset_y: m.game.marker.getOffsetY(i),
                alpha: m.game.marker.getAlpha(i)
            })
              
          end if

        ' unload & remove
        else if m.getImage(m.game.marker.getName(i).toStr() + "_" + i.toStr()) <> invalid

          ' remove
          m.removeImage(m.game.marker.getName(i).toStr() + "_" + i.toStr())

          ' unload
          m.entityUnload(i)

        end if
      end for
    end if

  end function

  object.colGen = function()

    if m.game.marker.config.Count() <> 0

      ' load & add
      for i = 0 to m.game.marker.config.Count() - 1
        if - m.game.map.getOffsetX() <= m.game.marker.getOffsetX(i) + m.game.marker.getSizeW(i) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.marker.getOffsetX(i) and - m.game.map.getOffsetY() <= m.game.marker.getOffsetY(i) + m.game.marker.getSizeH(i) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.marker.getOffsetY(i)

          if m.colliders[m.game.marker.getName(i).toStr() + "_" + i.toStr()] = invalid
            ' addColliderRectangle
            m.addColliderRectangle(m.game.marker.getName(i).toStr() + "_" + i.toStr(), m.game.marker.getOffsetX(i), m.game.marker.getOffsetY(i), m.game.marker.getSizeW(i), m.game.marker.getSizeH(i))
          end if

        ' unload & remove
        else if m.getCollider(m.game.marker.getName(i).toStr() + "_" + i.toStr()) <> invalid

          m.removeCollider(m.game.marker.getName(i).toStr() + "_" + i.toStr())

        end if
      end for
    end if

  end function
    
  object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)
  
    if other_collider_name = m.game.char.getColUpName()
      m.game.char.setMarkerCol(collider_name)

    else if other_collider_name = m.game.char.getColDownName()
      m.game.char.setMarkerCol(collider_name)

    else if other_collider_name = m.game.char.getColLeftName()
      m.game.char.setMarkerCol(collider_name)

    else if other_collider_name = m.game.char.getColRightName()
      m.game.char.setMarkerCol(collider_name)

    end if
  
  end function

  object.onUpdate = function(dt as float)

    m.entityGen()
    m.colGen()

  end function

  object.onDrawEnd = function(canvas)
    
    if m.game.marker.config.Count() <> 0 and m.game.char.getMarkerCol() <> invalid and m.game.getFocusGroup() = "char"
      DrawText(canvas, "ENTER?", m.game.marker.getOffsetX(m.game.char.getMarkerCol().split("_").peek().toInt()) + m.game.map.getOffsetX() + m.game.marker.getSizeW(m.game.char.getMarkerCol().split("_").peek().toInt()) / 2 + 3, m.game.marker.getOffsetY(m.game.char.getMarkerCol().split("_").peek().toInt()) + m.game.map.getOffsetY() + m.game.marker.getSizeH(m.game.char.getMarkerCol().split("_").peek().toInt()) / 3 + 3, m.transition_font, "center", &h000000FF)
      DrawText(canvas, "ENTER?", m.game.marker.getOffsetX(m.game.char.getMarkerCol().split("_").peek().toInt()) + m.game.map.getOffsetX() + m.game.marker.getSizeW(m.game.char.getMarkerCol().split("_").peek().toInt()) / 2, m.game.marker.getOffsetY(m.game.char.getMarkerCol().split("_").peek().toInt()) + m.game.map.getOffsetY() + m.game.marker.getSizeH(m.game.char.getMarkerCol().split("_").peek().toInt()) / 3, m.transition_font, "center", &hFF0000FF)
    end if

  end function

end function
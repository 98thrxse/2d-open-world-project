sub marker_transition(object)

  object.funcName = "marker_transition"

  object.onCreate = sub(args as object)

    ' loadFont
    m.game.loadFont("VT323-21", "VT323", 21, false, false)
    
    ' getFont
    m.transition_font = m.game.getFont("VT323-21")

  end sub

  object.loadEntity = sub(i as integer)

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

  end sub

  object.unloadEntity = sub(i as integer)

    for j = 0 to m.game.marker.config[i].reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.marker.getRegElement(i, j).toStr()) <> invalid
        ' unloadBitmap
        m.game.unloadBitmap(m.funcName + "_" + m.game.marker.getRegElement(i, j).toStr())
      end if

    end for
  
  end sub

  object.genEntity = sub()

    if m.game.marker.config.Count() <> 0

      ' load & add
      for i = 0 to m.game.marker.config.Count() - 1
        if - m.game.map.getOffsetX() <= m.game.marker.getOffsetX(i) + m.game.marker.getSizeW(i) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.marker.getOffsetX(i) and - m.game.map.getOffsetY() <= m.game.marker.getOffsetY(i) + m.game.marker.getSizeH(i) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.marker.getOffsetY(i)
          if m.getImage(m.game.marker.getName(i).toStr() + "_" + i.toStr()) = invalid
                  
            ' load
            m.loadEntity(i)

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
          ' m.unloadEntity(i)

        end if
      end for
    end if

  end sub

  object.genCol = sub()

    if m.game.marker.config.Count() <> 0

      ' load & add
      for i = 0 to m.game.marker.config.Count() - 1
        if - m.game.map.getOffsetX() <= m.game.marker.getOffsetX(i) + m.game.marker.getSizeW(i) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.marker.getOffsetX(i) and - m.game.map.getOffsetY() <= m.game.marker.getOffsetY(i) + m.game.marker.getSizeH(i) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.marker.getOffsetY(i)

          if m.getCollider(m.game.marker.getName(i).toStr() + "_" + i.toStr()) = invalid
            ' addColliderRectangle
            m.addColliderRectangle(m.game.marker.getName(i).toStr() + "_" + i.toStr(), m.game.marker.getOffsetX(i), m.game.marker.getOffsetY(i), m.game.marker.getSizeW(i), m.game.marker.getSizeH(i))
          end if

        ' unload & remove
        else if m.getCollider(m.game.marker.getName(i).toStr() + "_" + i.toStr()) <> invalid

          m.removeCollider(m.game.marker.getName(i).toStr() + "_" + i.toStr())

        end if
      end for
    end if

  end sub
    
  object.onCollision = sub(collider_name as string, other_collider_name as string, other_instance as object)
  
    if m.game.getFocusGroup() = "char"
      if other_collider_name = m.game.char.getColUpName()
        m.game.char.setMarkerCol(collider_name)

      else if other_collider_name = m.game.char.getColDownName()
        m.game.char.setMarkerCol(collider_name)

      else if other_collider_name = m.game.char.getColLeftName()
        m.game.char.setMarkerCol(collider_name)

      else if other_collider_name = m.game.char.getColRightName()
        m.game.char.setMarkerCol(collider_name)

      end if

    else if m.game.getFocusGroup() = "veh"
      if other_collider_name = m.game.veh.getColUpName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
          m.game.veh.setMarkerCol(m.game.char.getVeh().split("_").peek().toInt(), collider_name)

      else if other_collider_name = m.game.veh.getColDownName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
          m.game.veh.setMarkerCol(m.game.char.getVeh().split("_").peek().toInt(), collider_name)

      else if other_collider_name = m.game.veh.getColLeftName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
          m.game.veh.setMarkerCol(m.game.char.getVeh().split("_").peek().toInt(), collider_name)

      else if other_collider_name = m.game.veh.getColRightName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
          m.game.veh.setMarkerCol(m.game.char.getVeh().split("_").peek().toInt(), collider_name)
      end if
    end if
  
  end sub

  object.onUpdate = sub(dt as float)

    m.genEntity()
    m.genCol()

  end sub

  object.onDrawEnd = sub(canvas)
    
    if m.game.marker.config.Count() <> 0 and m.game.char.getMarkerCol() <> invalid and m.game.getFocusGroup() = "char"
      DrawText(canvas, "ENTER", m.game.marker.getOffsetX(m.game.char.getMarkerCol().split("_").peek().toInt()) + m.game.map.getOffsetX() + m.game.marker.getSizeW(m.game.char.getMarkerCol().split("_").peek().toInt()) / 2 + 3, m.game.marker.getOffsetY(m.game.char.getMarkerCol().split("_").peek().toInt()) + m.game.map.getOffsetY() + m.game.marker.getSizeH(m.game.char.getMarkerCol().split("_").peek().toInt()) / 3 + 3, m.transition_font, "center", &h000000FF)
      DrawText(canvas, "ENTER", m.game.marker.getOffsetX(m.game.char.getMarkerCol().split("_").peek().toInt()) + m.game.map.getOffsetX() + m.game.marker.getSizeW(m.game.char.getMarkerCol().split("_").peek().toInt()) / 2, m.game.marker.getOffsetY(m.game.char.getMarkerCol().split("_").peek().toInt()) + m.game.map.getOffsetY() + m.game.marker.getSizeH(m.game.char.getMarkerCol().split("_").peek().toInt()) / 3, m.transition_font, "center", &hFFFFFFFF)
    end if

  end sub

  object.onDestroy = sub()
    for i = 0 to m.game.marker.config.Count() - 1
      m.unloadEntity(i)
    end for
    
  end sub

end sub
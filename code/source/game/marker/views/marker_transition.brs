function marker_transition(object)

    object.funcName = "marker_transition"

    object.onCreate = function(args)

    end function

    object.entityLoad = function(i)

        m.marker_regions = []

        for j = 0 to m.game.marker.config[i].entity.reg.Count() - 1

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

        for j = 0 to m.game.marker.config[i].entity.reg.Count() - 1
    
          if m.game.getBitmap(m.funcName + "_" + m.game.marker.getRegElement(i, j).toStr()) <> invalid
            ' unloadBitmap
            m.game.unloadBitmap(m.funcName + "_" + m.game.marker.getRegElement(i, j).toStr())
          end if
    
        end for
    
    end function

    object.entityGen = function()

        ' load & add
        for i = 0 to m.game.marker.config.Count() - 1
            if - m.game.map.getEntityOffsetX() <= m.game.marker.getEntityOffsetX(i) + m.game.marker.getEntityW(i) and - m.game.map.getEntityOffsetX() + m.game.screen.GetWidth() >= m.game.marker.getEntityOffsetX(i) and - m.game.map.getEntityOffsetY() <= m.game.marker.getEntityOffsetY(i) + m.game.marker.getEntityH(i) and - m.game.map.getEntityOffsetY() + m.game.screen.GetHeight() >= m.game.marker.getEntityOffsetY(i)
                if m.getImage(m.game.marker.getEntityName(i).toStr() + "_" + i.toStr()) = invalid
                        
                    ' load
                    m.entityLoad(i)

                    ' add
                    m.addAnimatedImage(m.game.marker.getEntityName(i).toStr() + "_" + i.toStr(), m.marker_regions, { index: m.game.marker.getIndex(i)
                        offset_x: m.game.marker.getEntityOffsetX(i),
                        offset_y: m.game.marker.getEntityOffsetY(i),
                        alpha: m.game.marker.getAlpha(i)
                    })
                    
                end if

            ' unload & remove
            else if m.getImage(m.game.marker.getEntityName(i).toStr() + "_" + i.toStr()) <> invalid

                ' unload
                m.entityUnload(i)

                ' remove
                m.removeImage(m.game.marker.getEntityName(i).toStr() + "_" + i.toStr())

            end if
          
        end for
    
    end function

    object.colGen = function()

        ' loading map config to create marker
        for i = 0 to m.game.marker.config.Count() - 1
    
          if m.colliders[m.game.marker.getEntityName(i).toStr() + "_" + i.toStr()] = invalid
            ' addColliderRectangle
            m.addColliderRectangle(m.game.marker.getEntityName(i).toStr() + "_" + i.toStr(), m.game.marker.getColOffsetX(i), m.game.marker.getColOffsetY(i), m.game.marker.getColW(i), m.game.marker.getColH(i))
          end if
    
        end for
    
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

end function
function obj_view(object)

    object.funcName = "obj_view"

    object.onCreate = function(args)

    end function

    object.entityLoad = function(i)

        m.obj_regions = []

        for j = 0 to m.game.obj.config[i].entity.reg.Count() - 1

             if m.game.getBitmap(m.funcName + "_" + m.game.obj.getRegElement(i, j).toStr()) = invalid
                ' loadBitmap
                m.game.loadBitmap(m.funcName + "_" + m.game.obj.getRegElement(i, j).toStr(), "pkg:/media/obj/sprites/" + m.game.obj.getRegElement(i, j).toStr() + ".png")
            end if

            ' getBitmap
            obj_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.obj.getRegElement(i, j).toStr())
        
            ' roRegion
            obj_region = CreateObject("roRegion", obj_bitmap, 0, 0, obj_bitmap.GetWidth(), obj_bitmap.GetHeight())

            m.obj_regions.push(obj_region)

        end for

    end function

    object.entityUnload = function(i)

        for j = 0 to m.game.obj.config[i].entity.reg.Count() - 1
    
          if m.game.getBitmap(m.funcName + "_" + m.game.obj.getRegElement(i, j).toStr()) <> invalid
            ' unloadBitmap
            m.game.unloadBitmap(m.funcName + "_" + m.game.obj.getRegElement(i, j).toStr())
          end if
    
        end for
    
    end function

    object.entityGen = function()

        if m.game.obj.config.Count() <> 0
            ' load & add
            for i = 0 to m.game.obj.config.Count() - 1
                if - m.game.map.getEntityOffsetX() <= m.game.obj.getEntityOffsetX(i) + m.game.obj.getEntityW(i) and - m.game.map.getEntityOffsetX() + m.game.screen.GetWidth() >= m.game.obj.getEntityOffsetX(i) and - m.game.map.getEntityOffsetY() <= m.game.obj.getEntityOffsetY(i) + m.game.obj.getEntityH(i) and - m.game.map.getEntityOffsetY() + m.game.screen.GetHeight() >= m.game.obj.getEntityOffsetY(i)
                    if m.getImage(m.game.obj.getEntityName(i).toStr() + "_" + i.toStr()) = invalid
                            
                        ' load
                        m.entityLoad(i)

                        ' add
                        m.addAnimatedImage(m.game.obj.getEntityName(i).toStr() + "_" + i.toStr(), m.obj_regions, { index: m.game.obj.getIndex(i)
                            offset_x: m.game.obj.getEntityOffsetX(i),
                            offset_y: m.game.obj.getEntityOffsetY(i),
                            alpha: m.game.obj.getAlpha(i)
                        })
                        
                    end if

                ' unload & remove
                else if m.getImage(m.game.obj.getEntityName(i).toStr() + "_" + i.toStr()) <> invalid

                    ' unload
                    m.entityUnload(i)

                    ' remove
                    m.removeImage(m.game.obj.getEntityName(i).toStr() + "_" + i.toStr())

                end if
            
            end for
        end if
    end function

    object.colGen = function()

        if m.game.obj.config.Count() <> 0
            ' load & add
            for i = 0 to m.game.obj.config.Count() - 1
                if - m.game.map.getEntityOffsetX() <= m.game.obj.getColOffsetX(i) + m.game.obj.getColW(i) and - m.game.map.getEntityOffsetX() + m.game.screen.GetWidth() >= m.game.obj.getColOffsetX(i) and - m.game.map.getEntityOffsetY() <= m.game.obj.getColOffsetY(i) + m.game.obj.getColH(i) and - m.game.map.getEntityOffsetY() + m.game.screen.GetHeight() >= m.game.obj.getColOffsetY(i)

                    if m.colliders[m.game.obj.getColName(i).toStr() + "_" + i.toStr()] = invalid
                        ' addColliderRectangle
                        m.addColliderRectangle(m.game.obj.getColName(i).toStr() + "_" + i.toStr(), m.game.obj.getColOffsetX(i), m.game.obj.getColOffsetY(i), m.game.obj.getColW(i), m.game.obj.getColH(i))
                      
                    end if

                ' unload & remove
                else if m.getCollider(m.game.obj.getColName(i).toStr() + "_" + i.toStr()) <> invalid

                    m.removeCollider(m.game.obj.getColName(i).toStr() + "_" + i.toStr())

                end if
            
            end for
        end if
    end function

    object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

        if other_collider_name = m.game.char.getColUpName()
            m.game.char.setColUp(true)

        else if other_collider_name = m.game.char.getColDownName()
            m.game.char.setColDown(true)

        else if other_collider_name = m.game.char.getColLeftName()
            m.game.char.setColLeft(true)

        else if other_collider_name = m.game.char.getColRightName()
            m.game.char.setColRight(true)

        end if

    end function

    object.onUpdate = function(dt as float)

        m.entityGen()
        m.colGen()

    end function

end function
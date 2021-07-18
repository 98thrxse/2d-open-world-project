function obj_entity(object)

    object.funcName = "obj_entity"

    object.onCreate = function(args)

    end function

    object.entityLoad = function(i)

        m.obj_regions = []

        for j = 0 to m.game.obj.config[i].entity.anim.reg.Count() - 1

             if m.game.getBitmap(m.funcName + "_" + m.game.obj.getReg(i, j).toStr()) = invalid
                ' loadBitmap
                m.game.loadBitmap(m.funcName + "_" + m.game.obj.getReg(i, j).toStr(), "pkg:/media/obj/sprites/" + m.game.obj.getReg(i, j).toStr() + ".png")
            end if

            ' getBitmap
            obj_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.obj.getReg(i, j).toStr())
        
            ' roRegion
            obj_region = CreateObject("roRegion", obj_bitmap, 0, 0, obj_bitmap.GetWidth(), obj_bitmap.GetHeight())

            m.obj_regions.push(obj_region)

        end for

    end function

    object.entityUnload = function(i)

        for j = 0 to m.game.obj.config[i].entity.anim.reg.Count() - 1
    
          if m.game.getBitmap(m.funcName + "_" + m.game.obj.getReg(i, j).toStr()) <> invalid
            ' unloadBitmap
            m.game.unloadBitmap(m.funcName + "_" + m.game.obj.getReg(i, j).toStr())
          end if
    
        end for
    
    end function

    object.entityGen = function()

        ' load & add
        for i = 0 to m.game.obj.config.Count() - 1
            if - m.game.xy.getZeroOffsetX() <= m.game.obj.getEntityOffsetX(i) + m.game.obj.getEntityW(i) and - m.game.xy.getZeroOffsetX() + m.game.screen.GetWidth() >= m.game.obj.getEntityOffsetX(i) and - m.game.xy.getZeroOffsetY() <= m.game.obj.getEntityOffsetY(i) + m.game.obj.getEntityH(i) and - m.game.xy.getZeroOffsetY() + m.game.screen.GetHeight() >= m.game.obj.getEntityOffsetY(i)
                if m.getImage(m.game.obj.getEntityName(i).toStr() + "_" + i.toStr()) = invalid
                        
                    ' load
                    m.entityLoad(i)

                    ' add
                    m.addAnimatedImage(m.game.obj.getEntityName(i).toStr() + "_" + i.toStr(), m.obj_regions, { index: 0
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
    
    end function


    object.onUpdate = function(dt as float)

        m.entityGen()

    end function

end function
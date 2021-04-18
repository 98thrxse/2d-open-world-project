function obj_entity(object)

    object.onCreate = function(args)


    end function


    object.entityXY = function()
        ' position
        m.x = m.game.char.getZeroOffsetX()
        m.y = m.game.char.getZeroOffsetY()

    end function


    object.entityGen = function()

        ' loading map config to create obj
        for i = 0 to m.game.obj.config.Count() - 1

            obj_regions = []

            if m.getImage(m.game.obj.getEntityName(i).toStr() + "_" + i.toStr()) = invalid
                for j = 0 to m.game.obj.config[i].entity.anim.reg.Count() - 1
                    ' loadBitmap
                    m.game.loadBitmap(m.game.obj.getReg(i, j).toStr(), "pkg:/media/obj/sprites/" + m.game.obj.getReg(i, j).toStr() + ".png")

                    ' getBitmap
                    obj_bitmap = m.game.getBitmap(m.game.obj.getReg(i, j).toStr())
                
                    ' roRegion
                    obj_region = CreateObject("roRegion", obj_bitmap, 0, 0, obj_bitmap.GetWidth(), obj_bitmap.GetHeight())

                    obj_regions.push(obj_region)

                end for

                ' addAnimatedImage
                m.addAnimatedImage(m.game.obj.getEntityName(i).toStr() + "_" + i.toStr(), obj_regions, { index: 0
                    offset_x: m.game.obj.getEntityOffsetX(i),
                    offset_y: m.game.obj.getEntityOffsetY(i),
                    alpha: m.game.obj.getAlpha(i)
                })
                
            end if
          
        end for
    
    end function


    object.onUpdate = function(dt as float)

        m.entityXY()
        m.entityGen()

    end function

end function
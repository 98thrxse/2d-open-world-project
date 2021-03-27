function obj_entity(object)



    object.onCreate = function(args)

        m.entityXY()

    end function


    object.entityXY = function()
        ' position
        m.x = m.game.screen.GetWidth() / 2 - m.game.char.getEntityPosX()
        m.y = m.game.screen.GetHeight() / 2 - m.game.char.getEntityPosY()

    end function


    object.entityGen = function()

        ' loading map config to create obj
        for i = 0 to m.game.obj.config.Count() - 1

            obj_regions = []
            
            if m.getImage(m.game.obj.config[i].entity.name.toStr() + "_" + m.game.obj.config[i].id.toStr()) = invalid
                for j = 0 to m.game.obj.config[i].anim.reg.Count() - 1
                    ' loadBitmap
                    m.game.loadBitmap(m.game.obj.config[i].anim.reg[j].toStr(), "pkg:/media/obj/sprites/" + m.game.obj.config[i].anim.reg[j].toStr() + ".png")

                    ' getBitmap
                    obj_bitmap = m.game.getBitmap(m.game.obj.config[i].anim.reg[j].toStr())
                
                    ' roRegion
                    obj_region = CreateObject("roRegion", obj_bitmap, 0, 0, obj_bitmap.GetWidth(), obj_bitmap.GetHeight())

                    obj_regions.push(obj_region)

                end for

                ' addAnimatedImage
                m.addAnimatedImage(m.game.obj.config[i].entity.name.toStr() + "_" + m.game.obj.config[i].id.toStr(), obj_regions, { index: 0
                    offset_x: m.game.obj.getEntityPosX(i),
                    offset_y: m.game.obj.getEntityPosY(i),
                    alpha: m.game.obj.getAlpha(i)
                })
                
            end if
          
        end for
    
    end function


    object.onUpdate = function(dt as float)

        m.entityGen()

    end function

end function
function obj_entity(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.media_wnd = m.game.getInstanceByName("obj_media")

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
          if m.getImage(m.game.obj.config[i].entity.name.toStr() + "_" + m.game.obj.config[i].id.toStr()) = invalid
            ' addAnimatedImage
            m.addAnimatedImage(m.game.obj.config[i].entity.name.toStr() + "_" + m.game.obj.config[i].id.toStr(), [m.media_wnd.obj_region, invalid], { index: 0
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
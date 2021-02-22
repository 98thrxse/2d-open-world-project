function obj_entity(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.media_wnd = m.game.getInstanceByName("obj_media")

        ' position
        m.x = m.game.screen.GetWidth() / 2 - m.game.char.getEntityPosX()
        m.y = m.game.screen.GetHeight() / 2 - m.game.char.getEntityPosY()

    end function


    object.objAlpha = function()

        m.game.char.setObjIntersect(invalid)

        for i = 0 to m.game.obj.config.Count() - 1
            if m.game.char.getEntityPosX() < m.game.obj.getEntityPosX(i) + m.game.obj.getEntityW(i) and m.game.char.getEntityPosX() > m.game.obj.getEntityPosX(i) and m.game.char.getEntityPosY() + m.game.char.getEntityH() / 2 < m.game.obj.getEntityPosY(i) + m.game.obj.getEntityH(i) and m.game.char.getEntityPosY() + m.game.char.getEntityH() / 2 > m.game.obj.getEntityPosY(i)
                if m.game.obj.getAlpha(i) <> 125 then m.game.obj.setAlpha(i, 125)
                m.game.char.setObjIntersect(i)

            else
                if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)

            end if
        end for

        if m.game.char.getObjIntersect() = invalid
            if m.game.char.getAlpha() <> 255 then m.game.char.setAlpha(255)

        else
            if m.game.char.getAlpha() <> 125 then m.game.char.setAlpha(125)

        end if

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
    
          if m.colliders[m.game.obj.config[i].col.name.toStr() + "_" + m.game.obj.config[i].id.toStr()] = invalid
            ' addColliderRectangle
            m.addColliderRectangle(m.game.obj.config[i].col.name.toStr() + "_" + m.game.obj.config[i].id.toStr(), m.game.obj.getColPosX(i), m.game.obj.getColPosY(i), m.game.obj.getColW(i), m.game.obj.getColH(i))
          
          end if
          
        end for
    
    end function
    
    
    object.posXY = function()

        m.game.char.setEntityPosX(m.game.screen.GetWidth() / 2 - m.x)
        m.game.char.setEntityPosY(m.game.screen.GetHeight() / 2 - m.y)

    end function

    object.onUpdate = function(dt as float)

        m.posXY()
        m.objAlpha()
        m.entityGen()

    end function

    object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

        if other_instance.name = "char_entity" and other_collider_name = "char_col_up"
            if m.game.char.getUpCol() <> true then m.game.char.setUpCol(true)

        else if other_instance.name = "char_entity" and other_collider_name = "char_col_down"
            if m.game.char.getDownCol() <> true then m.game.char.setDownCol(true)

        else if other_instance.name = "char_entity" and other_collider_name = "char_col_left"
            if m.game.char.getLeftCol() <> true then m.game.char.setLeftCol(true)

        else if other_instance.name = "char_entity" and other_collider_name = "char_col_right"
            if m.game.char.getRightCol() <> true then m.game.char.setRightCol(true)

        end if

    end function

    object.onButton = function(code as integer)

        ' held
        if code = 1002 ' up
            if m.game.char.getUpCol() = false
                m.y += m.game.char.getUpSpeed()

            end if
                        
		else if code = 1003 ' down
            if m.game.char.getDownCol() = false
                m.y -= m.game.char.getDownSpeed()

            end if
            
            
		else if code = 1004 ' left
            if m.game.char.getLeftCol() = false
                m.x += m.game.char.getLeftSpeed()

            end if
            
        else if code = 1005 ' right
            if m.game.char.getRightCol() = false
                m.x -= m.game.char.getRightSpeed()

            end if
            
        end if

        ' released
        if code = 102
            if m.game.char.getDownCol() <> false then m.game.char.setDownCol(false)
            if m.game.char.getLeftCol() <> false then m.game.char.setLeftCol(false)
            if m.game.char.getRightCol() <> false then m.game.char.setRightCol(false)

        else if code = 103
            if m.game.char.getUpCol() <> false then m.game.char.setUpCol(false)
            if m.game.char.getLeftCol() <> false then m.game.char.setLeftCol(false)
            if m.game.char.getRightCol() <> false then m.game.char.setRightCol(false)

        else if code = 104
            if m.game.char.getUpCol() <> false then m.game.char.setUpCol(false)
            if m.game.char.getDownCol() <> false then m.game.char.setDownCol(false)
            if m.game.char.getRightCol() <> false then m.game.char.setRightCol(false)

        else if code = 105
            if m.game.char.getUpCol() <> false then m.game.char.setUpCol(false)
            if m.game.char.getDownCol() <> false then m.game.char.setDownCol(false)
            if m.game.char.getLeftCol() <> false then m.game.char.setLeftCol(false)

        end if

    end function

end function
function obj_static(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.media_wnd = m.game.getInstanceByName("obj_media")

        ' position
        m.x = m.game.screen.GetWidth() / 2 - m.game.char.getPosX()
        m.y = m.game.screen.GetHeight() / 2 - m.game.char.getPosY()

    end function

    object.objGen = function()

        ' loading map config to create obj
        for i = 0 to m.game.obj.config.Count() - 1
          if m.getImage(m.game.obj.config[i].obj.name.toStr() + "_" + m.game.obj.config[i].id.toStr()) = invalid
            ' addAnimatedImage
            m.addAnimatedImage(m.game.obj.config[i].obj.name.toStr() + "_" + m.game.obj.config[i].id.toStr(), [m.media_wnd.obj_region, invalid], { index: 0
                offset_x: m.game.obj.getObjPosX(i),
                offset_y: m.game.obj.getObjPosY(i),
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

        m.game.char.setPosX(m.game.screen.GetWidth() / 2 - m.x)
        m.game.char.setPosY(m.game.screen.GetHeight() / 2 - m.y)

    end function

    object.onUpdate = function(dt as float)

        m.posXY()
        m.objGen()

    end function

    object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

        if other_instance.name = "char_obj" and other_collider_name = "char_col_up"
            if m.game.char.getUpCollider() <> true then m.game.char.setUpCollider(true)

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_down"
            if m.game.char.getDownCollider() <> true then m.game.char.setDownCollider(true)

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_left"
            if m.game.char.getLeftCollider() <> true then m.game.char.setLeftCollider(true)

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_right"
            if m.game.char.getRightCollider() <> true then m.game.char.setRightCollider(true)

        end if

    end function

    object.onButton = function(code as integer)

        ' held
        if code = 1002 ' up
            if m.game.char.getUpCollider() = false
                m.y += m.game.char.getUpSpeed()

            end if
                        
		else if code = 1003 ' down
            if m.game.char.getDownCollider() = false
                m.y -= m.game.char.getDownSpeed()

            end if
            
            
		else if code = 1004 ' left
            if m.game.char.getLeftCollider() = false
                m.x += m.game.char.getLeftSpeed()

            end if
            
        else if code = 1005 ' right
            if m.game.char.getRightCollider() = false
                m.x -= m.game.char.getRightSpeed()

            end if
            
        end if

        ' released
        if code = 102
            if m.game.char.getDownCollider() <> false then m.game.char.setDownCollider(false)
            if m.game.char.getLeftCollider() <> false then m.game.char.setLeftCollider(false)
            if m.game.char.getRightCollider() <> false then m.game.char.setRightCollider(false)

        else if code = 103
            if m.game.char.getUpCollider() <> false then m.game.char.setUpCollider(false)
            if m.game.char.getLeftCollider() <> false then m.game.char.setLeftCollider(false)
            if m.game.char.getRightCollider() <> false then m.game.char.setRightCollider(false)

        else if code = 104
            if m.game.char.getUpCollider() <> false then m.game.char.setUpCollider(false)
            if m.game.char.getDownCollider() <> false then m.game.char.setDownCollider(false)
            if m.game.char.getRightCollider() <> false then m.game.char.setRightCollider(false)

        else if code = 105
            if m.game.char.getUpCollider() <> false then m.game.char.setUpCollider(false)
            if m.game.char.getDownCollider() <> false then m.game.char.setDownCollider(false)
            if m.game.char.getLeftCollider() <> false then m.game.char.setLeftCollider(false)

        end if

    end function

end function
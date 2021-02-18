function obj_static(object)

    object.obj_config = testOne_obj_static_config() ' fix stas

    object.onCreate = function(args)

        ' createInstance
        media_wnd = m.game.getInstanceByName("obj_media")

        ' window initialization
        obj_region = media_wnd.obj_region

        ' position
        m.x = m.game.screen.GetWidth() / 2 - m.game.char.getPosX()
        m.y = m.game.screen.GetHeight() / 2 - m.game.char.getPosY()

        ' loading map config to create static obj
        for i = 0 to m.obj_config.Count() - 1

            ' addAnimatedImage
            m.obj = m.addAnimatedImage(m.obj_config[i].obj_name.toStr() + "_" + m.obj_config[i].id.toStr(), [obj_region, invalid], { index: 0
                offset_x: m.obj_config[i].offset_x,
                offset_y: m.obj_config[i].offset_y
            })
            
            ' addColliderRectangle
            m.addColliderRectangle(m.obj_config[i].col_name.toStr() + "_" + m.obj_config[i].id.toStr(), m.obj_config[i].offset_x, m.obj_config[i].offset_y, m.obj_config[i].width, m.obj_config[i].height)
        
        end for

    end function
    
    object.posXY = function()

        m.game.char.setPosX(m.game.screen.GetWidth() / 2 - m.x)
        m.game.char.setPosY(m.game.screen.GetHeight() / 2 - m.y)

    end function

    object.onUpdate = function(dt as float)

        m.posXY()

    end function

    object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

        if other_instance.name = "char_obj" and other_collider_name = "char_col_up"
            m.game.char.setUpCollider(true)

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_down"
            m.game.char.setDownCollider(true)

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_left"
            m.game.char.setLeftCollider(true)

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_right"
            m.game.char.setRightCollider(true)

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
            m.game.char.setDownCollider(false)
            m.game.char.setLeftCollider(false)
            m.game.char.setRightCollider(false)

        else if code = 103
            m.game.char.setUpCollider(false)
            m.game.char.setLeftCollider(false)
            m.game.char.setRightCollider(false)

        else if code = 104
            m.game.char.setUpCollider(false)
            m.game.char.setDownCollider(false)
            m.game.char.setRightCollider(false)

        else if code = 105
            m.game.char.setUpCollider(false)
            m.game.char.setDownCollider(false)
            m.game.char.setLeftCollider(false)

        end if

    end function

end function
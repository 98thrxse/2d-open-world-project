function obj_static(object)

    object.obj_config = testOne_obj_static_config() ' fix stas

    object.onCreate = function(args)

        ' createInstance
        media_wnd = m.game.createInstance("obj_media")

        ' window initialization
        obj_region = media_wnd.obj_region

        ' position
        m.x = m.game.screen.GetWidth() / 2 - m.game.user.getPosX()
        m.y = m.game.screen.GetHeight() / 2 - m.game.user.getPosY()

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

        m.game.user.setPosX(m.game.screen.GetWidth() / 2 - m.x)
        m.game.user.setPosY(m.game.screen.GetHeight() / 2 - m.y)

    end function

    object.onUpdate = function(dt as float)

        m.posXY()

    end function

    object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

        if other_instance.name = "char_obj" and other_collider_name = "char_col_up"
            m.game.user.setUpCollider(true)

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_down"
            m.game.user.setDownCollider(true)

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_left"
            m.game.user.setLeftCollider(true)

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_right"
            m.game.user.setRightCollider(true)

        end if

    end function

    object.onButton = function(code as integer)

        ' held
        if code = 1002 ' up

            if m.game.user.getUpCollider() = false
                m.y += m.game.user.getUpSpeed()
                m.game.user.setDownCollider(false)
                m.game.user.setLeftCollider(false)
                m.game.user.setRightCollider(false)

            end if
                        
		else if code = 1003 ' down

            if m.game.user.getDownCollider() = false
                m.y -= m.game.user.getDownSpeed()
                m.game.user.setUpCollider(false)
                m.game.user.setLeftCollider(false)
                m.game.user.setRightCollider(false)

            end if
            
            
		else if code = 1004 ' left

            if m.game.user.getLeftCollider() = false
                m.x += m.game.user.getLeftSpeed()
                m.game.user.setUpCollider(false)
                m.game.user.setDownCollider(false)
                m.game.user.setRightCollider(false)

            end if
            
        else if code = 1005 ' right

            if m.game.user.getRightCollider() = false
                m.x -= m.game.user.getRightSpeed()
                m.game.user.setUpCollider(false)
                m.game.user.setDownCollider(false)
                m.game.user.setLeftCollider(false)

            end if
            
        end if

    end function

end function
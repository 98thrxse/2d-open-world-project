function obj_static(object)

    object.obj_config = testOne_obj_static_config() ' fix stas

    object.onCreate = function(args)

        ' createInstance
        media_wnd = m.game.createInstance("obj_media")

        ' window initialization
        obj_region = media_wnd.obj_region 

        ' loading map config to create static obj
        for i = 0 to m.obj_config.Count() - 1

            ' addAnimatedImage
            m.obj = m.addAnimatedImage(m.obj_config[i].obj_name.toStr() + m.obj_config[i].id.toStr(), [obj_region, invalid], { index: 0
                offset_x: m.obj_config[i].offset_x,
                offset_y: m.obj_config[i].offset_y
            })
            
            ' addColliderRectangle
            m.addColliderRectangle(m.obj_config[i].col_name.toStr() + m.obj_config[i].id.toStr(), m.obj_config[i].offset_x, m.obj_config[i].offset_y, m.obj_config[i].width, m.obj_config[i].height)
        
        end for

    end function

    object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

        if other_instance.name = "char_obj" and other_collider_name = "char_col_up"
            char_setUpCollider(true)

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_down"
            char_setDownCollider(true)

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_left"
            char_setLeftCollider(true)

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_right"
            char_setRightCollider(true)

        end if

    end function

    object.onButton = function(code as integer)

        ' held
        if code = 1002 ' up

            if char_getUpCollider() = false
                m.y += char_getUpSpeed()
                char_setDownCollider(false)
                char_setLeftCollider(false)
                char_setRightCollider(false)

            end if
                        
		else if code = 1003 ' down

            if char_getDownCollider() = false
                m.y -= char_getDownSpeed()
                char_setUpCollider(false)
                char_setLeftCollider(false)
                char_setRightCollider(false)

            end if
            
            
		else if code = 1004 ' left

            if char_getLeftCollider() = false
                m.x += char_getLeftSpeed()
                char_setUpCollider(false)
                char_setDownCollider(false)
                char_setRightCollider(false)

            end if
            
        else if code = 1005 ' right

            if char_getRightCollider() = false
                m.x -= char_getRightSpeed()
                char_setUpCollider(false)
                char_setDownCollider(false)
                char_setLeftCollider(false)

            end if
            
        end if

    end function

end function
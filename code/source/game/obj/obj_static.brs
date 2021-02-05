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

        if other_instance.name = "character_obj" and other_collider_name = "character_col_up"
            character_setUpCollider(true)

        else if other_instance.name = "character_obj" and other_collider_name = "character_col_down"
            character_setDownCollider(true)

        else if other_instance.name = "character_obj" and other_collider_name = "character_col_left"
            character_setLeftCollider(true)

        else if other_instance.name = "character_obj" and other_collider_name = "character_col_right"
            character_setRightCollider(true)

        end if

    end function

    object.onButton = function(code as integer)

        ' held
        if code = 1002 ' up

            if character_getUpCollider() = false
                m.y += character_getUpSpeed()
                character_setDownCollider(false)
                character_setLeftCollider(false)
                character_setRightCollider(false)

            end if
                        
		else if code = 1003 ' down

            if character_getDownCollider() = false
                m.y -= character_getDownSpeed()
                character_setUpCollider(false)
                character_setLeftCollider(false)
                character_setRightCollider(false)

            end if
            
            
		else if code = 1004 ' left

            if character_getLeftCollider() = false
                m.x += character_getLeftSpeed()
                character_setUpCollider(false)
                character_setDownCollider(false)
                character_setRightCollider(false)

            end if
            
        else if code = 1005 ' right

            if character_getRightCollider() = false
                m.x -= character_getRightSpeed()
                character_setUpCollider(false)
                character_setDownCollider(false)
                character_setLeftCollider(false)

            end if
            
        end if

    end function

end function
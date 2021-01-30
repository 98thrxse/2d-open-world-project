function test_one_static_obj(object)

    object.onCreate = function(args)

        ' createInstance
        media_wnd = m.game.createInstance("test_one_media")

        ' window initialization
        obj_region = media_wnd.obj_region 

        ' addAnimatedImage
        m.obj = m.addAnimatedImage("obj_obj", [obj_region, invalid], { index: 0
            offset_x: 0
            offset_y: 0
        })
        
        ' addColliderRectangle
        m.addColliderRectangle("obj_col", m.obj.offset_x, m.obj.offset_y, obj_region.GetWidth(), obj_region.GetHeight())
        
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
function test_one_obj(object)

    object.anim_options = {
		speed: 3
	}

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

        if other_instance.name = "player_obj" and other_collider_name = "player_col"

            print "stas"

        end if

    end function

    object.onButton = function(code as integer)

        ' held
		if code = 1002 ' up
            m.y += m.anim_options.speed
            
		else if code = 1003 ' down
            m.y -= m.anim_options.speed
            
		else if code = 1004 ' left
            m.x += m.anim_options.speed
            
        else if code = 1005 ' right
            m.x -= m.anim_options.speed
            
        end if

    end function

end function
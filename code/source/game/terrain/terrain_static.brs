function terrain_static(object)

    object.onCreate = function(args)

        ' createInstance
        media_wnd = m.game.createInstance("terrain_media")

        ' window initialization
        terrain_region = media_wnd.terrain_region 

        ' addAnimatedImage
        m.terrain = m.addAnimatedImage("terrain_obj", [terrain_region, invalid], { index: 0
            offset_x: 0 - char_getPosX(),
            offset_y: 0 - char_getPosY()
        })

    end function

    object.onButton = function(code as integer)

        ' held
        if code = 1002 ' up

            if char_getUpCollider() = false
                m.y += char_getUpSpeed()

            end if
                        
		else if code = 1003 ' down

            if char_getDownCollider() = false
                m.y -= char_getDownSpeed()

            end if
            
            
		else if code = 1004 ' left

            if char_getLeftCollider() = false
                m.x += char_getLeftSpeed()

            end if
            
        else if code = 1005 ' right

            if char_getRightCollider() = false
                m.x -= char_getRightSpeed()

            end if
            
        end if

    end function
    
end function
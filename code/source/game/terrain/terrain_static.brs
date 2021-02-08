function terrain_static(object)

    object.terrain_config = testOne_terrain_static_config() ' fix stas

    object.onCreate = function(args)

        ' createInstance
        media_wnd = m.game.createInstance("terrain_media")

        ' window initialization
        m.terrain_region = media_wnd.terrain_region 

        ' position
        m.x -= char_getPosX()
        m.y -= char_getPosY()

        ' addAnimatedImage
        m.terrain = m.addAnimatedImage(m.terrain_config[0].obj_name.toStr() + "_" + m.terrain_config[0].id.toStr(), [m.terrain_region, invalid], { index: 0
            offset_x: m.terrain_config[0].offset_x,
            offset_y: m.terrain_config[0].offset_y
        })

    end function

    object.onUpdate = function(dt as float)

        if m.x < - char_getPosX()
            if m.getImage(m.terrain_config[1].obj_name.toStr() + "_" + m.terrain_config[1].id.toStr()) = invalid
                ' addAnimatedImage
                m.addAnimatedImage(m.terrain_config[1].obj_name.toStr() + "_" + m.terrain_config[1].id.toStr(), [m.terrain_region, invalid], { index: 0
                    offset_x: m.terrain_config[1].offset_x,
                    offset_y: m.terrain_config[1].offset_y
                })

            end if

        end if

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
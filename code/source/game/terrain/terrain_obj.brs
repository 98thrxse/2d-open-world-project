function terrain_obj(object)

    object.terrain_config = testOne_terrain_config() ' fix stas

    object.onCreate = function(args)

        ' createInstance
        media_wnd = m.game.createInstance("terrain_media")

        ' window initialization
        m.terrain_region = media_wnd.terrain_region

        ' position
        m.x = m.game.screen.GetWidth() / 2 - char_getPosX()
        m.y = m.game.screen.GetHeight() / 2 - char_getPosY()

        ' addAnimatedImage
        ' m.terrain = m.addAnimatedImage(m.terrain_config[0].obj_name.toStr() + "_" + m.terrain_config[0].id.toStr(), [m.terrain_region, invalid], { index: 0
        '     offset_x: m.terrain_config[0].offset_x,
        '     offset_y: m.terrain_config[0].offset_y
        ' })

    end function

    object.posXY = function()

        char_setPosX(m.game.screen.GetWidth() / 2 - m.x)
        char_setPosY(m.game.screen.GetHeight() / 2 - m.y)

        ' print char_getPosX()

    end function


    object.terrainGen = function()

        if char_getPosX() - m.game.screen.GetWidth() / 2 < m.terrain_config[0].offset_x
            if m.getImage(m.terrain_config[0].obj_name.toStr() + "_" + m.terrain_config[0].id.toStr()) = invalid
                m.addAnimatedImage(m.terrain_config[0].obj_name.toStr() + "_" + m.terrain_config[0].id.toStr(), [m.terrain_region, invalid], { index: 0
                    offset_x: m.terrain_config[0].offset_x,
                    offset_y: m.terrain_config[0].offset_y
                })
            end if
        else if char_getPosX() - m.game.screen.GetWidth() / 2 > m.terrain_config[m.terrain_config.Count() - 1].offset_x
            if m.getImage(m.terrain_config[m.terrain_config.Count() - 1].obj_name.toStr() + "_" + m.terrain_config[m.terrain_config.Count() - 1].id.toStr()) = invalid
                m.addAnimatedImage(m.terrain_config[m.terrain_config.Count() - 1].obj_name.toStr() + "_" + m.terrain_config[m.terrain_config.Count() - 1].id.toStr(), [m.terrain_region, invalid], { index: 0
                    offset_x: m.terrain_config[m.terrain_config.Count() - 1].offset_x,
                    offset_y: m.terrain_config[m.terrain_config.Count() - 1].offset_y
                })
            end if
        else
            for i = 0 to m.terrain_config.Count() - 2
                print char_getPosX() - m.game.screen.GetWidth() / 2
                if char_getPosX() - m.game.screen.GetWidth() / 2 > m.terrain_config[i].offset_x and char_getPosX() - m.game.screen.GetWidth() / 2 < m.terrain_config[i + 1].offset_x
                    print  m.terrain_config[i + 1].offset_x
    
                    if m.getImage(m.terrain_config[i].obj_name.toStr() + "_" + m.terrain_config[i].id.toStr()) = invalid
                        m.addAnimatedImage(m.terrain_config[i].obj_name.toStr() + "_" + m.terrain_config[i].id.toStr(), [m.terrain_region, invalid], { index: 0
                            offset_x: m.terrain_config[i].offset_x,
                            offset_y: m.terrain_config[i].offset_y
                        })
    
                    end if
    
                    if m.getImage(m.terrain_config[i + 1].obj_name.toStr() + "_" + m.terrain_config[i + 1].id.toStr()) = invalid
                        m.addAnimatedImage(m.terrain_config[i + 1].obj_name.toStr() + "_" + m.terrain_config[i + 1].id.toStr(), [m.terrain_region, invalid], { index: 0
                            offset_x: m.terrain_config[i + 1].offset_x,
                            offset_y: m.terrain_config[i + 1].offset_y
                        })
                        
                    end if
                    i = m.terrain_config.Count()
                end if
            end for
        end if
        
        ' if m.x < - char_getPosX()
        '     if m.getImage(m.terrain_config[1].obj_name.toStr() + "_" + m.terrain_config[1].id.toStr()) = invalid
        '         ' addAnimatedImage
        '         m.addAnimatedImage(m.terrain_config[1].obj_name.toStr() + "_" + m.terrain_config[1].id.toStr(), [m.terrain_region, invalid], { index: 0
        '             offset_x: m.terrain_config[1].offset_x,
        '             offset_y: m.terrain_config[1].offset_y
        '         })

        '     end if

        ' end if
    end function


    object.onUpdate = function(dt as float)

        m.posXY()
        m.terrainGen()

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
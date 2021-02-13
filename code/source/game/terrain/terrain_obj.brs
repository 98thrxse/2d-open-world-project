function terrain_obj(object)

    object.terrain_config = testOne_terrain_config() ' fix stas

    object.onCreate = function(args)

        ' createInstance
        media_wnd = m.game.createInstance("terrain_media")

        ' window initialization
        m.terrain_region = media_wnd.terrain_region

        ' position
        m.x = m.game.screen.GetWidth() / 2 - m.game.user.getPosX()
        m.y = m.game.screen.GetHeight() / 2 - m.game.user.getPosY()

    end function

    object.posXY = function()

        m.game.user.setPosX(m.game.screen.GetWidth() / 2 - m.x)
        m.game.user.setPosY(m.game.screen.GetHeight() / 2 - m.y)

    end function


    object.terrainGen = function()

        if m.game.user.getPosX() - m.game.screen.GetWidth() / 2 < m.terrain_config[0].offset_x
            if m.getImage(m.terrain_config[0].obj_name.toStr() + "_" + m.terrain_config[0].id.toStr()) = invalid
                m.addAnimatedImage(m.terrain_config[0].obj_name.toStr() + "_" + m.terrain_config[0].id.toStr(), [m.terrain_region, invalid], { index: 0
                    offset_x: m.terrain_config[0].offset_x,
                    offset_y: m.terrain_config[0].offset_y
                })

            end if

        else if m.game.user.getPosX() - m.game.screen.GetWidth() / 2 > m.terrain_config[m.terrain_config.Count() - 1].offset_x
            if m.getImage(m.terrain_config[m.terrain_config.Count() - 1].obj_name.toStr() + "_" + m.terrain_config[m.terrain_config.Count() - 1].id.toStr()) = invalid
                m.addAnimatedImage(m.terrain_config[m.terrain_config.Count() - 1].obj_name.toStr() + "_" + m.terrain_config[m.terrain_config.Count() - 1].id.toStr(), [m.terrain_region, invalid], { index: 0
                    offset_x: m.terrain_config[m.terrain_config.Count() - 1].offset_x,
                    offset_y: m.terrain_config[m.terrain_config.Count() - 1].offset_y
                })

            end if

        else
            for i = 0 to m.terrain_config.Count() - 2
                if m.game.user.getPosX() - m.game.screen.GetWidth() / 2 > m.terrain_config[i].offset_x and m.game.user.getPosX() - m.game.screen.GetWidth() / 2 < m.terrain_config[i + 1].offset_x
    
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
        
    end function


    object.onUpdate = function(dt as float)

        m.posXY()
        m.terrainGen()

    end function


    object.onButton = function(code as integer)

        ' held
        if code = 1002 ' up

            if m.game.user.getUpCollider() = false
                m.y += m.game.user.getUpSpeed()

            end if
                        
		else if code = 1003 ' down

            if m.game.user.getDownCollider() = false
                m.y -= m.game.user.getDownSpeed()

            end if
            
		else if code = 1004 ' left

            if m.game.user.getLeftCollider() = false
                m.x += m.game.user.getLeftSpeed()

            end if
            
        else if code = 1005 ' right

            if m.game.user.getRightCollider() = false
                m.x -= m.game.user.getRightSpeed()

            end if
            
        end if

    end function
    
end function
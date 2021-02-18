function terrain_obj(object)

    object.terrain_config = testOne_terrain_config() ' fix stas

    object.onCreate = function(args)

        ' createInstance
        media_wnd = m.game.getInstanceByName("terrain_media")

        ' window initialization
        m.terrain_region = media_wnd.terrain_region

        ' position
        m.x = m.game.screen.GetWidth() / 2 - m.game.char.getPosX()
        m.y = m.game.screen.GetHeight() / 2 - m.game.char.getPosY()

    end function

    object.posXY = function()

        m.game.char.setPosX(m.game.screen.GetWidth() / 2 - m.x)
        m.game.char.setPosY(m.game.screen.GetHeight() / 2 - m.y)

    end function


    object.objGen = function()

        id_x = []
        id_y = []

        if m.game.char.getPosX() - m.game.screen.GetWidth() / 2 < m.terrain_config[0][0].offset_x
            id_x.push(0)

        else if m.game.char.getPosX() - m.game.screen.GetWidth() / 2 > m.terrain_config[0][m.terrain_config[0].Count() - 1].offset_x
            id_x.push(m.terrain_config[0].Count() - 1)

        else
            for i = 0 to m.terrain_config[0].Count() - 2
                if m.game.char.getPosX() - m.game.screen.GetWidth() / 2 > m.terrain_config[0][i].offset_x and m.game.char.getPosX() - m.game.screen.GetWidth() / 2 < m.terrain_config[0][i + 1].offset_x
                    id_x.push(i)
                    id_x.push(i+1) 
                    i = m.terrain_config[0].Count()

                end if

            end for

        end if

        if m.game.char.getPosY() - m.game.screen.GetHeight() / 2 < m.terrain_config[0][0].offset_y
            id_y.push(0)

        else if m.game.char.getPosY() - m.game.screen.GetHeight() / 2 > m.terrain_config[m.terrain_config.Count() - 1][0].offset_y
            id_y.push(m.terrain_config.Count() - 1)

        else
            for i = 0 to m.terrain_config.Count() - 2
                if m.game.char.getPosY() - m.game.screen.GetHeight() / 2 > m.terrain_config[i][0].offset_y and m.game.char.getPosY() - m.game.screen.GetHeight() / 2 < m.terrain_config[i + 1][0].offset_y
                    id_y.push(i)
                    id_y.push(i + 1)  
                    i = m.terrain_config.Count()

                end if

            end for

        end if

        for i = 0 to id_y.Count() - 1
            for j = 0 to id_x.Count() - 1
                if m.getImage(m.terrain_config[id_y[i]][id_x[j]].obj_name.toStr() + "_" + m.terrain_config[id_y[i]][id_x[j]].id.toStr()) = invalid
                    m.addAnimatedImage(m.terrain_config[id_y[i]][id_x[j]].obj_name.toStr() + "_" + m.terrain_config[id_y[i]][id_x[j]].id.toStr(), [m.terrain_region, invalid], { index: 0
                        offset_x: m.terrain_config[id_y[i]][id_x[j]].offset_x,
                        offset_y: m.terrain_config[id_y[i]][id_x[j]].offset_y
                    })
                    
                end if

            end for

        end for

        
    end function


    object.onUpdate = function(dt as float)

        m.posXY()
        m.objGen()

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

    end function
    
end function
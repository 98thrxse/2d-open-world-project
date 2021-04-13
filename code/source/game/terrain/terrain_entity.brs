function terrain_entity(object)

    object.onCreate = function(args)

        ' getInstanceByName
        ' m.media_wnd = m.game.getInstanceByName("terrain_media")

        m.entityXY()

    end function


    object.entityXY = function()

        ' position
        m.x = m.game.screen.GetWidth() / 2 - m.game.char.getEntityPosX()
        m.y = m.game.screen.GetHeight() / 2 - m.game.char.getEntityPosY()

    end function


    object.entityGen = function()

        id_x = []
        id_y = []

        if m.game.char.getEntityPosX() - m.game.screen.GetWidth() / 2 < m.game.terrain.getEntityPosX(0, 0)
            id_x.push(0)

        else if m.game.char.getEntityPosX() - m.game.screen.GetWidth() / 2 > m.game.terrain.getEntityPosX(0, m.game.terrain.config[0].Count() - 1)
            id_x.push(m.game.terrain.config[0].Count() - 1)

        else
            for i = 0 to m.game.terrain.config[0].Count() - 2
                if m.game.char.getEntityPosX() - m.game.screen.GetWidth() / 2 > m.game.terrain.getEntityPosX(0, i) and m.game.char.getEntityPosX() - m.game.screen.GetWidth() / 2 < m.game.terrain.getEntityPosX(0, i + 1)
                    id_x.push(i)
                    id_x.push(i+1) 
                    i = m.game.terrain.config[0].Count()

                end if

            end for

        end if

        if m.game.char.getEntityPosY() - m.game.screen.GetHeight() / 2 < m.game.terrain.getEntityPosY(0, 0)
            id_y.push(0)

        else if m.game.char.getEntityPosY() - m.game.screen.GetHeight() / 2 > m.game.terrain.getEntityPosY(m.game.terrain.config.Count() - 1, 0)
            id_y.push(m.game.terrain.config.Count() - 1)

        else
            for i = 0 to m.game.terrain.config.Count() - 2
                if m.game.char.getEntityPosY() - m.game.screen.GetHeight() / 2 > m.game.terrain.getEntityPosY(i, 0) and m.game.char.getEntityPosY() - m.game.screen.GetHeight() / 2 < m.game.terrain.getEntityPosY(i + 1, 0)
                    id_y.push(i)
                    id_y.push(i + 1)  
                    i = m.game.terrain.config.Count()

                end if

            end for

        end if

        for i = 0 to id_y.Count() - 1
            for j = 0 to id_x.Count() - 1

                terrain_regions = []

                if m.getImage(m.game.terrain.config[id_y[i]][id_x[j]].entity.name.toStr() + "_" + m.game.terrain.config[id_y[i]][id_x[j]].id[0].toStr() + m.game.terrain.config[id_y[i]][id_x[j]].id[1].toStr()) = invalid
                    
                    for k = 0 to m.game.terrain.config[id_y[i]][id_x[j]].entity.anim.reg.Count() - 1

                        ' loadBitmap
                        m.game.loadBitmap(m.game.terrain.config[id_y[i]][id_x[j]].entity.anim.reg[k].toStr(), "pkg:/media/terrain/sprites/" + m.game.terrain.config[id_y[i]][id_x[j]].entity.anim.reg[k].toStr() + ".png")

                        ' getBitmap
                        terrain_bitmap = m.game.getBitmap(m.game.terrain.config[id_y[i]][id_x[j]].entity.anim.reg[k].toStr())

                        ' roRegion
                        terrain_region = CreateObject("roRegion", terrain_bitmap, 0, 0, terrain_bitmap.GetWidth(), terrain_bitmap.GetHeight())

                        terrain_regions.push(terrain_region)

                    end for
                    
                    m.addAnimatedImage(m.game.terrain.config[id_y[i]][id_x[j]].entity.name.toStr() + "_" + m.game.terrain.config[id_y[i]][id_x[j]].id[0].toStr() + m.game.terrain.config[id_y[i]][id_x[j]].id[1].toStr(), terrain_regions, { index: 0
                        offset_x: m.game.terrain.getEntityPosX(id_y[i], id_x[j]) 
                        offset_y: m.game.terrain.getEntityPosY(id_y[i], id_x[j])
                    })
                    
                end if

            end for

        end for

        
    end function


    object.onUpdate = function(dt as float)

        m.entityGen()

    end function
    
end function
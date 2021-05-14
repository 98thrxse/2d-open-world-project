function terrain_entity(object)

    object.funcName = "terrain_entity"

    object.onCreate = function(args)

    end function


    object.entityXY = function()

        ' position
        m.x = m.game.xy.get2DOffsetX()
        m.y = m.game.xy.get2DOffsetY()

    end function

    object.entityLoad = function(id_y, id_x, i, j)

        m.terrain_regions = []

        for k = 0 to m.game.terrain.config[id_y[i]][id_x[j]].entity.anim.reg.Count() - 1

            if m.game.getBitmap(m.funcName + "_" + m.game.terrain.getReg(id_y[i], id_x[j], k).toStr()) = invalid
                ' loadBitmap
                m.game.loadBitmap(m.funcName + "_" + m.game.terrain.getReg(id_y[i], id_x[j], k).toStr(), "pkg:/media/terrain/sprites/" + m.game.terrain.getReg(id_y[i], id_x[j], k).toStr() + ".png")
            end if

            ' getBitmap
            terrain_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.terrain.getReg(id_y[i], id_x[j], k).toStr())

            ' roRegion
            terrain_region = CreateObject("roRegion", terrain_bitmap, 0, 0, terrain_bitmap.GetWidth(), terrain_bitmap.GetHeight())

            m.terrain_regions.push(terrain_region)
        end for

    end function

    object.entityGen = function()

        id_x = []
        id_y = []

        if m.game.char.getEntityPosX() - m.game.screen.GetWidth() / 2 <= m.game.terrain.getEntityOffsetX(0, 0)
            id_x.push(0)

        else if m.game.char.getEntityPosX() - m.game.screen.GetWidth() / 2 > m.game.terrain.getEntityOffsetX(0, m.game.terrain.config[0].Count() - 1)
            id_x.push(m.game.terrain.config[0].Count() - 1)

        else
            for i = 0 to m.game.terrain.config[0].Count() - 2
                if m.game.char.getEntityPosX() - m.game.screen.GetWidth() / 2 >= m.game.terrain.getEntityOffsetX(0, i) and m.game.char.getEntityPosX() - m.game.screen.GetWidth() / 2 <= m.game.terrain.getEntityOffsetX(0, i + 1)
                    id_x.push(i)
                    id_x.push(i + 1) 
                    i = m.game.terrain.config[0].Count()

                end if

            end for

        end if

        if m.game.char.getEntityPosY() - m.game.screen.GetHeight() / 2 <= m.game.terrain.getEntityOffsetY(0, 0)
            id_y.push(0)

        else if m.game.char.getEntityPosY() - m.game.screen.GetHeight() / 2 > m.game.terrain.getEntityOffsetY(m.game.terrain.config.Count() - 1, 0)
            id_y.push(m.game.terrain.config.Count() - 1)

        else
            for i = 0 to m.game.terrain.config.Count() - 2
                if m.game.char.getEntityPosY() - m.game.screen.GetHeight() / 2 >= m.game.terrain.getEntityOffsetY(i, 0) and m.game.char.getEntityPosY() - m.game.screen.GetHeight() / 2 <= m.game.terrain.getEntityOffsetY(i + 1, 0)
                    id_y.push(i)
                    id_y.push(i + 1)  
                    i = m.game.terrain.config.Count()

                end if

            end for

        end if

        for i = 0 to id_y.Count() - 1
            for j = 0 to id_x.Count() - 1
                if m.getImage(m.game.terrain.getEntityName(id_y[i], id_x[j]).toStr() + "_" + id_y[i].toStr() + id_x[j].toStr()) = invalid
                    
                    m.entityLoad(id_y, id_x, i, j)

                    ' add
                    m.addAnimatedImage(m.game.terrain.getEntityName(id_y[i], id_x[j]).toStr() + "_" + id_y[i].toStr() + id_x[j].toStr(), m.terrain_regions, { index: 0
                        offset_x: m.game.terrain.getEntityOffsetX(id_y[i], id_x[j]) 
                        offset_y: m.game.terrain.getEntityOffsetY(id_y[i], id_x[j])
                    })
                   
                end if
            end for

        end for

        ' fix stas - add entityUnload, remove testContainsArray
        for i = 0 to m.game.terrain.config.Count() - 1
            for j = 0 to m.game.terrain.config[i].Count() - 1
                if m.getImage(m.game.terrain.getEntityName(i, j).toStr() + "_" + i.toStr() + j.toStr()) <> invalid and (not m.testContainsArray(id_x, j) or not m.testContainsArray(id_y, i))
                    ' remove    
                    m.removeImage(m.game.terrain.getEntityName(i, j).toStr() + "_" + i.toStr() + j.toStr())
                end if
            end for

        end for

    end function

    object.testContainsArray = function(array, element)
        isContains = false
        for each item in array
            if item = element
                isContains = true
                exit for
            end if
        end for

        return isContains
    end function


    object.onUpdate = function(dt as float)

        m.entityXY()
        m.entityGen()

    end function
    
end function
function terrain_view(object)

    object.funcName = "terrain_view"

    object.onCreate = function(args)

    end function

    object.loadEntity = function(id_y, id_x, i, j)

        m.terrain_regions = []

        for k = 0 to m.game.terrain.config[id_y[i]][id_x[j]].reg.Count() - 1

            if m.game.getBitmap(m.funcName + "_" + m.game.terrain.getRegElement(id_y[i], id_x[j], k).toStr()) = invalid
                ' loadBitmap
                m.game.loadBitmap(m.funcName + "_" + m.game.terrain.getRegElement(id_y[i], id_x[j], k).toStr(), "pkg:/media/terrain/sprites/" + m.game.terrain.getRegElement(id_y[i], id_x[j], k).toStr() + ".png")
            end if

            ' getBitmap
            terrain_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.terrain.getRegElement(id_y[i], id_x[j], k).toStr())

            ' roRegion
            terrain_region = CreateObject("roRegion", terrain_bitmap, 0, 0, terrain_bitmap.GetWidth(), terrain_bitmap.GetHeight())

            m.terrain_regions.push(terrain_region)
        end for

    end function

    object.unloadEntity = function(i, j)

        for k = 0 to m.game.terrain.config[i][j].reg.Count() - 1

            if m.game.getBitmap(m.funcName + "_" + m.game.terrain.getRegElement(i, j, k).toStr()) <> invalid
                ' unloadBitmap
                m.game.unloadBitmap(m.funcName + "_" + m.game.terrain.getRegElement(i, j, k).toStr())
            end if

        end for
    end function

    object.genEntity = function()

        if m.game.terrain.config.Count() <> 0
            id_x = []
            id_y = []

            ' load & add
            if - m.game.map.getOffsetX() <= m.game.terrain.getOffsetX(0, 0)
                id_x.push(0)

            else if - m.game.map.getOffsetX() > m.game.terrain.getOffsetX(0, m.game.terrain.config[0].Count() - 1)
                id_x.push(m.game.terrain.config[0].Count() - 1)

            else
                for i = 0 to m.game.terrain.config[0].Count() - 2
                    if - m.game.map.getOffsetX() >= m.game.terrain.getOffsetX(0, i) and - m.game.map.getOffsetX() <= m.game.terrain.getOffsetX(0, i + 1)
                        id_x.push(i)
                        id_x.push(i + 1) 
                        i = m.game.terrain.config[0].Count()

                    end if

                end for

            end if

            if - m.game.map.getOffsetY() <= m.game.terrain.getOffsetY(0, 0)
                id_y.push(0)

            else if - m.game.map.getOffsetY() > m.game.terrain.getOffsetY(m.game.terrain.config.Count() - 1, 0)
                id_y.push(m.game.terrain.config.Count() - 1)

            else
                for i = 0 to m.game.terrain.config.Count() - 2
                    if - m.game.map.getOffsetY() >= m.game.terrain.getOffsetY(i, 0) and - m.game.map.getOffsetY() <= m.game.terrain.getOffsetY(i + 1, 0)
                        id_y.push(i)
                        id_y.push(i + 1)  
                        i = m.game.terrain.config.Count()

                    end if

                end for

            end if

            for i = 0 to id_y.Count() - 1
                for j = 0 to id_x.Count() - 1
                    if m.getImage(m.game.terrain.getName(id_y[i], id_x[j]).toStr() + "_" + id_y[i].toStr() + id_x[j].toStr()) = invalid
                        
                        ' load
                        m.loadEntity(id_y, id_x, i, j)

                        ' add
                        m.addAnimatedImage(m.game.terrain.getName(id_y[i], id_x[j]).toStr() + "_" + id_y[i].toStr() + id_x[j].toStr(), m.terrain_regions, { index: m.game.terrain.getIndex(i, j)
                            offset_x: m.game.terrain.getOffsetX(id_y[i], id_x[j]) 
                            offset_y: m.game.terrain.getOffsetY(id_y[i], id_x[j])
                        })
                    
                    end if
                end for

            end for

            ' unload & remove
            for i = 0 to m.game.terrain.config.Count() - 1
                for j = 0 to m.game.terrain.config[i].Count() - 1
                    if m.getImage(m.game.terrain.getName(i, j).toStr() + "_" + i.toStr() + j.toStr()) <> invalid and (not arrayUtils().contains(id_x, j) or not arrayUtils().contains(id_y, i))
                        
                        ' unload
                        ' m.unloadEntity(i, j)
                                            
                        ' remove    
                        m.removeImage(m.game.terrain.getName(i, j).toStr() + "_" + i.toStr() + j.toStr())

                    end if
                end for

            end for

        end if

    end function

    object.onUpdate = function(dt as float)

        m.genEntity()

    end function

    object.onDestroy = function()
        for i = 0 to m.game.terrain.config.Count() - 1
            for j = 0 to m.game.terrain.config[i].Count() - 1
                m.unloadEntity(i, j)
            end for
        end for
        
    end function
    
end function
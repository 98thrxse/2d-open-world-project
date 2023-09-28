sub filler_view(object)

    object.funcName = "filler_view"

    object.loadEntity = sub(id_y as object, id_x as object, i as integer, j as integer)

        m.filler_regions = []

        for k = 0 to m.game.filler.config[id_y[i]][id_x[j]].reg.Count() - 1

            if m.game.getBitmap(m.funcName + "_" + m.game.filler.getRegElement(id_y[i], id_x[j], k).toStr()) = invalid
                ' loadBitmap
                m.game.loadBitmap(m.funcName + "_" + m.game.filler.getRegElement(id_y[i], id_x[j], k).toStr(), "pkg:/media/filler/sprites/" + m.game.filler.getRegElement(id_y[i], id_x[j], k).toStr() + ".png")
            end if

            ' getBitmap
            filler_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.filler.getRegElement(id_y[i], id_x[j], k).toStr())

            ' roRegion
            filler_region = CreateObject("roRegion", filler_bitmap, 0, 0, filler_bitmap.GetWidth(), filler_bitmap.GetHeight())

            m.filler_regions.push(filler_region)
        end for

    end sub

    object.loadAllEntity = sub()
        if m.filler_regions = invalid then 
            m.filler_regions = []

            for i = 0 to m.game.filler.config.Count() - 1

                m.filler_regions.push(i)
                m.filler_regions[i] = []

                for j = 0 to m.game.filler.config[i].Count() - 1

                    m.filler_regions[i].push(j)
                    m.filler_regions[i][j] = []

                    for k = 0 to m.game.filler.config[i][j].reg.Count() - 1

                        if m.game.getBitmap(m.funcName + "_" + m.game.filler.getRegElement(i, j, k).toStr()) = invalid
                            ' loadBitmap
                            m.game.loadBitmap(m.funcName + "_" + m.game.filler.getRegElement(i, j, k).toStr(), "pkg:/media/filler/sprites/" + m.game.filler.getRegElement(i, j, k).toStr() + ".png")
                        end if

                        ' getBitmap
                        filler_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.filler.getRegElement(i, j, k).toStr())

                        ' roRegion
                        filler_region = CreateObject("roRegion", filler_bitmap, 0, 0, filler_bitmap.GetWidth(), filler_bitmap.GetHeight())

                        m.filler_regions[i][j].push(filler_region)

                    end for
                end for
            end for
        end if
    end sub

    object.unloadEntity = sub(i as integer, j as integer)

        for k = 0 to m.game.filler.config[i][j].reg.Count() - 1

            if m.game.getBitmap(m.funcName + "_" + m.game.filler.getRegElement(i, j, k).toStr()) <> invalid
                ' unloadBitmap
                m.game.unloadBitmap(m.funcName + "_" + m.game.filler.getRegElement(i, j, k).toStr())
            end if

        end for
    end sub

    object.unloadAllEntity = sub()
        for i = 0 to m.game.filler.config.Count() - 1
            for j = 0 to m.game.filler.config[i].Count() - 1
                for k = 0 to m.game.filler.config[i][j].reg.Count() - 1

                    if m.game.getBitmap(m.funcName + "_" + m.game.filler.getRegElement(i, j, k).toStr()) <> invalid
                        ' unloadBitmap
                        m.game.unloadBitmap(m.funcName + "_" + m.game.filler.getRegElement(i, j, k).toStr())
                    end if
                end for
            end for
        end for

        m.filler_regions = invalid
    end sub

    object.genEntity = sub()

        if m.game.filler.config.Count() <> 0
            id_x = []
            id_y = []

            ' load & add
            if - m.game.map.getOffsetX() <= m.game.filler.getOffsetX(0, 0)
                id_x.push(0)

            else if - m.game.map.getOffsetX() > m.game.filler.getOffsetX(0, m.game.filler.config[0].Count() - 1)
                id_x.push(m.game.filler.config[0].Count() - 1)

            else
                for i = 0 to m.game.filler.config[0].Count() - 2
                    if - m.game.map.getOffsetX() >= m.game.filler.getOffsetX(0, i) and - m.game.map.getOffsetX() <= m.game.filler.getOffsetX(0, i + 1)
                        id_x.push(i)
                        id_x.push(i + 1) 
                        i = m.game.filler.config[0].Count()

                    end if

                end for

            end if

            if - m.game.map.getOffsetY() <= m.game.filler.getOffsetY(0, 0)
                id_y.push(0)

            else if - m.game.map.getOffsetY() > m.game.filler.getOffsetY(m.game.filler.config.Count() - 1, 0)
                id_y.push(m.game.filler.config.Count() - 1)

            else
                for i = 0 to m.game.filler.config.Count() - 2
                    if - m.game.map.getOffsetY() >= m.game.filler.getOffsetY(i, 0) and - m.game.map.getOffsetY() <= m.game.filler.getOffsetY(i + 1, 0)
                        id_y.push(i)
                        id_y.push(i + 1)  
                        i = m.game.filler.config.Count()

                    end if

                end for

            end if

            for i = 0 to id_y.Count() - 1
                for j = 0 to id_x.Count() - 1
                    if m.getImage(m.game.filler.getName(id_y[i], id_x[j]).toStr() + "_" + id_y[i].toStr() + id_x[j].toStr()) = invalid
                        
                        ' load (dynamic)
                        ' m.loadEntity(id_y, id_x, i, j)
                        
                        ' add (dynamic)
                        ' m.addAnimatedImage(m.game.filler.getName(id_y[i], id_x[j]).toStr() + "_" + id_y[i].toStr() + id_x[j].toStr(), m.filler_regions, { index: m.game.filler.getIndex(i, j)
                        '     offset_x: m.game.filler.getOffsetX(id_y[i], id_x[j]) 
                        '     offset_y: m.game.filler.getOffsetY(id_y[i], id_x[j])
                        ' })

                        ' add (all)
                        m.addAnimatedImage(m.game.filler.getName(id_y[i], id_x[j]).toStr() + "_" + id_y[i].toStr() + id_x[j].toStr(), m.filler_regions[id_y[i]][id_x[j]], { index: m.game.filler.getIndex(i, j)
                            offset_x: m.game.filler.getOffsetX(id_y[i], id_x[j]) 
                            offset_y: m.game.filler.getOffsetY(id_y[i], id_x[j])
                        })
                    
                    end if
                end for

            end for

            ' unload & remove
            for i = 0 to m.game.filler.config.Count() - 1
                for j = 0 to m.game.filler.config[i].Count() - 1
                    if m.getImage(m.game.filler.getName(i, j).toStr() + "_" + i.toStr() + j.toStr()) <> invalid and (not arrayUtils().contains(id_x, j) or not arrayUtils().contains(id_y, i))
                        
                        ' unload
                        ' m.unloadEntity(i, j)
                                            
                        ' remove    
                        m.removeImage(m.game.filler.getName(i, j).toStr() + "_" + i.toStr() + j.toStr())

                    end if
                end for

            end for

        end if

    end sub

    object.onUpdate = sub(dt as float)
        m.loadAllEntity()
        m.genEntity()
    end sub

    object.onDestroy = sub()
        m.unloadAllEntity()
    end sub
    
end sub
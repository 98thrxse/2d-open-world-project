sub map_control(object)
    
    object.onUpdate = sub(dt as float)
        if m.map = invalid or m.game.char.getMap() <> m.map
            if m.map <> invalid then m.destroyMap()
            m.createMap()
            m.getConfigs()
            m.setConfigs()
            m.updatePos()
        end if
    end sub

    object.createMap = sub()
        ' createInstance
        m.game.createInstance("char_init")
        m.game.createInstance("hud_init")
        m.game.createInstance("marker_init")
        m.game.createInstance("npc_init")
        m.game.createInstance("veh_init")
        m.game.createInstance("obj_init")
        m.game.createInstance("terrain_init")
        m.game.createInstance("filler_init")

        m.game.createInstance("interact_init")
    end sub

    object.destroyMap = sub()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("char_init"))
        m.game.destroyInstance(m.game.getInstanceByName("hud_init"))
        m.game.destroyInstance(m.game.getInstanceByName("marker_init"))
        m.game.destroyInstance(m.game.getInstanceByName("obj_init"))
        m.game.destroyInstance(m.game.getInstanceByName("npc_init"))
        m.game.destroyInstance(m.game.getInstanceByName("veh_init"))
        m.game.destroyInstance(m.game.getInstanceByName("terrain_init"))
        m.game.destroyInstance(m.game.getInstanceByName("filler_init"))

        m.game.destroyInstance(m.game.getInstanceByName("interact_init"))
    end sub

    object.getConfigs = sub()
        if m.game.char.getMap() = invalid then m.game.char.setMap(m.game.map.getStartMap())
        m.map = m.game.char.getMap()
        
        if m.game.char.getMap() = "testOne"
            m.map_char_config = testOne_char_config()
            m.map_obj_config = testOne_obj_config()
            m.map_npc_config = testOne_npc_config()
            m.map_veh_config = testOne_veh_config()
            m.map_terrain_config = testOne_terrain_config()
            m.map_hud_config = testOne_hud_config()
            m.map_marker_config = testOne_marker_config()
            m.map_filler_config = testOne_filler_config()

        else if m.game.char.getMap() = "testTwo"
            m.map_char_config = testTwo_char_config()
            m.map_obj_config = testTwo_obj_config()
            m.map_npc_config = testTwo_npc_config()
            m.map_veh_config = testTwo_veh_config()
            m.map_terrain_config = testTwo_terrain_config()
            m.map_hud_config = testTwo_hud_config()
            m.map_marker_config = testTwo_marker_config()
            m.map_filler_config = testTwo_filler_config()
        end if

    end sub

    object.setConfigs = sub()
        m.loadChar()
        m.loadNPC()
        m.loadObj()
        m.loadVeh()
        m.loadTerrain()
        m.loadhud()
        m.loadMarker()
        m.loadFiller()
    end sub
    
    object.loadFiller = sub()
        ' loading map config to filler data      
        for i = 0 to m.map_filler_config.Count() - 1
            if i > m.game.filler.config.Count() - 1
                m.game.filler.config.push(m.map_filler_config[i])
            else
                if m.game.filler.config[i].Count() < m.map_filler_config[i].Count()
                    for j = m.game.filler.config[i].Count() to m.map_filler_config[i].Count() - 1
                        m.game.filler.config[i].push({
                            id: [i, j],
                            name: invalid,
                            reg: [],
                            offset: {
                                x: invalid,
                                y: invalid
                            },
                            time: invalid
                        })
                    end for
                else if m.game.filler.config[i].Count() > m.map_filler_config[i].Count()
                    for j = m.map_filler_config[i].Count() to m.game.filler.config[i].Count() - 1
                        m.game.filler.config[i].pop()
                    end for
                end if
            end if
        end for

        if m.game.filler.config.Count() > m.map_filler_config.Count()
            for i = m.map_filler_config.Count() to m.game.filler.config.Count() - 1
                m.game.filler.config.pop()
            end for
        end if

        for i = 0 to m.map_filler_config.Count() - 1
            for j = 0 to m.map_filler_config[i].Count() - 1

                if m.map_filler_config[i][j].name <> invalid then m.game.filler.setName(i, j, m.map_filler_config[i][j].name)
                if m.map_filler_config[i][j].offset.x <> invalid then m.game.filler.setOffsetX(i, j, m.map_filler_config[i][j].offset.x)
                if m.map_filler_config[i][j].offset.y <> invalid then m.game.filler.setOffsetY(i, j, m.map_filler_config[i][j].offset.y)
                if m.map_filler_config[i][j].reg <> invalid then m.game.filler.setReg(i, j, m.map_filler_config[i][j].reg)
                if m.map_filler_config[i][j].index <> invalid then m.game.filler.setIndex(i, j, m.map_filler_config[i][j].index)
                if m.map_filler_config[i][j].time <> invalid then m.game.filler.setAnimTime(i, j, m.map_filler_config[i][j].time)

            end for
        end for
    end sub


    object.loadTerrain = sub()
        ' loading map config to terrain data      
        for i = 0 to m.map_terrain_config.Count() - 1
            if i > m.game.terrain.config.Count() - 1
                m.game.terrain.config.push(m.map_terrain_config[i])
            else
                if m.game.terrain.config[i].Count() < m.map_terrain_config[i].Count()
                    for j = m.game.terrain.config[i].Count() to m.map_terrain_config[i].Count() - 1
                        m.game.terrain.config[i].push({
                            id: [i, j],
                            name: invalid,
                            reg: [],
                            offset: {
                                x: invalid,
                                y: invalid
                            }
                        })
                    end for
                else if m.game.terrain.config[i].Count() > m.map_terrain_config[i].Count()
                    for j = m.map_terrain_config[i].Count() to m.game.terrain.config[i].Count() - 1
                        m.game.terrain.config[i].pop()
                    end for
                end if
            end if
        end for

        if m.game.terrain.config.Count() > m.map_terrain_config.Count()
            for i = m.map_terrain_config.Count() to m.game.terrain.config.Count() - 1
                m.game.terrain.config.pop()
            end for
        end if

        for i = 0 to m.map_terrain_config.Count() - 1
            for j = 0 to m.map_terrain_config[i].Count() - 1

                if m.map_terrain_config[i][j].name <> invalid then m.game.terrain.setName(i, j, m.map_terrain_config[i][j].name)
                if m.map_terrain_config[i][j].offset.x <> invalid then m.game.terrain.setOffsetX(i, j, m.map_terrain_config[i][j].offset.x)
                if m.map_terrain_config[i][j].offset.y <> invalid then m.game.terrain.setOffsetY(i, j, m.map_terrain_config[i][j].offset.y)
                if m.map_terrain_config[i][j].reg <> invalid then m.game.terrain.setReg(i, j, m.map_terrain_config[i][j].reg)
                if m.map_terrain_config[i][j].index <> invalid then m.game.terrain.setIndex(i, j, m.map_terrain_config[i][j].index)

            end for
        end for
    end sub


    object.loadObj = sub()

        ' loading map config to obj data
        if m.game.obj.config.Count() < m.map_obj_config.Count()
            for i = m.game.obj.config.Count() to m.map_obj_config.Count() - 1
                m.game.obj.config.push({
                    id: i,                   
                    name: invalid,
                    index: invalid,
                    alpha: invalid,
                    reg: []
                    col: {
                        x: invalid,
                        y: invalid,
                        width: invalid,
                        height: invalid
                    },
                    entity: {
                        x: invalid,
                        y: invalid,
                        width: invalid,
                        height: invalid
                    }
                })
            end for
        else if m.game.obj.config.Count() > m.map_obj_config.Count()
            for i = m.map_obj_config.Count() to m.game.obj.config.Count() - 1
                m.game.obj.config.pop()
            end for
        end if

        for i = 0 to m.map_obj_config.Count() - 1

            if m.map_obj_config[i].name <> invalid then m.game.obj.setName(i, m.map_obj_config[i].name)
            if m.map_obj_config[i].index <> invalid then m.game.obj.setIndex(i, m.map_obj_config[i].index)
            if m.map_obj_config[i].col.x <> invalid then m.game.obj.setColX(i, m.map_obj_config[i].col.x)
            if m.map_obj_config[i].col.y <> invalid then m.game.obj.setColY(i, m.map_obj_config[i].col.y)
            if m.map_obj_config[i].col.width <> invalid then m.game.obj.setColW(i, m.map_obj_config[i].col.width)
            if m.map_obj_config[i].col.height <> invalid then m.game.obj.setColH(i, m.map_obj_config[i].col.height)
            if m.map_obj_config[i].entity.x <> invalid then m.game.obj.setEntityX(i, m.map_obj_config[i].entity.x)
            if m.map_obj_config[i].entity.y <> invalid then m.game.obj.setEntityY(i, m.map_obj_config[i].entity.y)
            if m.map_obj_config[i].entity.width <> invalid then m.game.obj.setEntityW(i, m.map_obj_config[i].entity.width)
            if m.map_obj_config[i].entity.height <> invalid then m.game.obj.setEntityH(i, m.map_obj_config[i].entity.height)
            if m.map_obj_config[i].alpha <> invalid then m.game.obj.setAlpha(i, m.map_obj_config[i].alpha)
            if m.map_obj_config[i].reg <> invalid then m.game.obj.setReg(i, m.map_obj_config[i].reg)

        end for
    end sub

    object.loadMarker = sub()
        ' loading map config to marker data
        if m.game.marker.config.Count() < m.map_marker_config.Count()
            for i = m.game.marker.config.Count() to m.map_marker_config.Count() - 1
                m.game.marker.config.push({
                    id: i,                   
                    name: invalid,
                    index: invalid,
                    alpha: invalid,
                    reg: []
                    offset: {
                        x: invalid,
                        y: invalid
                    },
                    size: {
                        width: invalid,
                        height: invalid
                    }
                    transition: {
                        name: invalid,
                        x: invalid,
                        y: invalid
                    }
                })
            end for
        else if m.game.marker.config.Count() > m.map_marker_config.Count()
            for i = m.map_marker_config.Count() to m.game.marker.config.Count() - 1
                m.game.marker.config.pop()
            end for
        end if

        for i = 0 to m.map_marker_config.Count() - 1

            if m.map_marker_config[i].name <> invalid then m.game.marker.setName(i, m.map_marker_config[i].name)
            if m.map_marker_config[i].offset.x <> invalid then m.game.marker.setOffsetX(i, m.map_marker_config[i].offset.x)
            if m.map_marker_config[i].offset.y <> invalid then m.game.marker.setOffsetY(i, m.map_marker_config[i].offset.y)
            if m.map_marker_config[i].size.width <> invalid then m.game.marker.setSizeW(i, m.map_marker_config[i].size.width)
            if m.map_marker_config[i].size.height <> invalid then m.game.marker.setSizeH(i, m.map_marker_config[i].size.height)
            if m.map_marker_config[i].alpha <> invalid then m.game.marker.setAlpha(i, m.map_marker_config[i].alpha)
            if m.map_marker_config[i].reg <> invalid then m.game.marker.setReg(i, m.map_marker_config[i].reg)
            if m.map_marker_config[i].index <> invalid then m.game.marker.setIndex(i, m.map_marker_config[i].index)
            if m.map_marker_config[i].transition.name <> invalid then m.game.marker.setMap(i, m.map_marker_config[i].transition.name)
            if m.map_marker_config[i].transition.x <> invalid then m.game.marker.setTransitionX(i, m.map_marker_config[i].transition.x)
            if m.map_marker_config[i].transition.y <> invalid then m.game.marker.setTransitionY(i, m.map_marker_config[i].transition.y)

        end for

    end sub

    object.loadNPC = sub()

        ' loading map config to npc data
        if m.game.npc.config.Count() < m.map_npc_config.Count()
            for i = m.game.npc.config.Count() to m.map_npc_config.Count() - 1
                m.game.npc.config.push({
                    id: i,       
                    name: invalid,
                    index: invalid,
                    alpha: invalid,
                    reg: [],
                    offset: {
                        x: invalid,
                        y: invalid
                    },

                    scale: {
                        x: invalid,
                        y: invalid
                    },

                    time: invalid,
                    size: {
                        width: invalid,
                        height: invalid
                    }
    
                    path: {
                        cycle: invalid,
                        position: []
                    },
                    hp: invalid,
                    speed: {
                        up: invalid,
                        down: invalid,
                        left: invalid,
                        right: invalid
                    }
                })
            end for
        else if m.game.npc.config.Count() > m.map_npc_config.Count()
            for i = m.map_npc_config.Count() to m.game.npc.config.Count() - 1
                m.game.npc.config.pop()
            end for
        end if

        for i = 0 to m.map_npc_config.Count() - 1

            if m.map_npc_config[i].hp <> invalid then m.game.npc.setHP(i, m.map_npc_config[i].hp)
            if m.map_npc_config[i].path.position <> invalid then m.game.npc.setPath(i, m.map_npc_config[i].path.position)
            if m.map_npc_config[i].path.cycle <> invalid then m.game.npc.setPathCycle(i, m.map_npc_config[i].path.cycle)
            if m.map_npc_config[i].speed.up <> invalid then m.game.npc.setUpSpeed(i, m.map_npc_config[i].speed.up)
            if m.map_npc_config[i].speed.down <> invalid then m.game.npc.setDownSpeed(i, m.map_npc_config[i].speed.down)
            if m.map_npc_config[i].speed.left <> invalid then m.game.npc.setLeftSpeed(i, m.map_npc_config[i].speed.left)
            if m.map_npc_config[i].speed.right <> invalid then m.game.npc.setRightSpeed(i, m.map_npc_config[i].speed.right)
            if m.map_npc_config[i].name <> invalid then m.game.npc.setName(i, m.map_npc_config[i].name)
            if m.map_npc_config[i].offset.x <> invalid then m.game.npc.setOffsetX(i, m.map_npc_config[i].offset.x)
            if m.map_npc_config[i].offset.y <> invalid then m.game.npc.setOffsetY(i, m.map_npc_config[i].offset.y)
            if m.map_npc_config[i].size.width <> invalid then m.game.npc.setSizeW(i, m.map_npc_config[i].size.width)
            if m.map_npc_config[i].size.height <> invalid then m.game.npc.setSizeH(i, m.map_npc_config[i].size.height)
            if m.map_npc_config[i].index <> invalid then m.game.npc.setIndex(i, m.map_npc_config[i].index)
            if m.map_npc_config[i].time <> invalid then m.game.npc.setAnimTime(i, m.map_npc_config[i].time)
            if m.map_npc_config[i].scale.x <> invalid then m.game.npc.setScaleX(i, m.map_npc_config[i].scale.x)
            if m.map_npc_config[i].scale.y <> invalid then m.game.npc.setScaleY(i, m.map_npc_config[i].scale.y)
            if m.map_npc_config[i].alpha <> invalid then m.game.npc.setAlpha(i, m.map_npc_config[i].alpha)
            if m.map_npc_config[i].reg <> invalid then m.game.npc.setReg(i, m.map_npc_config[i].reg)

        end for

    end sub

    object.loadVeh = sub()

        ' loading map config to veh data
        if m.game.veh.config.Count() < m.map_veh_config.Count()
            for i = m.game.veh.config.Count() to m.map_veh_config.Count() - 1
                m.game.veh.config.push({
                    id: i,       
                    name: invalid,
                    name_up: invalid,
                    name_down: invalid,
                    name_left: invalid,
                    name_right: invalid,
                    index: invalid,
                    alpha: invalid,
                    reg: [],
                    col: {
                        x: invalid,
                        y: invalid,
                        width: invalid,
                        height: invalid,
                        npc: invalid,
                        marker: invalid,
                        veh: invalid,
                        up: invalid,
                        down: invalid
                        left: invalid,
                        right: invalid
                    },
                    entity: {
                        x: invalid,
                        y: invalid,
                        width: invalid,
                        height: invalid
                    }
                    scale: {
                        x: invalid,
                        y: invalid
                    },
                    speed: {
                        up: invalid,
                        down: invalid,
                        left: invalid,
                        right: invalid
                    },
                    time: invalid
                })
            end for
        else if m.game.veh.config.Count() > m.map_veh_config.Count()
            for i = m.map_veh_config.Count() to m.game.veh.config.Count() - 1
                m.game.veh.config.pop()
            end for
        end if

        for i = 0 to m.map_veh_config.Count() - 1

            if m.map_veh_config[i].speed.up <> invalid then m.game.veh.setUpSpeed(i, m.map_veh_config[i].speed.up)
            if m.map_veh_config[i].speed.down <> invalid then m.game.veh.setDownSpeed(i, m.map_veh_config[i].speed.down)
            if m.map_veh_config[i].speed.left <> invalid then m.game.veh.setLeftSpeed(i, m.map_veh_config[i].speed.left)
            if m.map_veh_config[i].speed.right <> invalid then m.game.veh.setRightSpeed(i, m.map_veh_config[i].speed.right)
            if m.map_veh_config[i].name <> invalid then m.game.veh.setName(i, m.map_veh_config[i].name)
            if m.map_veh_config[i].entity.x <> invalid then m.game.veh.setEntityX(i, m.map_veh_config[i].entity.x)
            if m.map_veh_config[i].entity.y <> invalid then m.game.veh.setEntityY(i, m.map_veh_config[i].entity.y)
            if m.map_veh_config[i].entity.width <> invalid then m.game.veh.setEntityW(i, m.map_veh_config[i].entity.width)
            if m.map_veh_config[i].entity.height <> invalid then m.game.veh.setEntityH(i, m.map_veh_config[i].entity.height)
            if m.map_veh_config[i].col.x <> invalid then m.game.veh.setColX(i, m.map_veh_config[i].col.x)
            if m.map_veh_config[i].col.y <> invalid then m.game.veh.setColY(i, m.map_veh_config[i].col.y)
            if m.map_veh_config[i].col.width <> invalid then m.game.veh.setColW(i, m.map_veh_config[i].col.width)
            if m.map_veh_config[i].col.height <> invalid then m.game.veh.setColH(i, m.map_veh_config[i].col.height)
            if m.map_veh_config[i].index <> invalid then m.game.veh.setIndex(i, m.map_veh_config[i].index)
            if m.map_veh_config[i].scale.x <> invalid then m.game.veh.setScaleX(i, m.map_veh_config[i].scale.x)
            if m.map_veh_config[i].scale.y <> invalid then m.game.veh.setScaleY(i, m.map_veh_config[i].scale.y)
            if m.map_veh_config[i].reg <> invalid then m.game.veh.setReg(i, m.map_veh_config[i].reg)
            if m.map_veh_config[i].time <> invalid then m.game.veh.setAnimTime(i, m.map_veh_config[i].time)
            if m.map_veh_config[i].alpha <> invalid then m.game.veh.setAlpha(i, m.map_veh_config[i].alpha)
            if m.map_veh_config[i].col.up <> invalid then m.game.veh.setColUp(i, m.map_veh_config[i].col.up)
            if m.map_veh_config[i].col.down <> invalid then m.game.veh.setColDown(i, m.map_veh_config[i].col.down)
            if m.map_veh_config[i].col.left <> invalid then m.game.veh.setColLeft(i, m.map_veh_config[i].col.left)
            if m.map_veh_config[i].col.right <> invalid then m.game.veh.setColRight(i, m.map_veh_config[i].col.right)
            if m.map_veh_config[i].col.npc <> invalid then m.game.veh.setNPCCol(i, m.map_veh_config[i].col.npc)
            if m.map_veh_config[i].col.marker <> invalid then m.game.veh.setMarkerCol(i, m.map_veh_config[i].col.marker)
            if m.map_veh_config[i].col.veh <> invalid then m.game.veh.setVehCol(i, m.map_veh_config[i].col.veh)
            if m.map_veh_config[i].name_up <> invalid then m.game.veh.setColUpName(i, m.map_veh_config[i].name_up)
            if m.map_veh_config[i].name_down <> invalid then m.game.veh.setColDownName(i, m.map_veh_config[i].name_down)
            if m.map_veh_config[i].name_left <> invalid then m.game.veh.setColLeftName(i, m.map_veh_config[i].name_left)
            if m.map_veh_config[i].name_right <> invalid then m.game.veh.setColRightName(i, m.map_veh_config[i].name_right)
       
        end for

    end sub

    object.loadChar = sub()

        ' loading map config to player data
        if m.map_char_config.name <> invalid and m.game.char.getEntityName() = invalid then m.game.char.setEntityName(m.map_char_config.name)
        if m.map_char_config.pos.x <> invalid and m.game.char.getEntityX() = invalid then m.game.char.setEntityX(m.map_char_config.pos.x)
        if m.map_char_config.pos.y <> invalid and m.game.char.getEntityY() = invalid then m.game.char.setEntityY(m.map_char_config.pos.y)
        if m.map_char_config.size.width <> invalid and m.game.char.getSizeW() = invalid then m.game.char.setSizeW(m.map_char_config.size.width)
        if m.map_char_config.size.height <> invalid and m.game.char.getSizeH() = invalid then m.game.char.setSizeH(m.map_char_config.size.height)
        if m.map_char_config.index <> invalid and m.game.char.getIndex() = invalid then m.game.char.setIndex(m.map_char_config.index)
        if m.map_char_config.alpha <> invalid and m.game.char.getAlpha() = invalid then m.game.char.setAlpha(m.map_char_config.alpha)
        if m.map_char_config.time <> invalid and m.game.char.getAnimTime() = invalid then m.game.char.setAnimTime(m.map_char_config.time)
        if m.map_char_config.scale.x <> invalid and m.game.char.getScaleX() = invalid then m.game.char.setScaleX(m.map_char_config.scale.x)
        if m.map_char_config.scale.y <> invalid and m.game.char.getScaleY() = invalid then m.game.char.setScaleY(m.map_char_config.scale.y)
        if m.map_char_config.offset.x <> invalid and m.game.char.getOffsetX() = invalid then m.game.char.setOffsetX(m.map_char_config.offset.x)
        if m.map_char_config.offset.y <> invalid and m.game.char.getOffsetY() = invalid then m.game.char.setOffsetY(m.map_char_config.offset.y)
        if m.map_char_config.reg <> invalid and m.game.char.getReg() = invalid then m.game.char.setReg(m.map_char_config.reg)
        if m.map_char_config.name_up <> invalid and m.game.char.getColUpName() = invalid then m.game.char.setColUpName(m.map_char_config.name_up)
        if m.map_char_config.name_down <> invalid and m.game.char.getColDownName() = invalid then m.game.char.setColDownName(m.map_char_config.name_down)
        if m.map_char_config.name_left <> invalid and m.game.char.getColLeftName() = invalid then m.game.char.setColLeftName(m.map_char_config.name_left)
        if m.map_char_config.name_right <> invalid and m.game.char.getColRightName() = invalid then m.game.char.setColRightName(m.map_char_config.name_right)
        if m.map_char_config.hp <> invalid and m.game.char.getHP() = invalid then m.game.char.setHP(m.map_char_config.hp)
        if m.map_char_config.sp <> invalid and m.game.char.getSP() = invalid then m.game.char.setSP(m.map_char_config.sp)
        if m.map_char_config.speed.up <> invalid and m.game.char.getUpSpeed() = invalid then m.game.char.setUpSpeed(m.map_char_config.speed.up)
        if m.map_char_config.speed.down <> invalid and m.game.char.getDownSpeed() = invalid then m.game.char.setDownSpeed(m.map_char_config.speed.down)
        if m.map_char_config.speed.left <> invalid and m.game.char.getLeftSpeed() = invalid then m.game.char.setLeftSpeed(m.map_char_config.speed.left)
        if m.map_char_config.speed.right <> invalid and m.game.char.getRightSpeed() = invalid then m.game.char.setRightSpeed(m.map_char_config.speed.right)
        if m.map_char_config.damage.hp <> invalid and m.game.char.getHPDamage() = invalid then m.game.char.setHPDamage(m.map_char_config.damage.hp)
        if m.map_char_config.damage.sp <> invalid and m.game.char.getSPDamage() = invalid then m.game.char.setSPDamage(m.map_char_config.damage.sp)
        if m.map_char_config.damage.hp_time <> invalid and m.game.char.getHPDamageTime() = invalid then m.game.char.setHPDamageTime(m.map_char_config.damage.hp_time)
        if m.map_char_config.damage.sp_time <> invalid and m.game.char.getSPDamageTime() = invalid then m.game.char.setSPDamageTime(m.map_char_config.damage.sp_time)
        if m.map_char_config.regen.hp <> invalid and m.game.char.getHPRegen() = invalid then m.game.char.setHPRegen(m.map_char_config.regen.hp)
        if m.map_char_config.regen.sp <> invalid and m.game.char.getSPRegen() = invalid then m.game.char.setSPRegen(m.map_char_config.regen.sp)
        if m.map_char_config.regen.hp_time <> invalid and m.game.char.getHPRegenTime() = invalid then m.game.char.setHPRegenTime(m.map_char_config.regen.hp_time)
        if m.map_char_config.regen.sp_time <> invalid and m.game.char.getSPRegenTime() = invalid then m.game.char.setSPRegenTime(m.map_char_config.regen.sp_time)

        ' no need to load from prev session
        if m.map_char_config.col.up <> invalid then m.game.char.setColUp(m.map_char_config.col.up)
        if m.map_char_config.col.down <> invalid then m.game.char.setColDown(m.map_char_config.col.down)
        if m.map_char_config.col.left <> invalid then m.game.char.setColLeft(m.map_char_config.col.left)
        if m.map_char_config.col.right <> invalid then m.game.char.setColRight(m.map_char_config.col.right)
        if m.map_char_config.col.npc <> invalid then m.game.char.setNPCCol(m.map_char_config.col.npc)
        if m.map_char_config.col.marker <> invalid then m.game.char.setMarkerCol(m.map_char_config.col.marker)
        if m.map_char_config.col.veh <> invalid then m.game.char.setVehCol(m.map_char_config.col.veh)

        ' no need to load at all
        if m.game.char.getVeh() <> invalid then m.game.char.setVeh(invalid)

    end sub

    object.loadhud = sub()

        if m.game.hud.config.menu.Count() < m.map_hud_config.menu.Count()
            for i = m.game.hud.config.menu.Count() to m.map_hud_config.menu.Count() - 1
                m.game.hud.config.menu.push({
                    id: i,
                    name: invalid,
                })
            end for

        else if m.game.hud.config.menu.Count() > m.map_hud_config.menu.Count()
            for i = m.map_hud_config.menu.Count() to m.game.hud.config.menu.Count() - 1
                m.game.hud.config.menu.pop()
            end for
        end if

        for i = 0 to m.map_hud_config.menu.Count() - 1
            if m.map_hud_config.menu <> invalid then m.game.hud.setMenuItemName(i, m.map_hud_config.menu[i].name)
        end for
            
    end sub


    object.updatePos = sub()

        ' position
        m.game.map.setOffsetX(m.game.screen.GetWidth() / 2 - m.game.char.getEntityX())
        m.game.map.setOffsetY(m.game.screen.GetHeight() / 2 - m.game.char.getEntityY())
    
    end sub

end sub
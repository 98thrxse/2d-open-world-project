function map_entity(object)

    object.onCreate = function(args)

        m.chooseMap()
        m.loadConfigs()

    end function

    object.chooseMap = function()
        m.map_char_config = testOne_char_config()
        m.map_obj_config = testOne_obj_config()
        m.map_npc_config = testOne_npc_config()
        m.map_terrain_config = testOne_terrain_config()
        m.map_interface_config = testOne_interface_config()
    end function

    object.loadConfigs = function()
        m.loadChar()
        m.loadNPC()
        m.loadObj()
        m.loadTerrain()
        m.loadInterface()
    end function
    
    object.loadTerrain = function()
        ' loading map config to terrain data      
        for i = 0 to m.map_terrain_config.Count() - 1
            if i > m.game.terrain.config.Count() - 1
                m.game.terrain.config.push(m.map_terrain_config[i])
            else
                if m.game.terrain.config[i].Count() < m.map_terrain_config[i].Count()
                    for j = m.game.terrain.config[i].Count() to m.map_terrain_config[i].Count() - 1
                        m.game.terrain.config[i].push({
                            id: [i, j],
                            entity: {
                                name: invalid,
                                anim: {
                                    reg: []
                                }
                                pos: {
                                    x: invalid,
                                    y: invalid
                                }
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

                ' entity
                if m.map_terrain_config[i][j].entity.name <> invalid then m.game.terrain.setEntityName(i, j, m.map_terrain_config[i][j].entity.name)
                if m.map_terrain_config[i][j].entity.anim.offset.x <> invalid then m.game.terrain.setEntityOffsetX(i, j, m.map_terrain_config[i][j].entity.anim.offset.x)
                if m.map_terrain_config[i][j].entity.anim.offset.y <> invalid then m.game.terrain.setEntityOffsetY(i, j, m.map_terrain_config[i][j].entity.anim.offset.y)
                if m.map_terrain_config[i][j].entity.anim.reg <> invalid

                    if m.game.terrain.config[i][j].entity.anim.reg.Count() < m.map_terrain_config[i][j].entity.anim.reg.Count()
                        for k = m.game.terrain.config[i][j].entity.anim.reg.Count() to m.map_terrain_config[i][j].entity.anim.reg.Count() - 1
                            m.game.terrain.config[i][j].entity.anim.reg.push("")
                        end for
        
                    end if
        
                    for k = 0 to m.map_terrain_config[i][j].entity.anim.reg.Count() - 1
                        m.game.terrain.setReg(i, j, k, m.map_terrain_config[i][j].entity.anim.reg[k])
                    end for
        
                end if

            end for
        end for
    end function


    object.loadObj = function()
        ' loading map config to obj data
        if m.game.obj.config.Count() < m.map_obj_config.Count()
            for i = m.game.obj.config.Count() to m.map_obj_config.Count() - 1
                m.game.obj.config.push({
                    id: i,                   
                    entity: {
                        name: invalid,
                        anim: {
                            alpha: invalid,
                            reg: []
                            offset: {
                                x: invalid,
                                y: invalid
                            }
                        },

                        size: {
                            width: invalid,
                            height: invalid
                        }
                    },
        
                    col: {
                        name: invalid,
                        offset: {
                            x: invalid,
                            y: invalid
                        }
                        size: {
                            width: invalid,
                            height: invalid
                        }
                    }
                })
            end for
        else if m.game.obj.config.Count() > m.map_obj_config.Count()
            for i = m.map_obj_config.Count() to m.game.obj.config.Count() - 1
                m.game.obj.config.pop()
            end for
        end if

        for i = 0 to m.map_obj_config.Count() - 1

            ' entity
            if m.map_obj_config[i].entity.name <> invalid then m.game.obj.setEntityName(i, m.map_obj_config[i].entity.name)
            if m.map_obj_config[i].entity.anim.offset.x <> invalid then m.game.obj.setEntityOffsetX(i, m.map_obj_config[i].entity.anim.offset.x)
            if m.map_obj_config[i].entity.anim.offset.y <> invalid then m.game.obj.setEntityOffsetY(i, m.map_obj_config[i].entity.anim.offset.y)
            if m.map_obj_config[i].entity.size.width <> invalid then m.game.obj.setEntityW(i, m.map_obj_config[i].entity.size.width)
            if m.map_obj_config[i].entity.size.height <> invalid then m.game.obj.setEntityH(i, m.map_obj_config[i].entity.size.height)
            if m.map_obj_config[i].entity.anim.alpha <> invalid then m.game.obj.setAlpha(i, m.map_obj_config[i].entity.anim.alpha)
            if m.map_obj_config[i].entity.anim.reg <> invalid

                if m.game.obj.config[i].entity.anim.reg.Count() < m.map_obj_config[i].entity.anim.reg.Count()
                    for j = m.game.obj.config[i].entity.anim.reg.Count() to m.map_obj_config[i].entity.anim.reg.Count() - 1
                        m.game.obj.config[i].entity.anim.reg.push("")
                    end for
    
                end if
    
                for j = 0 to m.map_obj_config[i].entity.anim.reg.Count() - 1
                    m.game.obj.setReg(i, j, m.map_obj_config[i].entity.anim.reg[j])
                end for
    
            end if


            ' col
            if m.map_obj_config[i].col.name <> invalid then m.game.obj.setColName(i, m.map_obj_config[i].col.name)
            if m.map_obj_config[i].col.offset.x <> invalid then m.game.obj.setColOffsetX(i, m.map_obj_config[i].col.offset.x)
            if m.map_obj_config[i].col.offset.y <> invalid then m.game.obj.setColOffsetY(i, m.map_obj_config[i].col.offset.y)
            if m.map_obj_config[i].col.size.width <> invalid then m.game.obj.setColW(i, m.map_obj_config[i].col.size.width)
            if m.map_obj_config[i].col.size.height <> invalid then m.game.obj.setColH(i, m.map_obj_config[i].col.size.height)
            
        end for
    end function

    object.loadNPC = function()
        ' loading map config to npc data
        if m.game.npc.config.Count() < m.map_npc_config.Count()
            for i = m.game.npc.config.Count() to m.map_npc_config.Count() - 1
                m.game.npc.config.push({
                    id: i,       
                    entity: {
                        name: invalid,
                        anim: {
                            index: invalid,
                            reg: []
                            offset: {
                                x: invalid,
                                y: invalid
                            },
                        },
                        size: {
                            width: invalid,
                            height: invalid
                        }
                    },
        
                    col: {
                        name: invalid,
                        offset: {
                            x: invalid,
                            y: invalid
                        },
                        size: {
                            width: invalid,
                            height: invalid
                        }
                    },
        
                    attrs: {
                        hp: invalid
                    }
                })
            end for
        else if m.game.npc.config.Count() > m.map_npc_config.Count()
            for i = m.map_npc_config.Count() to m.game.npc.config.Count() - 1
                m.game.npc.config.pop()
            end for
        end if

        for i = 0 to m.map_npc_config.Count() - 1

            ' attrs
            if m.map_npc_config[i].attrs.hp <> invalid then m.game.npc.setHP(i, m.map_npc_config[i].attrs.hp)

            ' entity
            if m.map_npc_config[i].entity.name <> invalid then m.game.npc.setEntityName(i, m.map_npc_config[i].entity.name)
            if m.map_npc_config[i].entity.anim.offset.x <> invalid then m.game.npc.setEntityOffsetX(i, m.map_npc_config[i].entity.anim.offset.x)
            if m.map_npc_config[i].entity.anim.offset.y <> invalid then m.game.npc.setEntityOffsetY(i, m.map_npc_config[i].entity.anim.offset.y)
            if m.map_npc_config[i].entity.size.width <> invalid then m.game.npc.setEntityW(i, m.map_npc_config[i].entity.size.width)
            if m.map_npc_config[i].entity.size.height <> invalid then m.game.npc.setEntityH(i, m.map_npc_config[i].entity.size.height)
            if m.map_npc_config[i].entity.anim.index <> invalid then m.game.npc.setIndex(i, m.map_npc_config[i].entity.anim.index)
            if m.map_npc_config[i].entity.anim.reg <> invalid

                if m.game.npc.config[i].entity.anim.reg.Count() < m.map_npc_config[i].entity.anim.reg.Count()
                    for j = m.game.npc.config[i].entity.anim.reg.Count() to m.map_npc_config[i].entity.anim.reg.Count() - 1
                        m.game.npc.config[i].entity.anim.reg.push("")
                    end for
    
                end if
    
                for j = 0 to m.map_npc_config[i].entity.anim.reg.Count() - 1
                    m.game.npc.setReg(i, j, m.map_npc_config[i].entity.anim.reg[j])
                end for
    
            end if

            ' col
            if m.map_npc_config[i].col.name <> invalid then m.game.npc.setColName(i, m.map_npc_config[i].col.name)
            if m.map_npc_config[i].col.offset.x <> invalid then m.game.npc.setColOffsetX(i, m.map_npc_config[i].col.offset.x)
            if m.map_npc_config[i].col.offset.y <> invalid then m.game.npc.setColOffsetY(i, m.map_npc_config[i].col.offset.y)
            if m.map_npc_config[i].col.size.width <> invalid then m.game.npc.setColW(i, m.map_npc_config[i].col.size.width)
            if m.map_npc_config[i].col.size.height <> invalid then m.game.npc.setColH(i, m.map_npc_config[i].col.size.height)

        end for
    end function


    object.loadChar = function()

        ' loading map config to player data

        ' xy
        if m.map_char_config.xy.offset.x <> invalid then m.game.xy.setZeroOffsetX(m.map_char_config.xy.offset.x)
        if m.map_char_config.xy.offset.y <> invalid then m.game.xy.setZeroOffsetY(m.map_char_config.xy.offset.y)

        ' entity
        if m.map_char_config.entity.name <> invalid then m.game.char.setEntityName(m.map_char_config.entity.name)
        if m.map_char_config.entity.pos.x <> invalid then m.game.char.setEntityPosX(m.map_char_config.entity.pos.x)
        if m.map_char_config.entity.pos.y <> invalid then m.game.char.setEntityPosY(m.map_char_config.entity.pos.y)
        if m.map_char_config.entity.size.width <> invalid then m.game.char.setEntityW(m.map_char_config.entity.size.width)
        if m.map_char_config.entity.size.height <> invalid then m.game.char.setEntityH(m.map_char_config.entity.size.height)
        if m.map_char_config.entity.anim.index <> invalid then m.game.char.setIndex(m.map_char_config.entity.anim.index)
        if m.map_char_config.entity.anim.alpha <> invalid then m.game.char.setAlpha(m.map_char_config.entity.anim.alpha)
        if m.map_char_config.entity.anim.time <> invalid then m.game.char.setAnimTime(m.map_char_config.entity.anim.time)
        if m.map_char_config.entity.anim.scale.x <> invalid then m.game.char.setScaleX(m.map_char_config.entity.anim.scale.x)
        if m.map_char_config.entity.anim.scale.y <> invalid then m.game.char.setScaleY(m.map_char_config.entity.anim.scale.y)
        if m.map_char_config.entity.anim.offset.x <> invalid then m.game.char.setEntityOffsetX(m.map_char_config.entity.anim.offset.x)
        if m.map_char_config.entity.anim.offset.y <> invalid then m.game.char.setEntityOffsetY(m.map_char_config.entity.anim.offset.y)
        if m.map_char_config.entity.anim.reg <> invalid

            if m.game.char.config.entity.anim.reg.Count() < m.map_char_config.entity.anim.reg.Count()
                for i = m.game.char.config.entity.anim.reg.Count() to m.map_char_config.entity.anim.reg.Count() - 1
                    m.game.char.config.entity.anim.reg.push("")
                end for

            end if

            for i = 0 to m.map_char_config.entity.anim.reg.Count() - 1
                m.game.char.setReg(i, m.map_char_config.entity.anim.reg[i])
            end for

        end if

        ' attrs
        if m.map_char_config.attrs.hp <> invalid then m.game.char.setHP(m.map_char_config.attrs.hp)
        if m.map_char_config.attrs.sp <> invalid then m.game.char.setSP(m.map_char_config.attrs.sp)
        if m.map_char_config.attrs.speed.up <> invalid then m.game.char.setUpSpeed(m.map_char_config.attrs.speed.up)
        if m.map_char_config.attrs.speed.down <> invalid then m.game.char.setDownSpeed(m.map_char_config.attrs.speed.down)
        if m.map_char_config.attrs.speed.left <> invalid then m.game.char.setLeftSpeed(m.map_char_config.attrs.speed.left)
        if m.map_char_config.attrs.speed.right <> invalid then m.game.char.setRightSpeed(m.map_char_config.attrs.speed.right)
        if m.map_char_config.attrs.damage.hp <> invalid then m.game.char.setHPDamage(m.map_char_config.attrs.damage.hp)
        if m.map_char_config.attrs.damage.sp <> invalid then m.game.char.setSPDamage(m.map_char_config.attrs.damage.sp)
        if m.map_char_config.attrs.damage.hp_time <> invalid then m.game.char.setHPDamageTime(m.map_char_config.attrs.damage.hp_time)
        if m.map_char_config.attrs.damage.sp_time <> invalid then m.game.char.setSPDamageTime(m.map_char_config.attrs.damage.sp_time)
        if m.map_char_config.attrs.regen.hp <> invalid then m.game.char.setHPRegen(m.map_char_config.attrs.regen.hp)
        if m.map_char_config.attrs.regen.sp <> invalid then m.game.char.setSPRegen(m.map_char_config.attrs.regen.sp)
        if m.map_char_config.attrs.regen.hp_time <> invalid then m.game.char.setHPRegenTime(m.map_char_config.attrs.regen.hp_time)
        if m.map_char_config.attrs.regen.sp_time <> invalid then m.game.char.setSPRegenTime(m.map_char_config.attrs.regen.sp_time)

        ' intersect
        if m.map_char_config.intersect.obj <> invalid then m.game.char.setObjIntersect(m.map_char_config.intersect.obj)


        ' col
        if m.map_char_config.col.name_up <> invalid then m.game.char.setColUpName(m.map_char_config.col.name_up)
        if m.map_char_config.col.name_down <> invalid then m.game.char.setColDownName(m.map_char_config.col.name_down)
        if m.map_char_config.col.name_left <> invalid then m.game.char.setColLeftName(m.map_char_config.col.name_left)
        if m.map_char_config.col.name_right <> invalid then m.game.char.setColRightName(m.map_char_config.col.name_right)
        if m.map_char_config.col.up <> invalid then m.game.char.setColUp(m.map_char_config.col.up)
        if m.map_char_config.col.down <> invalid then m.game.char.setColDown(m.map_char_config.col.down)
        if m.map_char_config.col.left <> invalid then m.game.char.setColLeft(m.map_char_config.col.left)
        if m.map_char_config.col.right <> invalid then m.game.char.setColRight(m.map_char_config.col.right)
        if m.map_char_config.col.npc <> invalid then m.game.char.setNPCCol(m.map_char_config.col.npc)
        if m.map_char_config.col.offset.x <> invalid then m.game.char.setColOffsetX(m.map_char_config.col.offset.x)
        if m.map_char_config.col.offset.y <> invalid then m.game.char.setColOffsetY(m.map_char_config.col.offset.y)
        if m.map_char_config.col.size.width <> invalid then m.game.char.setColW(m.map_char_config.col.size.width)
        if m.map_char_config.col.size.height <> invalid then m.game.char.setColH(m.map_char_config.col.size.height)


    end function

    object.loadInterface = function()

        if m.map_interface_config.focus.menu <> invalid
            if m.game.interface.config.focus.menu.Count() < m.map_interface_config.focus.menu.Count()
                for i = m.game.interface.config.focus.menu.Count() to m.map_interface_config.focus.menu.Count() - 1
                    m.game.interface.config.focus.menu.push("")
                end for

            else if m.game.interface.config.focus.menu.Count() > m.map_interface_config.focus.menu.Count()
                for i = m.map_interface_config.focus.menu.Count() to m.game.interface.config.focus.menu.Count() - 1
                    m.game.interface.config.focus.menu.pop()
                end for
            end if

            for i = 0 to m.map_interface_config.focus.menu.Count() - 1
                m.game.interface.setMenuItemName(i, m.map_interface_config.focus.menu[i].name)
            end for
        end if

    end function

end function
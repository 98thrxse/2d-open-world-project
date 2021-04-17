function testOne_map(object)

    object.map_char_config = testOne_char_config()
    object.map_obj_config = testOne_obj_config()
    object.map_npc_config = testOne_npc_config()
    object.map_terrain_config = testOne_terrain_config()
    

    object.onCreate = function(args)
        m.loadChar()
        m.loadNPC()
        m.loadObj()
        m.loadTerrain()
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
                                    reg: invalid
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
                if m.map_terrain_config[i][j].entity.pos.x <> invalid then m.game.terrain.setEntityPosX(i, j, m.map_terrain_config[i][j].entity.pos.x)
                if m.map_terrain_config[i][j].entity.pos.y <> invalid then m.game.terrain.setEntityPosY(i, j, m.map_terrain_config[i][j].entity.pos.y)
                if m.map_terrain_config[i][j].entity.anim.reg <> invalid then m.game.terrain.setReg(i, j, m.map_terrain_config[i][j].entity.anim.reg)
            
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
                            reg: invalid
                        },
                        pos: {
                            x: invalid,
                            y: invalid
                        }
                        size: {
                            width: invalid,
                            height: invalid
                        }
                    },
        
                    col: {
                        name: invalid,
                        pos: {
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
            if m.map_obj_config[i].entity.pos.x <> invalid then m.game.obj.setEntityPosX(i, m.map_obj_config[i].entity.pos.x)
            if m.map_obj_config[i].entity.pos.y <> invalid then m.game.obj.setEntityPosY(i, m.map_obj_config[i].entity.pos.y)
            if m.map_obj_config[i].entity.size.width <> invalid then m.game.obj.setEntityW(i, m.map_obj_config[i].entity.size.width)
            if m.map_obj_config[i].entity.size.height <> invalid then m.game.obj.setEntityH(i, m.map_obj_config[i].entity.size.height)
            if m.map_obj_config[i].entity.anim.alpha <> invalid then m.game.obj.setAlpha(i, m.map_obj_config[i].entity.anim.alpha)
            if m.map_obj_config[i].entity.anim.reg <> invalid then m.game.obj.setReg(i, m.map_obj_config[i].entity.anim.reg)

            ' col
            if m.map_obj_config[i].col.name <> invalid then m.game.obj.setColName(i, m.map_obj_config[i].col.name)
            if m.map_obj_config[i].col.pos.x <> invalid then m.game.obj.setColPosX(i, m.map_obj_config[i].col.pos.x)
            if m.map_obj_config[i].col.pos.y <> invalid then m.game.obj.setColPosY(i, m.map_obj_config[i].col.pos.y)
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
                            reg: invalid
                        },
                        pos: {
                            x: invalid,
                            y: invalid
                        },
                        size: {
                            width: invalid,
                            height: invalid
                        }
                    },
        
                    col: {
                        name: invalid,
                        pos: {
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
            if m.map_npc_config[i].entity.pos.x <> invalid then m.game.npc.setEntityPosX(i, m.map_npc_config[i].entity.pos.x)
            if m.map_npc_config[i].entity.pos.y <> invalid then m.game.npc.setEntityPosY(i, m.map_npc_config[i].entity.pos.y)
            if m.map_npc_config[i].entity.size.width <> invalid then m.game.npc.setEntityW(i, m.map_npc_config[i].entity.size.width)
            if m.map_npc_config[i].entity.size.height <> invalid then m.game.npc.setEntityH(i, m.map_npc_config[i].entity.size.height)
            if m.map_npc_config[i].entity.anim.index <> invalid then m.game.npc.setIndex(i, m.map_npc_config[i].entity.anim.index)
            if m.map_npc_config[i].entity.anim.reg <> invalid then m.game.npc.setReg(i, m.map_npc_config[i].entity.anim.reg)

            ' col
            if m.map_npc_config[i].col.name <> invalid then m.game.npc.setColName(i, m.map_npc_config[i].col.name)
            if m.map_npc_config[i].col.pos.x <> invalid then m.game.npc.setColPosX(i, m.map_npc_config[i].col.pos.x)
            if m.map_npc_config[i].col.pos.y <> invalid then m.game.npc.setColPosY(i, m.map_npc_config[i].col.pos.y)
            if m.map_npc_config[i].col.size.width <> invalid then m.game.npc.setColW(i, m.map_npc_config[i].col.size.width)
            if m.map_npc_config[i].col.size.height <> invalid then m.game.npc.setColH(i, m.map_npc_config[i].col.size.height)

        end for
    end function


    object.loadChar = function()

        ' loading map config to player data

        ' xy
        if m.map_char_config.xy.name <> invalid then m.game.char.setZeroName(m.map_char_config.xy.name)
        if m.map_char_config.xy.offset.x <> invalid then m.game.char.setZeroOffsetX(m.map_char_config.xy.offset.x)
        if m.map_char_config.xy.offset.y <> invalid then m.game.char.setZeroOffsetY(m.map_char_config.xy.offset.y)

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
        if m.map_char_config.col.up <> invalid then m.game.char.setUpCol(m.map_char_config.col.up)
        if m.map_char_config.col.down <> invalid then m.game.char.setDownCol(m.map_char_config.col.down)
        if m.map_char_config.col.left <> invalid then m.game.char.setLeftCol(m.map_char_config.col.left)
        if m.map_char_config.col.right <> invalid then m.game.char.setRightCol(m.map_char_config.col.right)
        if m.map_char_config.col.npc <> invalid then m.game.char.setNPCCol(m.map_char_config.col.npc)
        if m.map_char_config.col.offset.x <> invalid then m.game.char.setColOffsetX(m.map_char_config.col.offset.x)
        if m.map_char_config.col.offset.y <> invalid then m.game.char.setColOffsetY(m.map_char_config.col.offset.y)


    end function

end function
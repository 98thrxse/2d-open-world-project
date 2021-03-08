function testOne_map(object)

    object.map_char_config = testOne_char_config()
    object.map_obj_config = testOne_obj_config()
    object.map_npc_config = testOne_npc_config()
    object.map_terrain_config = testOne_terrain_config()
    

    object.onCreate = function(args)
    
        ' loading map config to player data
        ' pos
        if m.map_char_config.pos.x <> invalid then m.game.char.setEntityPosX(m.map_char_config.pos.x)
        if m.map_char_config.pos.y <> invalid then m.game.char.setEntityPosY(m.map_char_config.pos.y)


        ' size
        if m.map_char_config.size.width <> invalid then m.game.char.setEntityW(m.map_char_config.size.width)
        if m.map_char_config.size.height <> invalid then m.game.char.setEntityH(m.map_char_config.size.height)


        ' attributes
        if m.map_char_config.attributes.hp <> invalid then m.game.char.setHP(m.map_char_config.attributes.hp)
        if m.map_char_config.attributes.sp <> invalid then m.game.char.setSP(m.map_char_config.attributes.sp)


        ' damage
        if m.map_char_config.damage.hp <> invalid then m.game.char.setHPDamage(m.map_char_config.damage.hp)
        if m.map_char_config.damage.sp <> invalid then m.game.char.setSPDamage(m.map_char_config.damage.sp)
        if m.map_char_config.damage.hp_time <> invalid then m.game.char.setHPDamageTime(m.map_char_config.damage.hp_time)
        if m.map_char_config.damage.sp_time <> invalid then m.game.char.setSPDamageTime(m.map_char_config.damage.sp_time)


        ' regen
        if m.map_char_config.regen.hp <> invalid then m.game.char.setHPRegen(m.map_char_config.regen.hp)
        if m.map_char_config.regen.sp <> invalid then m.game.char.setSPRegen(m.map_char_config.regen.sp)
        if m.map_char_config.regen.hp_time <> invalid then m.game.char.setHPRegenTime(m.map_char_config.regen.hp_time)
        if m.map_char_config.regen.sp_time <> invalid then m.game.char.setSPRegenTime(m.map_char_config.regen.sp_time)


        ' anim
        if m.map_char_config.anim.index <> invalid then m.game.char.setIndex(m.map_char_config.anim.index)
        if m.map_char_config.anim.alpha <> invalid then m.game.char.setAlpha(m.map_char_config.anim.alpha)
        if m.map_char_config.anim.time <> invalid then m.game.char.setAnimTime(m.map_char_config.anim.time)
        

        ' intersect
        if m.map_char_config.intersect.obj <> invalid then m.game.char.setObjIntersect(m.map_char_config.intersect.obj)


        ' col
        if m.map_char_config.col.up <> invalid then m.game.char.setNPCCol(m.map_char_config.col.npc)

        if m.map_char_config.col.up <> invalid then m.game.char.setUpCol(m.map_char_config.col.up)
        if m.map_char_config.col.down <> invalid then m.game.char.setDownCol(m.map_char_config.col.down)
        if m.map_char_config.col.left <> invalid then m.game.char.setLeftCol(m.map_char_config.col.left)
        if m.map_char_config.col.right <> invalid then m.game.char.setRightCol(m.map_char_config.col.right)


        ' speed
        if m.map_char_config.speed.up <> invalid then m.game.char.setUpSpeed(m.map_char_config.speed.up)
        if m.map_char_config.speed.down <> invalid then m.game.char.setDownSpeed(m.map_char_config.speed.down)
        if m.map_char_config.speed.left <> invalid then m.game.char.setLeftSpeed(m.map_char_config.speed.left)
        if m.map_char_config.speed.right <> invalid then m.game.char.setRightSpeed(m.map_char_config.speed.right)
      


        ' loading map config to obj data
        if m.game.obj.config.Count() < m.map_obj_config.Count()
            for i = m.game.obj.config.Count() to m.map_obj_config.Count() - 1
                m.game.obj.config.push({
                    id: i,
                    anim: {
                        alpha: invalid
                    },
                    
                    entity: {
                        name: "obj_entity",
                        x: invalid,
                        y: invalid,
                        width: invalid,
                        height: invalid,
                    },
        
                    col: {
                        name: "obj_col",
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

            ' pos

            ' obj
            if m.map_obj_config[i].entity.x <> invalid then m.game.obj.setEntityPosX(i, m.map_obj_config[i].entity.x)
            if m.map_obj_config[i].entity.y <> invalid then m.game.obj.setEntityPosY(i, m.map_obj_config[i].entity.y)

            ' col
            if m.map_obj_config[i].col.x <> invalid then m.game.obj.setColPosX(i, m.map_obj_config[i].col.x)
            if m.map_obj_config[i].col.y <> invalid then m.game.obj.setColPosY(i, m.map_obj_config[i].col.y)


            ' size

            ' obj
            if m.map_obj_config[i].entity.width <> invalid then m.game.obj.setEntityW(i, m.map_obj_config[i].entity.width)
            if m.map_obj_config[i].entity.height <> invalid then m.game.obj.setEntityH(i, m.map_obj_config[i].entity.height)
            
            ' col
            if m.map_obj_config[i].col.width <> invalid then m.game.obj.setColW(i, m.map_obj_config[i].col.width)
            if m.map_obj_config[i].col.height <> invalid then m.game.obj.setColH(i, m.map_obj_config[i].col.height)

            ' anim
            
            ' alpha
            if m.map_obj_config[i].anim.alpha <> invalid then m.game.obj.setAlpha(i, m.map_obj_config[i].anim.alpha)

        end for



        ' loading map config to npc data
        if m.game.npc.config.Count() < m.map_npc_config.Count()
            for i = m.game.npc.config.Count() to m.map_npc_config.Count() - 1
                m.game.npc.config.push({
                    id: i,
                    anim: {
                        index: invalid,
                    },
        
                    entity: {
                        name: "npc_entity",
                        x: invalid,
                        y: invalid,
                        width: invalid,
                        height: invalid
                    },
        
                    col: {
                        name: "npc_col",
                        x: invalid,
                        y: invalid,
                        width: invalid,
                        height: invalid
                    },
        
                    attributes: {
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

            ' attributes
            if m.map_npc_config[i].attributes.hp <> invalid then m.game.npc.setHP(i, m.map_npc_config[i].attributes.hp)


            ' anim
            if m.map_npc_config[i].anim.index <> invalid then m.game.npc.setIndex(i, m.map_npc_config[i].anim.index)


            ' pos

            ' obj
            if m.map_npc_config[i].entity.x <> invalid then m.game.npc.setEntityPosX(i, m.map_npc_config[i].entity.x)
            if m.map_npc_config[i].entity.y <> invalid then m.game.npc.setEntityPosY(i, m.map_npc_config[i].entity.y)

            ' col
            if m.map_npc_config[i].col.x <> invalid then m.game.npc.setColPosX(i, m.map_npc_config[i].col.x)
            if m.map_npc_config[i].col.y <> invalid then m.game.npc.setColPosY(i, m.map_npc_config[i].col.y)


            ' size

            ' obj
            if m.map_npc_config[i].entity.width <> invalid then m.game.npc.setEntityW(i, m.map_npc_config[i].entity.width)
            if m.map_npc_config[i].entity.height <> invalid then m.game.npc.setEntityH(i, m.map_npc_config[i].entity.height)

            ' col
            if m.map_npc_config[i].col.width <> invalid then m.game.npc.setColW(i, m.map_npc_config[i].col.width)
            if m.map_npc_config[i].col.height <> invalid then m.game.npc.setColH(i, m.map_npc_config[i].col.height)

        end for


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
                                name: "terrain_entity",
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

                ' pos

                ' obj
                if m.map_terrain_config[i][j].entity.x <> invalid then m.game.terrain.setEntityPosX(i, j, m.map_terrain_config[i][j].entity.x)
                if m.map_terrain_config[i][j].entity.y <> invalid then m.game.terrain.setEntityPosY(i, j, m.map_terrain_config[i][j].entity.y)
            
            end for
        end for

    end function

end function
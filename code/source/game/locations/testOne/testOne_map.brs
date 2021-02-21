function testOne_map(object)

    object.map_char_config = testOne_char_config()
    object.map_obj_static_config = testOne_obj_static_config()
    object.map_npc_config = testOne_npc_config()

    object.onCreate = function(args)
    
        ' loading map config to player data

        ' pos
        if m.map_char_config.pos.x <> invalid then m.game.char.setPosX(m.map_char_config.pos.x)
        if m.map_char_config.pos.y <> invalid then m.game.char.setPosY(m.map_char_config.pos.y)


        ' size
        if m.map_char_config.size.width <> invalid then m.game.char.setW(m.map_char_config.size.width)
        if m.map_char_config.size.height <> invalid then m.game.char.setH(m.map_char_config.size.height)


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
        if m.map_char_config.anim.index <> invalid then m.game.char.setAnim(m.map_char_config.anim.index)
        if m.map_char_config.anim.time <> invalid then m.game.char.setAnimTime(m.map_char_config.anim.time)
        

        ' collider
        if m.map_char_config.collider.npc <> invalid then m.game.char.setNPCCollider(m.map_char_config.collider.npc)

        if m.map_char_config.collider.up <> invalid then m.game.char.setUpCollider(m.map_char_config.collider.up)
        if m.map_char_config.collider.down <> invalid then m.game.char.setDownCollider(m.map_char_config.collider.down)
        if m.map_char_config.collider.left <> invalid then m.game.char.setLeftCollider(m.map_char_config.collider.left)
        if m.map_char_config.collider.right <> invalid then m.game.char.setRightCollider(m.map_char_config.collider.right)


        ' speed
        if m.map_char_config.speed.up <> invalid then m.game.char.setUpSpeed(m.map_char_config.speed.up)
        if m.map_char_config.speed.down <> invalid then m.game.char.setDownSpeed(m.map_char_config.speed.down)
        if m.map_char_config.speed.left <> invalid then m.game.char.setLeftSpeed(m.map_char_config.speed.left)
        if m.map_char_config.speed.right <> invalid then m.game.char.setRightSpeed(m.map_char_config.speed.right)
      


        ' loading map config to obj data

        ' fix stas
        if m.game.obj.config.Count() <> m.map_obj_static_config.Count()
            m.game.obj.config = m.map_obj_static_config
        end if

        for i = 0 to m.map_obj_static_config.Count() - 1

            ' pos

            ' obj
            if m.map_obj_static_config[i].obj.x <> invalid then m.game.obj.setObjPosX(i, m.map_obj_static_config[i].obj.x)
            if m.map_obj_static_config[i].obj.y <> invalid then m.game.obj.setObjPosY(i, m.map_obj_static_config[i].obj.y)

            ' col
            if m.map_obj_static_config[i].obj.x <> invalid then m.game.obj.setObjPosX(i, m.map_obj_static_config[i].obj.x)
            if m.map_obj_static_config[i].obj.y <> invalid then m.game.obj.setObjPosY(i, m.map_obj_static_config[i].obj.y)


            ' size

            ' obj
            if m.map_obj_static_config[i].obj.width <> invalid then m.game.obj.setObjW(i, m.map_obj_static_config[i].obj.width)
            if m.map_obj_static_config[i].obj.height <> invalid then m.game.obj.setObjH(i, m.map_obj_static_config[i].obj.height)
            
            ' col
            if m.map_obj_static_config[i].col.width <> invalid then m.game.obj.setColW(i, m.map_obj_static_config[i].col.width)
            if m.map_obj_static_config[i].col.height <> invalid then m.game.obj.setColH(i, m.map_obj_static_config[i].col.height)

            ' anim
            
            ' alpha
            if m.map_obj_static_config[i].anim.alpha <> invalid then m.game.obj.setAlpha(i, m.map_obj_static_config[i].anim.alpha)

        end for



        ' loading map config to npc data

        ' fix stas
        if m.game.npc.config.Count() <> m.map_npc_config.Count()
            m.game.npc.config = m.map_npc_config
        end if

        for i = 0 to m.map_npc_config.Count() - 1

            ' attributes
            if m.map_npc_config[i].hp <> invalid then m.game.npc.setHP(i, m.map_npc_config[i].hp)


            ' anim
            if m.map_npc_config[i].index <> invalid then m.game.npc.setAnim(i, m.map_npc_config[i].index)


            ' pos

            ' obj
            if m.map_npc_config[i].obj.x <> invalid then m.game.npc.setObjPosX(i, m.map_npc_config[i].obj.x)
            if m.map_npc_config[i].obj.y <> invalid then m.game.npc.setObjPosY(i, m.map_npc_config[i].obj.y)

            ' col
            if m.map_npc_config[i].col.x <> invalid then m.game.npc.setColPosX(i, m.map_npc_config[i].col.x)
            if m.map_npc_config[i].col.y <> invalid then m.game.npc.setColPosY(i, m.map_npc_config[i].col.y)


            ' size

            ' obj
            if m.map_npc_config[i].obj.width <> invalid then m.game.npc.setObjW(i, m.map_npc_config[i].obj.width)
            if m.map_npc_config[i].obj.height <> invalid then m.game.npc.setObjH(i, m.map_npc_config[i].obj.height)

            ' col
            if m.map_npc_config[i].col.width <> invalid then m.game.npc.setColW(i, m.map_npc_config[i].col.width)
            if m.map_npc_config[i].col.height <> invalid then m.game.npc.setColH(i, m.map_npc_config[i].col.height)

        end for

    end function

end function
function testOne_main(object)

    object.map_config = testOne_char_config()

    object.onCreate = function(args)
        
        ' loading map config to player data

        ' pos
        if m.map_config.pos.x <> invalid then m.game.char.setPosX(m.map_config.pos.x)
        if m.map_config.pos.y <> invalid then m.game.char.setPosY(m.map_config.pos.y)


        ' attributes
        if m.map_config.attributes.hp <> invalid then m.game.char.setHP(m.map_config.attributes.hp)
        if m.map_config.attributes.sp <> invalid then m.game.char.setSP(m.map_config.attributes.sp)


        ' damage
        if m.map_config.damage.hp <> invalid then m.game.char.setHPDamage(m.map_config.damage.hp)
        if m.map_config.damage.sp <> invalid then m.game.char.setSPDamage(m.map_config.damage.sp)
        if m.map_config.damage.hp_time <> invalid then m.game.char.setHPDamageTime(m.map_config.damage.hp_time)
        if m.map_config.damage.sp_time <> invalid then m.game.char.setSPDamageTime(m.map_config.damage.sp_time)


        ' regen
        if m.map_config.regen.hp <> invalid then m.game.char.setHPRegen(m.map_config.regen.hp)
        if m.map_config.regen.sp <> invalid then m.game.char.setSPRegen(m.map_config.regen.sp)
        if m.map_config.regen.hp_time <> invalid then m.game.char.setHPRegenTime(m.map_config.regen.hp_time)
        if m.map_config.regen.sp_time <> invalid then m.game.char.setSPRegenTime(m.map_config.regen.sp_time)


        ' anim
        if m.map_config.anim.time <> invalid then m.game.char.setAnimTime(m.map_config.anim.time)
        

        ' collider
        if m.map_config.collider.npc <> invalid then m.game.char.setNPCCollider(m.map_config.collider.npc)

        if m.map_config.collider.up <> invalid then m.game.char.setUpCollider(m.map_config.collider.up)
        if m.map_config.collider.down <> invalid then m.game.char.setDownCollider(m.map_config.collider.down)
        if m.map_config.collider.left <> invalid then m.game.char.setLeftCollider(m.map_config.collider.left)
        if m.map_config.collider.right <> invalid then m.game.char.setRightCollider(m.map_config.collider.right)


        ' speed
        if m.map_config.speed.up <> invalid then m.game.char.setUpSpeed(m.map_config.speed.up)
        if m.map_config.speed.down <> invalid then m.game.char.setDownSpeed(m.map_config.speed.down)
        if m.map_config.speed.left <> invalid then m.game.char.setLeftSpeed(m.map_config.speed.left)
        if m.map_config.speed.right <> invalid then m.game.char.setRightSpeed(m.map_config.speed.right)
      


        ' createInstance
        m.game.createInstance("testOne_map")

    end function
    
end function
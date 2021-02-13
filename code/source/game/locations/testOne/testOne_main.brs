function testOne_main(object)

    object.map_config = testOne_char_config()

    object.onCreate = function(args)
        
        ' loading map config to player data

        ' pos
        if m.map_config.pos.x <> invalid then m.game.user.setPosX(m.map_config.pos.x)
        if m.map_config.pos.y <> invalid then m.game.user.setPosY(m.map_config.pos.y)


        ' attributes
        if m.map_config.attributes.hp <> invalid then m.game.user.setHP(m.map_config.attributes.hp)
        if m.map_config.attributes.sp <> invalid then m.game.user.setSP(m.map_config.attributes.sp)


        ' damage
        if m.map_config.damage.hp <> invalid then m.game.user.setHPDamage(m.map_config.damage.hp)
        if m.map_config.damage.sp <> invalid then m.game.user.setSPDamage(m.map_config.damage.sp)
        if m.map_config.damage.hp_time <> invalid then m.game.user.setHPDamageTime(m.map_config.damage.hp_time)
        if m.map_config.damage.sp_time <> invalid then m.game.user.setSPDamageTime(m.map_config.damage.sp_time)


        ' regen
        if m.map_config.regen.hp <> invalid then m.game.user.setHPRegen(m.map_config.regen.hp)
        if m.map_config.regen.sp <> invalid then m.game.user.setSPRegen(m.map_config.regen.sp)
        if m.map_config.regen.hp_time <> invalid then m.game.user.setHPRegenTime(m.map_config.regen.hp_time)
        if m.map_config.regen.sp_time <> invalid then m.game.user.setSPRegenTime(m.map_config.regen.sp_time)


        ' anim
        if m.map_config.anim.time <> invalid then m.game.user.setAnimTime(m.map_config.anim.time)
        

        ' collider
        if m.map_config.collider.npc <> invalid then m.game.user.setNPCCollider(m.map_config.collider.npc)

        if m.map_config.collider.up <> invalid then m.game.user.setUpCollider(m.map_config.collider.up)
        if m.map_config.collider.down <> invalid then m.game.user.setDownCollider(m.map_config.collider.down)
        if m.map_config.collider.left <> invalid then m.game.user.setLeftCollider(m.map_config.collider.left)
        if m.map_config.collider.right <> invalid then m.game.user.setRightCollider(m.map_config.collider.right)


        ' speed
        if m.map_config.speed.up <> invalid then m.game.user.setUpSpeed(m.map_config.speed.up)
        if m.map_config.speed.down <> invalid then m.game.user.setDownSpeed(m.map_config.speed.down)
        if m.map_config.speed.left <> invalid then m.game.user.setLeftSpeed(m.map_config.speed.left)
        if m.map_config.speed.right <> invalid then m.game.user.setRightSpeed(m.map_config.speed.right)
      


        ' createInstance
        m.game.createInstance("testOne_map")

    end function
    
end function
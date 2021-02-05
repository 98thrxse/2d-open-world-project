function testOne_main(object)

    object.data = character_data()
    object.map_config = testOne_character_config()

    object.onCreate = function(args)
        
        ' loading map config to player data

        ' attributes
        if m.map_config.attributes.hp <> invalid then character_setHP(m.map_config.attributes.hp)
        if m.map_config.attributes.sp <> invalid then character_setSP(m.map_config.attributes.sp)


        ' damage
        if m.map_config.damage.hp <> invalid then character_setHPDamage(m.map_config.damage.hp)
        if m.map_config.damage.sp <> invalid then character_setSPDamage(m.map_config.damage.sp)
        if m.map_config.damage.time <> invalid then character_setDamageTime(m.map_config.damage.time)


        ' anim
        if m.map_config.anim.time <> invalid then character_setAnimTime(m.map_config.anim.time)
        

        ' collider
        if m.map_config.collider.npc <> invalid then character_setNPCCollider(m.map_config.collider.npc)

        if m.map_config.collider.up <> invalid then character_setUpCollider(m.map_config.collider.up)
        if m.map_config.collider.down <> invalid then character_setDownCollider(m.map_config.collider.down)
        if m.map_config.collider.left <> invalid then character_setLeftCollider(m.map_config.collider.left)
        if m.map_config.collider.right <> invalid then character_setRightCollider(m.map_config.collider.right)


        ' speed
        if m.map_config.speed.up <> invalid then character_setUpSpeed(m.map_config.speed.up)
        if m.map_config.speed.down <> invalid then character_setDownSpeed(m.map_config.speed.down)
        if m.map_config.speed.left <> invalid then character_setLeftSpeed(m.map_config.speed.left)
        if m.map_config.speed.right <> invalid then character_setRightSpeed(m.map_config.speed.right)
      


        ' createInstance
        m.game.createInstance("testOne_map")

    end function
    
end function
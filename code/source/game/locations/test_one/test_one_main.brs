function test_one_main(object)

    object.data = character_data()
    object.config = test_one_character_config()

    object.onCreate = function(args)
        
        ' loading map config to player data

        ' attributes
        if m.config.attributes.hp <> invalid then character_setHP(m.config.attributes.hp)
        if m.config.attributes.sp <> invalid then character_setSP(m.config.attributes.sp)


        ' damage
        if m.config.damage.hp <> invalid then character_setHPDamage(m.config.damage.hp)
        if m.config.damage.sp <> invalid then character_setSPDamage(m.config.damage.sp)
        if m.config.damage.time <> invalid then character_setDamageTime(m.config.damage.time)


        ' anim
        if m.config.anim.time <> invalid then character_setAnimTime(m.config.anim.time)
        

        ' collider
        if m.config.collider.npc <> invalid then character_setNPCCollider(m.config.collider.npc)

        if m.config.collider.up <> invalid then character_setUpCollider(m.config.collider.up)
        if m.config.collider.down <> invalid then character_setDownCollider(m.config.collider.down)
        if m.config.collider.left <> invalid then character_setLeftCollider(m.config.collider.left)
        if m.config.collider.right <> invalid then character_setRightCollider(m.config.collider.right)


        ' speed
        if m.config.speed.up <> invalid then character_setUpSpeed(m.config.speed.up)
        if m.config.speed.down <> invalid then character_setDownSpeed(m.config.speed.down)
        if m.config.speed.left <> invalid then character_setLeftSpeed(m.config.speed.left)
        if m.config.speed.right <> invalid then character_setRightSpeed(m.config.speed.right)
      


        ' createInstance
        m.game.createInstance("test_one_map")

    end function
    
end function
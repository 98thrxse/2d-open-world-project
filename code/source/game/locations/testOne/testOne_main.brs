function testOne_main(object)

    object.data = char_data()
    object.map_config = testOne_char_config()

    object.onCreate = function(args)
        
        ' loading map config to player data

        ' attributes
        if m.map_config.attributes.hp <> invalid then char_setHP(m.map_config.attributes.hp)
        if m.map_config.attributes.sp <> invalid then char_setSP(m.map_config.attributes.sp)


        ' damage
        if m.map_config.damage.hp <> invalid then char_setHPDamage(m.map_config.damage.hp)
        if m.map_config.damage.sp <> invalid then char_setSPDamage(m.map_config.damage.sp)
        if m.map_config.damage.time <> invalid then char_setDamageTime(m.map_config.damage.time)


        ' anim
        if m.map_config.anim.time <> invalid then char_setAnimTime(m.map_config.anim.time)
        

        ' collider
        if m.map_config.collider.npc <> invalid then char_setNPCCollider(m.map_config.collider.npc)

        if m.map_config.collider.up <> invalid then char_setUpCollider(m.map_config.collider.up)
        if m.map_config.collider.down <> invalid then char_setDownCollider(m.map_config.collider.down)
        if m.map_config.collider.left <> invalid then char_setLeftCollider(m.map_config.collider.left)
        if m.map_config.collider.right <> invalid then char_setRightCollider(m.map_config.collider.right)


        ' speed
        if m.map_config.speed.up <> invalid then char_setUpSpeed(m.map_config.speed.up)
        if m.map_config.speed.down <> invalid then char_setDownSpeed(m.map_config.speed.down)
        if m.map_config.speed.left <> invalid then char_setLeftSpeed(m.map_config.speed.left)
        if m.map_config.speed.right <> invalid then char_setRightSpeed(m.map_config.speed.right)
      


        ' createInstance
        m.game.createInstance("testOne_map")

    end function
    
end function
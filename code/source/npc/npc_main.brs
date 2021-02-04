function npc_main(object)

    object.data = character_data()
    object.config = test_one_character_config()

    object.onCreate = function(args)

        ' loading npc config to player config
        
        ' collider
        character_setUpCollider(m.config.collider.up)
        character_setDownCollider(m.config.collider.down)
        character_setLeftCollider(m.config.collider.left)
        character_setRightCollider(m.config.collider.right)

        ' speed
        character_setUpSpeed(m.config.speed.up)
        character_setDownSpeed(m.config.speed.down)
        character_setLeftSpeed(m.config.speed.left)
        character_setRightSpeed(m.config.speed.right)

		' createInstance
        m.game.createInstance("npc_anim")

    end function
    
end function
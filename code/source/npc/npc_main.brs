function npc_main(object)

    object.data = character_data()
    object.settings = test_one_settings()

    object.onCreate = function(args)

        ' loading npc settings to player data
        
        ' collider
        character_setUpCollider(m.settings.collider.up)
        character_setDownCollider(m.settings.collider.down)
        character_setLeftCollider(m.settings.collider.left)
        character_setRightCollider(m.settings.collider.right)

        ' speed
        character_setUpSpeed(m.settings.speed.up)
        character_setDownSpeed(m.settings.speed.down)
        character_setLeftSpeed(m.settings.speed.left)
        character_setRightSpeed(m.settings.speed.right)

		' createInstance
        m.game.createInstance("npc_anim")

    end function
    
end function
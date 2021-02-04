function test_one_main(object)

    object.save = character_save()
    object.data = test_one_data()

    object.onCreate = function(args)
        
        ' loading map data to player data
        
        ' collider
        character_setUpCollider(m.data.collider.up)
        character_setDownCollider(m.data.collider.down)
        character_setLeftCollider(m.data.collider.left)
        character_setRightCollider(m.data.collider.right)

        ' speed
        character_setUpSpeed(m.data.speed.up)
        character_setDownSpeed(m.data.speed.down)
        character_setLeftSpeed(m.data.speed.left)
        character_setRightSpeed(m.data.speed.right)
      
        ' createInstance
        m.game.createInstance("test_one_map")

    end function
    
end function
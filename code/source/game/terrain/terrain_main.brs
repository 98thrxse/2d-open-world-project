function terrain_main(object)

    object.onCreate = function(args)

		m.game.terrain = terrain_data()
        
        ' createInstance
        m.game.createInstance("terrain_entity")
        m.game.createInstance("terrain_control")

    end function
    
end function
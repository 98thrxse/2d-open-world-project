function terrain_main(object)

    object.onCreate = function(args)

		m.game.terrain = terrain_data()
        
        ' createInstance
        m.game.createInstance("terrain_view")
        m.game.createInstance("terrain_control")

    end function
    
end function
function terrain_init(object)

	object.onCreate = function(args)

        ' defineObject
        m.game.defineObject("terrain_main", terrain_main)
        m.game.defineObject("terrain_entity", terrain_entity)
        m.game.defineObject("terrain_control", terrain_control)

        ' createInstance
        m.game.createInstance("terrain_main")
    
    end function

end function
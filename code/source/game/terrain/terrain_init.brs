function terrain_init(object)

	object.onCreate = function(args)

		m.game.terrain = terrain_data()

        ' defineObject
        m.game.defineObject("terrain_main", terrain_main)
		m.game.defineObject("terrain_media", terrain_media)
        m.game.defineObject("terrain_entity", terrain_entity)

        ' createInstance
        m.game.createInstance("terrain_main")
    
    end function

end function
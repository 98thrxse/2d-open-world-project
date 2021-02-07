function terrain_init(object)

	object.onCreate = function(args)

        ' defineObject
        m.game.defineObject("terrain_main", terrain_main)
		m.game.defineObject("terrain_media", terrain_media)
        m.game.defineObject("terrain_static", terrain_static)

        ' createInstance
        m.game.createInstance("terrain_main")
    
    end function

end function
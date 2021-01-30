function character_init(object)

	object.onCreate = function(args)

		' defineObject
		m.game.defineObject("character_main", character_main)
		m.game.defineObject("character_media", character_media)
		m.game.defineObject("character_obj", character_obj)
		m.game.defineObject("character_anim", character_anim)

		' createInstance
        m.game.createInstance("character_main")

	end function

end function
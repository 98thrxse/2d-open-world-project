function player_init(object)

	object.onCreate = function(args)

		' defineObject
		m.game.defineObject("player_main", player_main)
		m.game.defineObject("player_media", player_media)
		m.game.defineObject("player_obj", player_obj)
		m.game.defineObject("player_anim", player_anim)

		' createInstance
        m.game.createInstance("player_main")

	end function

end function
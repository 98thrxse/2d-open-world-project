function interact_init(object)

	object.onCreate = function(args)

        m.game.interact = interact_data()

		' defineObject
		m.game.defineObject("interact_main", interact_main)
		m.game.defineObject("interact_char_npc", interact_char_npc)
		m.game.defineObject("interact_char_obj", interact_char_obj)

		' createInstance
        m.game.createInstance("interact_main")

	end function

end function
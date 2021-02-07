function action_init(object)

	object.onCreate = function(args)

		' defineObject
		m.game.defineObject("action_main", action_main)
		m.game.defineObject("action_char", action_char)
		m.game.defineObject("action_char_npc", action_char_npc)

		' createInstance
        m.game.createInstance("action_main")

	end function

end function
function char_init(object)

	object.onCreate = function(args)

		' defineObject
		m.game.defineObject("char_main", char_main)
		m.game.defineObject("char_entity", char_entity)
		m.game.defineObject("char_col", char_col)
		m.game.defineObject("char_control", char_control)
		m.game.defineObject("char_anim", char_anim)

		' createInstance
        m.game.createInstance("char_main")

	end function

end function
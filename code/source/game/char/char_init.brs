function char_init(object)

	object.onCreate = function(args)

		' defineObject
		m.game.defineObject("char_main", char_main)
		m.game.defineObject("char_view", char_view)
		m.game.defineObject("char_control", char_control)

		' createInstance
        m.game.createInstance("char_main")

	end function

	object.onDestroy = function()
        m.game.destroyInstance(m.game.getInstanceByName("char_main"))
    end function

end function
function npc_init(object)

	object.onCreate = function(args)

		' defineObject
		m.game.defineObject("npc_main", npc_main)
		m.game.defineObject("npc_view", npc_view)
		m.game.defineObject("npc_control", npc_control)

		' createInstance
        m.game.createInstance("npc_main")

	end function

	object.onDestroy = function()
        m.game.destroyInstance(m.game.getInstanceByName("npc_main"))
    end function

end function
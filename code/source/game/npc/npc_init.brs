function npc_init(object)

	object.onCreate = function(args)

		' defineObject
		m.game.defineObject("npc_main", npc_main)
		m.game.defineObject("npc_entity", npc_entity)
		m.game.defineObject("npc_col", npc_col)
		m.game.defineObject("npc_control", npc_control)
		m.game.defineObject("npc_anim", npc_anim)

		' createInstance
        m.game.createInstance("npc_main")

	end function

end function
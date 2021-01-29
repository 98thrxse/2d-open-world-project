function npc_init(object)

	object.onCreate = function(args)

		' defineObject
		m.game.defineObject("npc_main", npc_main)
		m.game.defineObject("npc_media", npc_media)
		m.game.defineObject("npc_obj", npc_obj)
		m.game.defineObject("npc_anim", npc_anim)

		' createInstance
        m.game.createInstance("npc_main")

	end function

end function
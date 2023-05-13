sub npc_init(object)

	object.onCreate = sub(args as object)

		' defineObject
		m.game.defineObject("npc_main", npc_main)
		m.game.defineObject("npc_view", npc_view)
		m.game.defineObject("npc_control", npc_control)

		' createInstance
        m.game.createInstance("npc_main")

	end sub

	object.onDestroy = sub()
        m.game.destroyInstance(m.game.getInstanceByName("npc_main"))
    end sub

end sub
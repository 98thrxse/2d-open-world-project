sub interact_init(object)

	object.onCreate = sub(args as object)

		' defineObject
		m.game.defineObject("interact_main", interact_main)
		m.game.defineObject("interact_char_veh", interact_char_veh)
		m.game.defineObject("interact_char_obj", interact_char_obj)
		m.game.defineObject("interact_char_npc", interact_char_npc)
		m.game.defineObject("interact_char_marker", interact_char_marker)
		m.game.defineObject("interact_char_hud", interact_char_hud)
		m.game.defineObject("interact_obj_veh", interact_obj_veh)
		m.game.defineObject("interact_npc_veh", interact_npc_veh)

		' createInstance
        m.game.createInstance("interact_main")

	end sub

	object.onDestroy = sub()
		' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("interact_main"))
    end sub

end sub
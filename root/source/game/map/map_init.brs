sub map_init(object)
    
	object.onCreate = sub(args as object)

        ' defineObject       
	    m.game.defineObject("char_init", char_init)
        m.game.defineObject("hud_init", hud_init)
        m.game.defineObject("marker_init", marker_init)
        m.game.defineObject("npc_init", npc_init)
        m.game.defineObject("veh_init", veh_init)
        m.game.defineObject("obj_init", obj_init)
        m.game.defineObject("terrain_init", terrain_init)
        m.game.defineObject("filler_init", filler_init)
        m.game.defineObject("border_init", border_init)

        m.game.defineObject("interact_init", interact_init)

	    m.game.defineObject("map_control", map_control)
        m.game.defineObject("map_main", map_main)

        ' createInstance
        m.game.createInstance("map_main")

    end sub

    object.onDestroy = sub()
		' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("map_main"))
    end sub
    
end sub
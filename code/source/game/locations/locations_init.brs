function locations_init(object)
    
	object.onCreate = function(args)

        ' defineObject
	    m.game.defineObject("locations_main", locations_main)
	    m.game.defineObject("char_init", char_init)
	    m.game.defineObject("interface_init", interface_init)
        m.game.defineObject("obj_init", obj_init)
        m.game.defineObject("npc_init", npc_init)
        m.game.defineObject("action_init", action_init)
        m.game.defineObject("testOne_init", testOne_init)

        ' createInstance
        m.game.createInstance("locations_main")

    end function
    
end function
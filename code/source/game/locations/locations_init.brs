function locations_init(object)
    
	object.onCreate = function(args)

        ' defineObject
	    m.game.defineObject("locations_main", locations_main)
	    m.game.defineObject("character_init", character_init)
	    m.game.defineObject("interface_init", interface_init)
        m.game.defineObject("npc_init", npc_init)
        m.game.defineObject("test_one_init", test_one_init)

        ' createInstance
        m.game.createInstance("locations_main")

    end function
    
end function
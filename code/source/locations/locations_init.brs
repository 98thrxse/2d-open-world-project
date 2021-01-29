function locations_init(object)
    
	object.onCreate = function(args)

        ' defineObject
	    m.game.defineObject("player_init", player_init)
	    m.game.defineObject("npc_init", npc_init)
        m.game.defineObject("test_one_init", test_one_init)

        ' createInstance
        m.game.createInstance("player_init")
        m.game.createInstance("npc_init")
        m.game.createInstance("test_one_init")

    end function
    
end function
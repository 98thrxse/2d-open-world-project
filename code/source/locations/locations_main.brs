function locations_main(object)
    
	object.onCreate = function(args)

        ' createInstance
        m.game.createInstance("character_init")
        m.game.createInstance("npc_init")
        m.game.createInstance("test_one_init")

    end function
    
end function
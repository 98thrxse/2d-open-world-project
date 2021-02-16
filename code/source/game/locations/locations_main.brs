function locations_main(object)
    
	object.onCreate = function(args)

        ' defineObject
        m.game.defineObject("testOne_init", testOne_init)

        
	    m.game.defineObject("char_init", char_init)
        m.game.defineObject("interface_init", interface_init)
        m.game.defineObject("obj_init", obj_init)
        m.game.defineObject("npc_init", npc_init)
        m.game.defineObject("terrain_init", terrain_init)
        m.game.defineObject("action_init", action_init)



        ' createInstance
        m.game.createInstance("char_init")
        m.game.createInstance("interface_init")
        m.game.createInstance("obj_init")
        m.game.createInstance("npc_init")
        m.game.createInstance("terrain_init")
        m.game.createInstance("action_init")

        
        m.game.createInstance("testOne_init")

    end function
    
end function
function map_main(object)
    
	object.onCreate = function(args)

		m.game.map = map_data()

        ' createInstance
        m.game.createInstance("char_init")
        m.game.createInstance("interface_init")
        m.game.createInstance("obj_init")
        m.game.createInstance("npc_init")
        m.game.createInstance("terrain_init")
        
        m.game.createInstance("map_entity")

    end function


    
end function
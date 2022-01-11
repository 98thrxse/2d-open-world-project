function map_main(object)
    
	object.onCreate = function(args)

		m.game.map = map_data()

        ' createInstance
        m.game.createInstance("char_init")
        m.game.createInstance("interface_init")
        m.game.createInstance("marker_init")
        m.game.createInstance("npc_init")
        m.game.createInstance("veh_init")
        m.game.createInstance("obj_init")
        m.game.createInstance("terrain_init")
        
        m.game.createInstance("map_control")

    end function

    object.onDestroy = function()
        m.game.destroyInstance(m.game.getInstanceByName("char_init"))
        m.game.destroyInstance(m.game.getInstanceByName("interface_init"))
        m.game.destroyInstance(m.game.getInstanceByName("marker_init"))
        m.game.destroyInstance(m.game.getInstanceByName("obj_init"))
        m.game.destroyInstance(m.game.getInstanceByName("npc_init"))
        m.game.destroyInstance(m.game.getInstanceByName("veh_init"))
        m.game.destroyInstance(m.game.getInstanceByName("terrain_init"))

        m.game.destroyInstance(m.game.getInstanceByName("map_control"))
    end function
    
end function
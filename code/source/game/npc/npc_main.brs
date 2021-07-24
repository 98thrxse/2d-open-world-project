function npc_main(object)

    object.onCreate = function(args)

		m.game.npc = npc_data()

		' createInstance
        m.game.createInstance("npc_entity")
        m.game.createInstance("npc_col")
        m.game.createInstance("npc_control")
        m.game.createInstance("npc_anim")

    end function
    
end function
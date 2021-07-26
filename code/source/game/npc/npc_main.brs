function npc_main(object)

    object.onCreate = function(args)

		m.game.npc = npc_data()

		' createInstance
        m.game.createInstance("npc_view")
        m.game.createInstance("npc_control")

    end function
    
end function
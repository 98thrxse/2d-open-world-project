function npc_main(object)

    object.onCreate = function(args)

		m.game.npc = npc_data()

		' createInstance
        m.game.createInstance("npc_view")
        m.game.createInstance("npc_control")

    end function

    object.onDestroy = function()
        m.game.destroyInstance(m.game.getInstanceByName("npc_view"))
        m.game.destroyInstance(m.game.getInstanceByName("npc_control"))
    end function
    
end function
sub npc_main(object)

    object.onCreate = sub(args as object)

		m.game.npc = npc_data()

		' createInstance
        m.game.createInstance("npc_view")
        m.game.createInstance("npc_control")

    end sub

    object.onDestroy = sub()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("npc_view"))
        m.game.destroyInstance(m.game.getInstanceByName("npc_control"))
    end sub
    
end sub
function npc_main(object)

    object.onCreate = function(args)

		' createInstance
        m.game.createInstance("npc_media")
        m.game.createInstance("npc_entity")
        m.game.createInstance("npc_anim")
        m.game.createInstance("npc_act")

    end function
    
end function
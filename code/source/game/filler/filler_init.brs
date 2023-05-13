sub filler_init(object)

	object.onCreate = sub(args as object)

        ' defineObject
        m.game.defineObject("filler_main", filler_main)
        m.game.defineObject("filler_view", filler_view)
        m.game.defineObject("filler_control", filler_control)

        ' createInstance
        m.game.createInstance("filler_main")
    
    end sub

    object.onDestroy = sub()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("filler_main"))
    end sub

end sub
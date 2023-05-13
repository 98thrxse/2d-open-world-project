sub obj_init(object)

	object.onCreate = sub(args as object)

        ' defineObject
        m.game.defineObject("obj_main", obj_main)
        m.game.defineObject("obj_view", obj_view)
        m.game.defineObject("obj_control", obj_control)

        ' createInstance
        m.game.createInstance("obj_main")
    
    end sub

    object.onDestroy = sub()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("obj_main"))
    end sub

end sub
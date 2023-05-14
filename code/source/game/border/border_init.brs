sub border_init(object)

    object.onCreate = sub(args as object)
        
        ' defineObject
		m.game.defineObject("border_main", border_main)
		m.game.defineObject("border_view", border_view)
		m.game.defineObject("border_control", border_control)
        
        ' createInstance
        m.game.createInstance("border_main")

    end sub

    object.onDestroy = sub()
		' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("border_main"))
    end sub

end sub
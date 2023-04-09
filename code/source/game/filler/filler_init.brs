function filler_init(object)

	object.onCreate = function(args)

        ' defineObject
        m.game.defineObject("filler_main", filler_main)
        m.game.defineObject("filler_view", filler_view)
        m.game.defineObject("filler_control", filler_control)

        ' createInstance
        m.game.createInstance("filler_main")
    
    end function

    object.onDestroy = function()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("filler_main"))
    end function

end function
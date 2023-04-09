function filler_main(object)

    object.onCreate = function(args)

		m.game.filler = filler_data()
        
        ' createInstance
        m.game.createInstance("filler_view")
        m.game.createInstance("filler_control")

    end function

    object.onDestroy = function()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("filler_view"))
        m.game.destroyInstance(m.game.getInstanceByName("filler_control"))
    end function
    
end function
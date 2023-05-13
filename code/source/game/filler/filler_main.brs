sub filler_main(object)

    object.onCreate = sub(args as object)

		m.game.filler = filler_data()
        
        ' createInstance
        m.game.createInstance("filler_view")
        m.game.createInstance("filler_control")

    end sub

    object.onDestroy = sub()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("filler_view"))
        m.game.destroyInstance(m.game.getInstanceByName("filler_control"))
    end sub
    
end sub
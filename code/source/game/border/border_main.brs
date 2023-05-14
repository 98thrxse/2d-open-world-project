sub border_main(object)

    object.onCreate = sub(args as object)
        
        m.game.border = border_data()

        'createInstance
        m.game.createInstance("border_view")
        m.game.createInstance("border_control")

    end sub

    object.onDestroy = sub()
		' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("border_view"))
        m.game.destroyInstance(m.game.getInstanceByName("border_control"))
    end sub

end sub
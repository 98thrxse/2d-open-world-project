sub char_main(object)

    object.onCreate = sub(args as object)

		m.game.char = char_data(m.game.ver)

        ' createInstance
        m.game.createInstance("char_view")
        m.game.createInstance("char_control")

    end sub

    object.onUpdate = sub(dt as float)

        m.game.char.save()

    end sub

    object.onDestroy = sub()
		' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("char_view"))
        m.game.destroyInstance(m.game.getInstanceByName("char_control"))
    end sub
    
end sub
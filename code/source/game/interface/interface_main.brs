function interface_main(object)

    object.onCreate = function(args)
        
        m.game.interface = interface_data()

        'createInstance
        m.game.createInstance("interface_menu")
        m.game.createInstance("interface_hp")
        m.game.createInstance("interface_sp")
        m.game.createInstance("interface_control")

    end function

    object.onDestroy = function()
		' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("interface_menu"))
        m.game.destroyInstance(m.game.getInstanceByName("interface_hp"))
        m.game.destroyInstance(m.game.getInstanceByName("interface_sp"))
        m.game.destroyInstance(m.game.getInstanceByName("interface_control"))
    end function

end function
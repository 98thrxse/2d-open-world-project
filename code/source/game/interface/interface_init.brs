function interface_init(object)

    object.onCreate = function(args)
        
        ' defineObject
		m.game.defineObject("interface_main", interface_main)
		m.game.defineObject("interface_menu", interface_menu)
        m.game.defineObject("interface_hp", interface_hp)
        m.game.defineObject("interface_sp", interface_sp)
        m.game.defineObject("interface_control", interface_control)

        ' registerFont
        m.game.registerFont("pkg:/media/interface/fonts/VT323.ttf")
        
        ' createInstance
        m.game.createInstance("interface_main")

    end function

    object.onDestroy = function()
        m.game.destroyInstance(m.game.getInstanceByName("interface_main"))
    end function

end function
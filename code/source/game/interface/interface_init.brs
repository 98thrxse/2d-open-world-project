function interface_init(object)

    object.onCreate = function(args)

        ' defineObject
		m.game.defineObject("interface_main", interface_main)
		m.game.defineObject("interface_menu", interface_menu)
        m.game.defineObject("interface_hp", interface_hp)
        m.game.defineObject("interface_sp", interface_sp)

        ' registerFont
        m.game.registerFont("pkg:/media/shared/fonts/VT323.ttf")
        
        ' createInstance
        m.game.createInstance("interface_main")

    end function

end function
sub hud_init(object)

    object.onCreate = sub(args as object)
        
        ' defineObject
		m.game.defineObject("hud_main", hud_main)
		m.game.defineObject("hud_menu", hud_menu)
        m.game.defineObject("hud_hp", hud_hp)
        m.game.defineObject("hud_sp", hud_sp)
        m.game.defineObject("hud_control", hud_control)

        ' registerFont
        m.game.registerFont("pkg:/media/hud/fonts/VT323.ttf")
        
        ' createInstance
        m.game.createInstance("hud_main")

    end sub

    object.onDestroy = sub()
		' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("hud_main"))
    end sub

end sub
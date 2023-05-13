sub hud_main(object)

    object.onCreate = sub(args as object)
        
        m.game.hud = hud_data()

        'createInstance
        m.game.createInstance("hud_menu")
        m.game.createInstance("hud_hp")
        m.game.createInstance("hud_sp")
        m.game.createInstance("hud_control")

    end sub

    object.onDestroy = sub()
		' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("hud_menu"))
        m.game.destroyInstance(m.game.getInstanceByName("hud_hp"))
        m.game.destroyInstance(m.game.getInstanceByName("hud_sp"))
        m.game.destroyInstance(m.game.getInstanceByName("hud_control"))
    end sub

end sub
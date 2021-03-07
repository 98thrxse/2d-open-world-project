function interface_main(object)

    object.onCreate = function(args)

        'createInstance
        m.game.createInstance("interface_menu")
        m.game.createInstance("interface_hp")
        m.game.createInstance("interface_sp")

    end function

end function
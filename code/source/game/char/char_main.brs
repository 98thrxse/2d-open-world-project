function char_main(object)

    object.onCreate = function(args)

		m.game.char = char_data(m.game.ver)

        ' createInstance
        m.game.createInstance("char_view")
        m.game.createInstance("char_control")

    end function

    object.onUpdate = function(dt as float)

        m.game.char.save()

    end function
    
end function
function char_main(object)

    object.onCreate = function(args)

        ' createInstance
        m.game.createInstance("char_media")
        m.game.createInstance("char_entity")
        m.game.createInstance("char_col")
        m.game.createInstance("char_control")
        m.game.createInstance("char_anim")
        m.game.createInstance("char_act") 

    end function
    
end function
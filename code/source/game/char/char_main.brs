function char_main(object)

    object.onCreate = function(args)

        ' createInstance
        m.game.createInstance("char_media")
        m.game.createInstance("char_entity")
        m.game.createInstance("char_anim")
        

    end function
    
end function
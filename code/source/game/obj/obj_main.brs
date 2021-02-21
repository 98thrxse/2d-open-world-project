function obj_main(object)

    object.onCreate = function(args)
        
        ' createInstance
        m.game.createInstance("obj_media")
        m.game.createInstance("obj_static")
        m.game.createInstance("obj_anim")

    end function
    
end function
function obj_main(object)

    object.onCreate = function(args)

        m.game.obj = obj_data()
        
        ' createInstance
        m.game.createInstance("obj_entity")
        m.game.createInstance("obj_col")
        m.game.createInstance("obj_control")
        m.game.createInstance("obj_anim")

    end function
    
end function
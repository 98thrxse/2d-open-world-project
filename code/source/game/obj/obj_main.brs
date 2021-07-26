function obj_main(object)

    object.onCreate = function(args)

        m.game.obj = obj_data()
        
        ' createInstance
        m.game.createInstance("obj_view")
        m.game.createInstance("obj_control")

    end function
    
end function
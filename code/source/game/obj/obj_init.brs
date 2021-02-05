function obj_init(object)

	object.onCreate = function(args)

        ' defineObject
        m.game.defineObject("obj_main", obj_main)
		m.game.defineObject("obj_media", obj_media)
        m.game.defineObject("obj_static", obj_static)

        ' createInstance
        m.game.createInstance("obj_main")
    
    end function

end function
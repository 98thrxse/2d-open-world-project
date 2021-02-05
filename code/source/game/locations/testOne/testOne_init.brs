function testOne_init(object)

	object.onCreate = function(args)

        ' defineObject
        m.game.defineObject("testOne_main", testOne_main)
        m.game.defineObject("testOne_media", testOne_media)
        m.game.defineObject("testOne_static_obj", testOne_static_obj)
        m.game.defineObject("testOne_map", testOne_map)

        ' createInstance
        m.game.createInstance("testOne_main")
    
    end function

end function
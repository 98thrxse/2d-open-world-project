function test_one_init(object)

	object.onCreate = function(args)

        ' defineObject
        m.game.defineObject("test_one_main", test_one_main)
        m.game.defineObject("test_one_media", test_one_media)
        m.game.defineObject("test_one_obj", test_one_obj)
        m.game.defineObject("test_one_map", test_one_map)

        ' createInstance
        m.game.createInstance("test_one_main")
    
    end function

end function
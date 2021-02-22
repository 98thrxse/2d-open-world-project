function testOne_init(object)

	object.onCreate = function(args)

        m.game.map = testOne_data()

        ' defineObject
        m.game.defineObject("testOne_main", testOne_main)
        m.game.defineObject("testOne_map", testOne_map)

        ' createInstance
        m.game.createInstance("testOne_main")
    
    end function

end function
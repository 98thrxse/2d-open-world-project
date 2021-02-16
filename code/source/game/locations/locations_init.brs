function locations_init(object)
    
	object.onCreate = function(args)

        ' defineObject
	    m.game.defineObject("locations_main", locations_main)

        ' createInstance
        m.game.createInstance("locations_main")

    end function
    
end function
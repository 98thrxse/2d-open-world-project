function marker_main(object)
    
	object.onCreate = function(args)

        m.game.marker = marker_data()

        ' createInstance
        m.game.createInstance("marker_transition")
        m.game.createInstance("marker_control")

    end function
    
end function
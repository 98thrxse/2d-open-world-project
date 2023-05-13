sub game_init(object)
    
	object.onCreate = sub(args as object)

        ' test
        ' readInternet = createObject("roUrlTransfer")
        ' readInternet.setUrl("http://192.168.0.106:5500/code/configs/config.json")
        ' myText = ParseJson(readInternet.GetToString())
        ' print "Text from server: ";myText.text

        ' defineObject
	    m.game.defineObject("game_main", game_main)
        
	    m.game.defineObject("map_init", map_init)

        ' createInstance
        m.game.createInstance("game_main")

    end sub
    
end sub
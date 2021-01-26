function player_obj(object)

  object.onCreate = function(args)

    ' createInstance
		media_wnd = m.game.createInstance("player_media")

		' window initialization
	  stand_front_region = media_wnd.stand_front_region
	  stand_back_region = media_wnd.stand_back_region
	  stand_side_region = media_wnd.stand_side_region
	  walk_side1_region = media_wnd.walk_side1_region
    walk_side2_region = media_wnd.walk_side2_region

  ' addAnimatedImage
    m.obj = m.addAnimatedImage("player_obj", [stand_front_region, stand_back_region, stand_side_region, walk_side1_region, walk_side2_region], { index: 0 })

    ' playerPos
    m.x = 640
    m.y = 360

  end function
    
end function
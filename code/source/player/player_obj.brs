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
    m.obj = m.addAnimatedImage("player_obj", [stand_front_region, stand_back_region, stand_side_region, walk_side1_region, walk_side2_region], { index: 0
      offset_x: 640,
      offset_y: 360
    })

    ' addColliderRectangle
    m.addColliderRectangle("player_col_up", m.obj.offset_x + 3, m.obj.offset_y + stand_side_region.GetHeight() / 2, stand_side_region.GetWidth() - 6, 1)
    m.addColliderRectangle("player_col_down", m.obj.offset_x + 3, m.obj.offset_y + stand_side_region.GetHeight(), stand_side_region.GetWidth() - 6, 1)
    m.addColliderRectangle("player_col_left", m.obj.offset_x, m.obj.offset_y + stand_side_region.GetHeight() / 2 + 3, 1, stand_side_region.GetHeight() / 2 - 6)
    m.addColliderRectangle("player_col_right", m.obj.offset_x + stand_side_region.GetWidth(), m.obj.offset_y + stand_side_region.GetHeight() / 2 + 3, 1, stand_side_region.GetHeight() / 2 - 6)

  end function

  object.onDrawEnd = function(canvas as object)

    ' test addColliderRectangle
    canvas.DrawRect(m.obj.offset_x + 3, m.obj.offset_y + 28, 48 - 6, 1, &hFFFFFFFF)
    canvas.DrawRect(m.obj.offset_x + 3, m.obj.offset_y + 56, 48 - 6, 1, &hFFFFFFFF)
    canvas.DrawRect(m.obj.offset_x, m.obj.offset_y + 28 + 3, 1, 28 - 6, &hFFFFFFFF)
    canvas.DrawRect(m.obj.offset_x + 48, m.obj.offset_y + 28 + 3, 1, 28 - 6, &hFFFFFFFF)

  end function
    
end function
function character_obj(object)


  object.onCreate = function(args)

    ' createInstance
    m.media_wnd = m.game.createInstance("character_media")
    
		' window initialization
    stand_front_region = m.media_wnd.stand_front_region
    stand_back_region = m.media_wnd.stand_back_region
    stand_side_region = m.media_wnd.stand_side_region
    
    walk_front1_region = m.media_wnd.walk_front1_region
    walk_front2_region = m.media_wnd.walk_front2_region
    walk_back1_region = m.media_wnd.walk_back1_region
    walk_back2_region = m.media_wnd.walk_back2_region
    walk_side1_region = m.media_wnd.walk_side1_region
    walk_side2_region = m.media_wnd.walk_side2_region

  ' addAnimatedImage
    m.obj = m.addAnimatedImage("character_obj", [stand_front_region, stand_back_region, stand_side_region, walk_front1_region, walk_front2_region, walk_back1_region, walk_back2_region, walk_side1_region, walk_side2_region], { index: 0
      offset_x: 640,
      offset_y: 360
    })

    ' addColliderRectangle
    m.addColliderRectangle("character_col_up", m.obj.offset_x + 3, m.obj.offset_y + stand_side_region.GetHeight() / 2, stand_side_region.GetWidth() - 6, 1)
    m.addColliderRectangle("character_col_down", m.obj.offset_x + 3, m.obj.offset_y + stand_side_region.GetHeight(), stand_side_region.GetWidth() - 6, 1)
    m.addColliderRectangle("character_col_left", m.obj.offset_x, m.obj.offset_y + stand_side_region.GetHeight() / 2 + 3, 1, stand_side_region.GetHeight() / 2 - 6)
    m.addColliderRectangle("character_col_right", m.obj.offset_x + stand_side_region.GetWidth(), m.obj.offset_y + stand_side_region.GetHeight() / 2 + 3, 1, stand_side_region.GetHeight() / 2 - 6)

  end function

  object.onButton = function(code as integer)

		' pressed
    if code = 4 ' left
      if m.obj.scale_x <> -1.0
        m.obj.offset_x += m.media_wnd.stand_front_region.GetWidth()
        m.obj.scale_x = -1.0

      end if

		else if code = 5 ' right
      if m.obj.scale_x <> 1.0
        m.obj.offset_x -= m.media_wnd.stand_front_region.GetWidth()
        m.obj.scale_x = 1.0

      end if
      
		end if

	end function
    
end function
function char_entity(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.media_wnd = m.game.getInstanceByName("char_media")
    
  ' addAnimatedImage
    m.entity = m.addAnimatedImage("char_entity", [m.media_wnd.stand_back_region, m.media_wnd.stand_front_region, m.media_wnd.stand_side_region, m.media_wnd.walk_back1_region, m.media_wnd.walk_back2_region, m.media_wnd.walk_front1_region, m.media_wnd.walk_front2_region, m.media_wnd.walk_side1_region, m.media_wnd.walk_side2_region, m.media_wnd.beaten_region, m.media_wnd.attack_side_region, m.media_wnd.fist_attack1_region, m.media_wnd.fist_attack2_region, m.media_wnd.fist_attack3_region, m.media_wnd.fist_attack4_region, m.media_wnd.fist_attack5_region, m.media_wnd.fist_attack6_region, m.media_wnd.leg_attack1_region, m.media_wnd.leg_attack2_region, m.media_wnd.leg_attack3_region], { index: m.game.char.getIndex()
      offset_x: 640 - m.game.char.getEntityW() / 2,
      offset_y: 360 - m.game.char.getEntityH() / 2,
      alpha: m.game.char.getAlpha()
    })

    ' addColliderRectangle
    m.addColliderRectangle("char_col_up", m.entity.offset_x + 3, m.entity.offset_y, m.game.char.getEntityW() - 6, 1)
    m.addColliderRectangle("char_col_down", m.entity.offset_x + 3, m.entity.offset_y + m.game.char.getEntityH(), m.game.char.getEntityW() - 6, 1)
    m.addColliderRectangle("char_col_left", m.entity.offset_x, m.entity.offset_y + 3, 1, m.game.char.getEntityH() - 6)
    m.addColliderRectangle("char_col_right", m.entity.offset_x + m.game.char.getEntityW() - 1, m.entity.offset_y + 3, 1, m.game.char.getEntityH() - 6)
  
  end function

  
  ' object.onDrawEnd = function(canvas)

  '   canvas.DrawRect(m.entity.offset_x + 3, m.entity.offset_y, m.game.char.getEntityW() - 6, 1, &hFFFFFFFF)
  '   canvas.DrawRect(m.entity.offset_x + 3, m.entity.offset_y + m.game.char.getEntityH(), m.game.char.getEntityW() - 6, 1, &hFFFFFFFF)
  '   canvas.DrawRect(m.entity.offset_x, m.entity.offset_y + 3, 1, m.game.char.getEntityH() - 6, &hFFFFFFFF)
  '   canvas.DrawRect(m.entity.offset_x + m.game.char.getEntityW() - 1, m.entity.offset_y + 3, 1, m.game.char.getEntityH() - 6, &hFFFFFFFF)

  ' end function


  object.onButton = function(code as integer)

		' pressed
    if code = 2 ' up
      if m.entity.scale_x <> 1.0
        m.entity.offset_x -= m.game.char.getEntityW()
      end if
      m.entity.scale_x = 1.0

    else if code = 3 ' down
      if m.entity.scale_x <> 1.0
        m.entity.offset_x -= m.game.char.getEntityW()
      end if
      m.entity.scale_x = 1.0

    else if code = 4 ' left
      if m.entity.scale_x <> -1.0
        m.entity.offset_x += m.game.char.getEntityW()
        m.entity.scale_x = -1.0

      end if

		else if code = 5 ' right
      if m.entity.scale_x <> 1.0
        m.entity.offset_x -= m.game.char.getEntityW()
        m.entity.scale_x = 1.0

      end if
      
		end if

	end function
    
end function
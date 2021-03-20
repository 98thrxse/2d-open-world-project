function char_entity(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.media_wnd = m.game.getInstanceByName("char_media")
    
    m.createXY()
    m.onSpawn()

  end function


  object.createXY = function()
    m.xy = m.addImage("XY", "", {
      offset_x: 0,
      offset_y: 0
    })
  end function

  
  object.onSpawn = function()
    ' addAnimatedImage
    m.entity = m.addAnimatedImage("char_entity", [m.media_wnd.stand_back_region, m.media_wnd.stand_front_region, m.media_wnd.stand_side_region, m.media_wnd.walk_back1_region, m.media_wnd.walk_back2_region, m.media_wnd.walk_front1_region, m.media_wnd.walk_front2_region, m.media_wnd.walk_side1_region, m.media_wnd.walk_side2_region, m.media_wnd.hp_zero_region, m.media_wnd.sp_zero_region, m.media_wnd.attack_side_region, m.media_wnd.attack_fist1_region, m.media_wnd.attack_fist2_region, m.media_wnd.attack_fist3_region, m.media_wnd.attack_fist4_region, m.media_wnd.attack_fist5_region, m.media_wnd.attack_fist6_region, m.media_wnd.attack_leg1_region, m.media_wnd.attack_leg2_region, m.media_wnd.attack_leg3_region], { index: m.game.char.getIndex()
      offset_x: 640 - m.game.char.getEntityW() / 2,
      offset_y: 360 - m.game.char.getEntityH() / 2,
      alpha: m.game.char.getAlpha()
    })

  end function
    
end function
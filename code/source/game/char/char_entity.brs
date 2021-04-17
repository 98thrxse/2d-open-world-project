function char_entity(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.media_wnd = m.game.getInstanceByName("char_media")
    
    m.createXY()
    m.entityGen()

  end function


  object.createXY = function()
    m.xy = m.addImage(m.game.char.getZeroName(), "", {
      offset_x: m.game.char.getZeroOffsetX(),
      offset_y: m.game.char.getZeroOffsetY()
    })
  end function

  
  object.entityGen = function()
    ' addAnimatedImage
    m.addAnimatedImage(m.game.char.getEntityName(), [m.media_wnd.stand_back1_region, m.media_wnd.stand_front1_region, m.media_wnd.stand_side1_region, m.media_wnd.walk_back1_region, m.media_wnd.walk_back2_region, m.media_wnd.walk_front1_region, m.media_wnd.walk_front2_region, m.media_wnd.walk_side1_region, m.media_wnd.walk_side2_region, m.media_wnd.hp_zero_region, m.media_wnd.sp_zero_region, m.media_wnd.stand_side2_region, m.media_wnd.attack_fist1_region, m.media_wnd.attack_fist2_region, m.media_wnd.attack_fist3_region, m.media_wnd.attack_fist4_region, m.media_wnd.attack_fist5_region, m.media_wnd.attack_fist6_region, m.media_wnd.attack_leg1_region, m.media_wnd.attack_leg2_region, m.media_wnd.attack_leg3_region], { index: m.game.char.getIndex()
      offset_x: m.game.char.getEntityOffsetX(),
      offset_y: m.game.char.getEntityOffsetY(),
      alpha: m.game.char.getAlpha()
      scale_x: m.game.char.getScaleX()
      scale_y: m.game.char.getScaleY()
    })

  end function
    
end function
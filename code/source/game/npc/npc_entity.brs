function npc_entity(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.media_wnd = m.game.getInstanceByName("npc_media")

    m.entityXY()

  end function


  object.entityXY = function()
    ' position
    m.x = m.game.screen.GetWidth() / 2 - m.game.char.getEntityPosX()
    m.y = m.game.screen.GetHeight() / 2 - m.game.char.getEntityPosY()
  end function


  object.entityGen = function()

    ' loading map config to create npc
    for i = 0 to m.game.npc.config.Count() - 1
      if m.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + m.game.npc.config[i].id.toStr()) = invalid
        ' addAnimatedImage
        m.addAnimatedImage(m.game.npc.config[i].entity.name.toStr() + "_" + m.game.npc.config[i].id.toStr(), [m.media_wnd.stand_back_region, m.media_wnd.stand_front_region, m.media_wnd.stand_side_region, m.media_wnd.walk_back1_region, m.media_wnd.walk_back2_region, m.media_wnd.walk_front1_region, m.media_wnd.walk_front2_region, m.media_wnd.walk_side1_region, m.media_wnd.walk_side2_region, m.media_wnd.hp_zero_region, m.media_wnd.sp_zero_region, m.media_wnd.attack_side_region, m.media_wnd.attack_fist1_region, m.media_wnd.attack_fist2_region, m.media_wnd.attack_fist3_region, m.media_wnd.attack_fist4_region, m.media_wnd.attack_fist5_region, m.media_wnd.attack_fist6_region, m.media_wnd.attack_leg1_region, m.media_wnd.attack_leg2_region, m.media_wnd.attack_leg3_region], { index: m.game.npc.getIndex(i)
          offset_x: m.game.npc.getEntityPosX(i),
          offset_y: m.game.npc.getEntityPosY(i)
        })

      end if
      
    end for

  end function
  

  object.onUpdate = function(dt as float)

    m.entityGen()

  end function
      
end function
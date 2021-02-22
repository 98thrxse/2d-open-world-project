function npc_entity(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.media_wnd = m.game.getInstanceByName("npc_media")

    ' position
    m.x = m.game.screen.GetWidth() / 2 - m.game.char.getEntityPosX()
    m.y = m.game.screen.GetHeight() / 2 - m.game.char.getEntityPosY()

  end function


  object.entityGen = function()

    ' loading map config to create npc
    for i = 0 to m.game.npc.config.Count() - 1
      if m.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + m.game.npc.config[i].id.toStr()) = invalid
        ' addAnimatedImage
        m.addAnimatedImage(m.game.npc.config[i].entity.name.toStr() + "_" + m.game.npc.config[i].id.toStr(), [m.media_wnd.stand_back_region, m.media_wnd.stand_front_region, m.media_wnd.stand_side_region, m.media_wnd.walk_back1_region, m.media_wnd.walk_back2_region, m.media_wnd.walk_front1_region, m.media_wnd.walk_front2_region, m.media_wnd.walk_side1_region, m.media_wnd.walk_side2_region, m.media_wnd.beaten_region, m.media_wnd.attack_side_region, m.media_wnd.fist_attack1_region, m.media_wnd.fist_attack2_region, m.media_wnd.fist_attack3_region, m.media_wnd.fist_attack4_region, m.media_wnd.fist_attack5_region, m.media_wnd.fist_attack6_region, m.media_wnd.leg_attack1_region, m.media_wnd.leg_attack2_region, m.media_wnd.leg_attack3_region], { index: m.game.npc.getAnim(i)
          offset_x: m.game.npc.getEntityPosX(i),
          offset_y: m.game.npc.getEntityPosY(i)
        })

      end if

      if m.colliders[m.game.npc.config[i].col.name.toStr() + "_" + m.game.npc.config[i].id.toStr()] = invalid
        ' addColliderRectangle
        m.addColliderRectangle(m.game.npc.config[i].col.name.toStr() + "_" + m.game.npc.config[i].id.toStr(), m.game.npc.getColPosX(i), m.game.npc.getColPosY(i), m.game.npc.getColW(i), m.game.npc.getColH(i))
      
      end if
      
    end for

  end function


  object.posXY = function()

    m.game.char.setEntityPosX(m.game.screen.GetWidth() / 2 - m.x)
    m.game.char.setEntityPosY(m.game.screen.GetHeight() / 2 - m.y)

  end function

  object.onUpdate = function(dt as float)

    m.posXY()
    m.entityGen()

  end function

  object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

    if other_instance.name = "char_entity" and other_collider_name = "char_col_up"
      m.game.map.setCharNPCCol(collider_name)

    else if other_instance.name = "char_entity" and other_collider_name = "char_col_down"
      m.game.map.setCharNPCCol(collider_name)

    else if other_instance.name = "char_entity" and other_collider_name = "char_col_left"
      m.game.map.setCharNPCCol(collider_name)

    else if other_instance.name = "char_entity" and other_collider_name = "char_col_right"
      m.game.map.setCharNPCCol(collider_name)

    end if

  end function
  
  object.onButton = function(code as integer)

    ' held
    if code = 1002 ' up

      if m.game.char.getUpCol() = false
        m.y += m.game.char.getUpSpeed()

      end if
                    
    else if code = 1003 ' down

      if m.game.char.getDownCol() = false
        m.y -= m.game.char.getDownSpeed()

      end if
        
        
    else if code = 1004 ' left

      if m.game.char.getLeftCol() = false
        m.x += m.game.char.getLeftSpeed()

      end if
        
    else if code = 1005 ' right

      if m.game.char.getRightCol() = false
        m.x -= m.game.char.getRightSpeed()

      end if
        
    end if

    ' released
    if code = 102
      m.game.map.setCharNPCCol(invalid)

    else if code = 103
      m.game.map.setCharNPCCol(invalid)

    else if code = 104
      m.game.map.setCharNPCCol(invalid)


    else if code = 105
      m.game.map.setCharNPCCol(invalid)

    end if

  end function
      
end function